// import axios from "axios";
import { defineNuxtPlugin } from "#app";

export default defineNuxtPlugin((nuxtApp) => {
  const baseURL = process.env.NODE_ENV === 'production'
    ? "https://api.bigwin.cfd/api"
    : "https://api.bigwin.cfd/api";
    // ? "http://127.0.0.1:8000/api"
    // : "http://127.0.0.1:8000/api"; 

  axios.defaults.baseURL = baseURL;
  axios.defaults.withCredentials = false;  // Set to false if you're not using credentials (cookies, sessions)
  // axios.defaults.proxyHeaders = false; // Disable proxy headers

  if (process.client) {
    const token = localStorage.getItem("token");
    if (token) {
      // console.log(token);
      axios.defaults.headers.common["Authorization"] = "Bearer " + token;
    }
  }

  // Handle common errors, like CORS or unauthorized requests
  axios.interceptors.response.use(
    response => response, 
    error => {
      if (error.response && error.response.status === 401) {
        console.error("Unauthorized access - Token might be expired or missing.");
      } else if (error.response && error.response.status === 500) {
        console.error("Internal Server Error.");
      } else {
        console.error("An error occurred:", error.message);
      }
      return Promise.reject(error);
    }
  );

  return {
    provide: {
      axios: axios,  // Make axios available globally in your app
    },
  };
});
