from django.db import models

from uuid import uuid4

from django.contrib.auth import get_user_model
from django.utils import timezone

User = get_user_model()

class ChatUser(models.Model):
    name = models.CharField(max_length = 100,unique = True)
    mobile = models.CharField(max_length = 100, null =True)
    email = models.EmailField(max_length = 100, null =True)
    


def deserialize_user(user):
    """Deserialize user instance to JSON."""
    return {
        'id': user.id, 'username': user.username, 'mobile': user.mobile,
    }


class TrackableDateModel(models.Model):
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


def _generate_unique_uri():
    """Generates a unique uri for the chat session."""
    return str(uuid4()).replace('-', '')[:15]


class ChatSession(TrackableDateModel):

    owner = models.ForeignKey(ChatUser, on_delete=models.PROTECT, null=True)
    name = models.CharField(max_length=100,null=True)
    username = models.CharField(max_length=100,null=True)
    uri = models.URLField(default=_generate_unique_uri)
    update_date = models.DateTimeField(auto_now=True)

    def get_user(self):
        return self.owner.name
        
    def get_mobile(self):
        return self.owner.mobile
        
    def get_email(self):
        return self.owner.email

    def get_seen(self):
        notseen = 0
        for item in self.messages.all():
            if not item.aseen:
                notseen = notseen + 1
        return notseen

class ChatSessionMessage(TrackableDateModel):

    user = models.ForeignKey(ChatUser, on_delete=models.CASCADE , null=True)
    chat_session = models.ForeignKey(
        ChatSession, related_name='messages', on_delete=models.CASCADE
    )
    message = models.TextField(max_length=2000)
    seen = models.BooleanField(default=False)
    aseen = models.BooleanField(default=False)

    def to_json(self):
        return {'user': self.user.name, 'message': self.message}
    


class ChatRoom(models.Model):
    user1 = models.ForeignKey(ChatUser , related_name='chats1' , on_delete=models.CASCADE)
    user2 = models.ForeignKey(ChatUser , related_name='chats2' , on_delete=models.CASCADE)
    date = models.DateTimeField(default=timezone.now)
    last_update = models.DateTimeField(default=timezone.now)
    read1 = models.BooleanField(default=True)
    read2 = models.BooleanField(default=False)
    unread1 = models.IntegerField()
    unread2 = models.IntegerField()

    def get_user1(self):
        return self.user1.name

    def get_user2(self):
        return self.user2.name


class ChatText(models.Model):
    user = models.ForeignKey(ChatUser , related_name='chattexts' , on_delete=models.CASCADE)
    room = models.ForeignKey(ChatRoom, related_name='rooms', on_delete=models.CASCADE) 
    text = models.CharField(max_length=100)
    date = models.DateTimeField(default=timezone.now)

    def get_user(self):
        return self.user.name
