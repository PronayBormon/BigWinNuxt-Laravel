// // stores/auth.ts
// import { defineStore } from 'pinia'
// import axios from 'axios'
// import { navigateTo } from '#app'

// interface User {
//   id: number
//   name: string
//   email: string
//   role: number
//   // add other fields as needed
// }

// interface AuthState {
//   token: string | null
//   user: User | null
// }

// export const useAuthStore = defineStore('auth', {
//   state: (): AuthState => ({
//     token: null,
//     user: null,
//   }),

//   actions: {
//     login(token: string, user: User) {
//       this.token = token
//       this.user = user

//       if (process.client) {
//         localStorage.setItem('token', token)
//         localStorage.setItem('user', JSON.stringify(user))
//         axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
//       }
//     },

//     async logout() {
//       this.token = null
//       this.user = null

//       if (process.client) {
//         try {
//           await axios.post('/api/logout')
//         } catch (error) {
//           console.error('Logout API failed', error)
//         }
//         localStorage.removeItem('token')
//         localStorage.removeItem('user')
//         axios.defaults.headers.common['Authorization'] = ''
//         navigateTo('/auth/login')
//       }
//     },

//     initialize() {
//       if (process.client) {
//         this.token = localStorage.getItem('token')
//         const userStr = localStorage.getItem('user')
//         this.user = userStr ? JSON.parse(userStr) : null

//         if (this.token) {
//           axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
//         }
//       }
//     },

//     isAdmin(): boolean {
//       return !!this.user && this.user.role === 2
//     },

//     updateUserRole(newRole: number) {
//       if (this.user) {
//         this.user.role = newRole
//         if (process.client) {
//           localStorage.setItem('user', JSON.stringify(this.user))
//         }
//       }
//     },
//   },

//   persist: true,
// })
