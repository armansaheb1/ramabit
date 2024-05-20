from django.contrib import admin
from .models import ChatSession , ChatSessionMessage, ChatUser
# Register your models here.

admin.site.register(ChatSession)
admin.site.register(ChatSessionMessage)
admin.site.register(ChatUser)