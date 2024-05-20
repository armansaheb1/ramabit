from rest_framework import serializers
from .models import ChatSession, ChatRoom, ChatText, ChatSessionMessage

class AdminChatSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChatSession
        depth = 1
        fields = (
            "id",
            "owner",
            "uri",
            "username",
            "name",
        )

class ChatRoomSerializer(serializers.ModelSerializer):

    def to_representation(self, instance):
        data = super(ChatRoomSerializer, self).to_representation(instance)
        if len(ChatText.objects.filter(room = instance.id).last().text )> 20:
            data['last_message'] = ChatText.objects.filter(room = instance.id).last().text[0:20] + '...'
        else:
            data['last_message'] = ChatText.objects.filter(room = instance.id).last().text
        return data

    class Meta:
        model = ChatRoom
        fields =  (
            "id",
            "user1", 
            "user2",
            "date",
            "last_update",
            "read1",
            "read2",
            "get_user1",
            "get_user2",
            "unread1",
            "unread2",
        )


class ChatTextSerializer(serializers.ModelSerializer):

    class Meta:
        model = ChatText
        fields =  (
            "user", 
            "room",
            "text",
            "date",
            "get_user"
        )