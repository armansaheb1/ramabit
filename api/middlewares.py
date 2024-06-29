from django.utils import timezone

from auctions import models


class UpdateLastActivityMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        return self.get_response(request)
        
    def process_view(self, request, view_func, view_args, view_kwargs):
        assert hasattr(request, 'user'), 'The UpdateLastActivityMiddleware requires authentication middleware to be installed.'
        if request.user.is_authenticated:
            time , _ = models.timer.objects.get_or_create(user=request.user)
            if (timezone.now() - time.date).total_seconds() / 60 > 30:
                pass
            else:
                models.timer.objects.filter(user=request.user) \
                               .update(date=timezone.now())