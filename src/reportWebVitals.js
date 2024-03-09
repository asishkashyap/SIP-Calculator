import { register } from 'register-service-worker';

register({
  onSuccess: () => console.log('Service Worker registered successfully'),
  onUpdate: () => console.log('New content available, please refresh'),
});