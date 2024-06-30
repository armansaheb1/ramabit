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
from ippanel import Client


def sms(date = False , text = False , pattern = 'gf9zbtg61v' ):
    try:
        sms = Client("qsVtNKDEKtFZ9wgS4o1Vw81Pjt-C3m469UJxCsUqtBA=")
    
        if pattern == 'r4hxan3byx' or pattern == 'tfpvvl8beg'  :
            pattern_values = {
        "text": text,
        }
        else :
            pattern_values = {
        "name": "کاربر",
        }
    
        bulk_id = sms.send_pattern(
            f"{pattern}",    # pattern code
            "+983000505",      # originator
            "+989183553490",  # recipient
            pattern_values,  # pattern values
        )
    
        message = sms.get_message(bulk_id)
        print(message)
        print(f"+98999999999")
        return True
    except:
        pass

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
                user=ChatUser.objects.get(id=1), chat_session=chat_session, message=message, aseen=True
            )
        else:
            ChatSessionMessage.objects.create(
                user=chat_session.owner, chat_session=chat_session, message=message, seen=True
            )
        sms()
        messages = [chat_session_message.to_json() 
            for chat_session_message in chat_session.messages.all()]
        notseen = 0
        for item in chat_session.messages.all():
            if not item.seen:
                notseen = notseen + 1
        return Response ({
            'status': 'SUCCESS', 'uri': chat_session.uri,'messages': messages, 'message': message,
            'user': chat_session.owner.name
        })

class user(APIView):
    authentication_classes = [SessionAuthentication, BasicAuthentication, authentication.TokenAuthentication ]
    permission_classes = [AllowAny]
    def post(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            user, _ = ChatUser.objects.get_or_create(mobile = request.user.mobile, name=request.user.username, email= request.user.email)
            user.save()
            user2, _ = ChatSession.objects.get_or_create(owner = user)
            return Response({'uri' : user2.uri , 'username' : request.user.username, 'mobile' : request.user.mobile})
        else :
            user, _ = ChatUser.objects.get_or_create(mobile = request.data['mobile'], name = request.data['name'], email =request.data['email'])
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
        user = ChatSession.objects.all().order_by('-update_date')
        serializer = AdminChatSerializer(user , many=True)
        return Response(serializer.data)


