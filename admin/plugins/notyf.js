import { Notyf } from 'notyf';
import 'notyf/notyf.min.css';

export default defineNuxtPlugin(nuxtApp => {
  if (process.client) {
    const notyf = new Notyf({
      duration: 3000,
      position: { x: 'right', y: 'top' },
      dismissible: true,
    });

    nuxtApp.provide('notyf', notyf); // Provide Notyf globally
  }
});

