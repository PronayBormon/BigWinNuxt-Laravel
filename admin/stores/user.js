// import { defineStore } from "pinia";
// import axios from "~/plugins/axios";

// const $axios = axios().provide.axios;
// export const useUserStore = defineStore("user", {
//   state: () => ({
//     id: "",
//     full_name: "",
//     email: "",
//     api_token: "",
//     isLoggedIn: false,
//   }),
//   actions: {
//     async login(email, password,captchaInput,userCapInput) {
//       await $axios
//         .post("/auth/login", {
//           email: email,
//           password: password,
//           captchaInput:captchaInput,
//           userCapInput:userCapInput
//         })
//         .then((result) => {
//           //console.log("response:" +  result.data.user.id);
//           //console.log("response:" +  result.data.access_token);
//           //return false;
//           localStorage.setItem("token", result.data.access_token);
//           this.$state.api_token = result.data.access_token;
//           this.$state.email = result.data.user.email;
//           this.$state.id = result.data.user.id;
//           this.$state.isLoggedIn = true;
//         });
//     },

//     async register(name,phone_number,email,otp,inviteCode,password,confirmPassword) {
//       await $axios.post("/auth/register", {
//         name: name,
//         phone_number: phone_number,
//         email: email,
//         otp: otp,
//         inviteCode: inviteCode,
//         password: password,
//         password_confirmation: confirmPassword,
//       });
//     },

//     async getUser() {
//       let res = await $axios.post("/auth/me");
//       this.$state.id = res.data.data.id;
//       this.$state.name = res.data.data.name;
//       this.$state.email = res.data.data.email;
//       this.$state.isLoggedIn = true;
//     },

//     async logout() {
//       await $axios.post("/auth/logout");
//       this.resetState();
//     },

//     resetState() {
//       this.$state.id = "";
//       this.$state.full_name = "";
//       this.$state.email = "";
//       this.$state.api_token = "";
//       this.$state.isLoggedIn = false;
//     },
//   },
//   persist: true,
// });
