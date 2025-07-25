// import { defineStore } from 'pinia';
import { useRouter } from 'vue-router';
// import axios from 'axios';

export const useAuthStore = defineStore('auth', {
  state: () => ({
    token: null,
    user: null,
  }),

  actions: {
    // Called when user logs in
    login(token, user) {
      this.token = token;
      this.user = user;

      if (process.client) {
        localStorage.setItem('token', token);
        localStorage.setItem('user', JSON.stringify(user));
      }
    },

    // Called when user logs out
    logout() {
      // const router = useRouter(); // ✅ Define inside function
      this.token = null;
      this.user = null;

      if (process.client) {
        axios.post('api/logout').then(response => {

          localStorage.removeItem('token');
          localStorage.removeItem('user');
          navigateTo('/auth/login'); // ✅ Works globally
        })
      }
    },

    initialize() {
      if (process.client) {
        this.token = localStorage.getItem('token');
        this.user = JSON.parse(localStorage.getItem('user')) || '0';
      }
    },

    isAdmin() {
      return this.user && this.user.role === 2;
    },

    updateUserRole(newRole) {
      if (this.user) {
        this.user.role = newRole;
        if (process.client) {
          localStorage.setItem('user', JSON.stringify(this.user));
        }
      }
    },

    // startInactivityTimer() {
    //   if (process.client) {
    //     this.clearInactivityTimer();

    //     this.inactivityTimer = setTimeout(() => {
    //       this.logout();
    //       alert("You have been logged out due to inactivity.");
    //     }, 60 * 60 * 1000); // 10 seconds
    //   }
    // },

    // resetInactivityTimer() {
    //   this.startInactivityTimer();
    // },

    // clearInactivityTimer() {
    //   if (this.inactivityTimer) {
    //     clearTimeout(this.inactivityTimer);
    //   }
    //   window.removeEventListener('mousemove', this.resetInactivityTimer);
    //   window.removeEventListener('keydown', this.resetInactivityTimer);
    //   window.removeEventListener('scroll', this.resetInactivityTimer);
    // }
  },

  persist: true,
});
