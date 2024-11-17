from django.urls import path
from . import views  # Import views from the same directory

urlpatterns = [
    # Example route
    path('test/', views.test_view, name='test'),
]
