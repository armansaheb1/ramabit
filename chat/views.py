from django.shortcuts import render
from django.contrib.auth import get_user_model

from .models import (
    ChatSession, ChatSessionMessage, deserialize_user, ChatUser
)
from .serializer import AdminChatSerializer
from rest_framework import status
from rest_framework import authentication
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import AllowAny
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import permissions
from rest_framework import status


class ChatSessionMessageView(APIView):
    authentication_classes = [SessionAuthentication, BasicAuthentication, authentication.TokenAuthentication ]
    permission_classes = [AllowAny]

    def get(self, request, *args, **kwargs):
        uri = kwargs['uri']

        chat_session = ChatSession.objects.get(uri=uri)
        messages = [chat_session_message.to_json() 
            for chat_session_message in chat_session.messages.all()]
        notseen = 0
        for item in chat_session.messages.all():
            if not item.seen:
                notseen = notseen + 1
        return Response({
            'id': chat_session.id, 'uri': chat_session.uri,
            'messages': messages, 'notseen' : notseen
        })

    def post(self, request, *args, **kwargs):
        uri = kwargs['uri']
        message = request.data['message']
        chat_session = ChatSession.objects.get(uri=uri)
            
        if request.user.is_staff:
            ChatSessionMessage.objects.create(
                user=chat_session.owner, chat_session=chat_session, message=message, aseen=True
            )
        else:
            ChatSessionMessage.objects.create(
                user=chat_session.owner, chat_session=chat_session, message=message, seen=True
            )
        return Response ({
            'status': 'SUCCESS', 'uri': chat_session.uri, 'message': message,
            'user': chat_session.owner.name
        })

class user(APIView):
    authentication_classes = [SessionAuthentication, BasicAuthentication, authentication.TokenAuthentication ]
    permission_classes = [AllowAny]
    def post(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            user, _ = ChatUser.objects.get_or_create(mobile = request.user.mobile, name=request.user.username)
            user.save()
            user2, _ = ChatSession.objects.get_or_create(owner = user)
            return Response({'uri' : user2.uri , 'username' : request.user.username, 'mobile' : request.user.mobile})
        else :
            user, _ = ChatUser.objects.get_or_create(mobile = request.data['mobile'], name = request.data['name'])
            user2, _ = ChatSession.objects.get_or_create(owner = user)
            return Response({'uri' : user2.uri , 'username' : user.name, 'mobile' : user.mobile})

class seen(APIView):
    authentication_classes = [SessionAuthentication, BasicAuthentication, authentication.TokenAuthentication ]
    permission_classes = [AllowAny]
    def get(self, request, uri, *args, **kwargs):
        if request.user.is_staff:
            chat_session = ChatSession.objects.get(uri=uri)
            messages = chat_session.messages.all()
            for item in messages:
                item.aseen = True
                item.save()
            return Response(True)
        chat_session = ChatSession.objects.get(uri=uri)
        messages = chat_session.messages.all()
        for item in messages:
            item.seen = True
            item.save()
        return Response(True)

class adminchat(APIView):
    authentication_classes = [SessionAuthentication, BasicAuthentication, authentication.TokenAuthentication ]
    permission_classes = [AllowAny]
    
    def get(self, request, *args, **kwargs):
        user = ChatSession.objects.all()
        serializer = AdminChatSerializer(user , many=True)
        return Response(serializer.data)


