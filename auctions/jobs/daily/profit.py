from django_extensions.management.jobs import DailyJob

class Job(DailyJob):
    help = "Django Daily Cleanup Job"

    def execute(self):
        print('Hi')