import { defineStore } from 'pinia';
import { useRouter } from '#vue-router';
import axios from 'axios';

const route = useRouter();

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

      // Save to localStorage only on the client-side
      if (process.client) {
        localStorage.setItem('token', token);
        localStorage.setItem('user', JSON.stringify(user));
      }
    },

    // Called when user logs out
    logout() {
      this.token = null;
      this.user = null;

      // Remove from localStorage only on the client-side
      if (process.client) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        route.push('/'); // Redirect to the homepage or login page
      }
    },

    // Initialize state with data from localStorage (on client-side only)
    initialize() {
      if (process.client) {
        this.token = localStorage.getItem('token');
        this.user = JSON.parse(localStorage.getItem('user'));
      }
    },

    // Check if the current user is an admin
    isAdmin() {
      return this.user && this.user.role === 2;  // Adjust the role ID as needed
    },

    // Update the user's role from backend or token, if needed
    updateUserRole(newRole) {
      if (this.user) {
        this.user.role = newRole;
        if (process.client) {
          localStorage.setItem('user', JSON.stringify(this.user));  // Update role in localStorage
        }
      }
    },

    // Fetch user data from API and update store (optional)
    // async fetchUserData() {
    //   try {
    //     const { data } = await axios.get('/api/user'); // Assuming your API endpoint
    //     this.user = data;
    //     if (process.client) {
    //       localStorage.setItem('user', JSON.stringify(data));  // Store updated user data in localStorage
    //     }
    //   } catch (error) {
    //     console.error('Error fetching user data:', error);
    //   }
    // }
  },

  persist: true, // Optional: Pinia persistence plugin for automatically saving the state
});
