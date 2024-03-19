
from django.contrib import admin
from django.urls import include, path 
from django.conf.urls.static import static
from django.conf import settings


urlpatterns = [
    path("admin/", admin.site.urls),
    path('api/v1/', include('djoser.urls')),
    path('api/v1/', include('djoser.urls.authtoken')),
    path("old/", include("auctions.urls")),
    path("api/v1/", include("api.urls")),
] + static(settings.MEDIA_URL, document_root = settings.MEDIA_ROOT)+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
