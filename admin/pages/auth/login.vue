<template>
    <title>Please Login with your Email and password</title>
    <div class="auth_container_">
        <div class="container-fluid">
            <div class="auth_box_container">
                <div class="auth_box">
                    <img src="/images/login_img.png" alt="" class="img-fluid">
                </div>
                <div class="login_box">
                    <img src="/images/vector.png" alt="" class="img-fluid">
                    <h1 class="login_title"><span></span>Login to your account</h1>

                    <div class="row">
                        <div class="col-md-8 m-auto">
                            <form action="/" @submit.prevent="userLogin">
                                <div class="form-group mb-3">
                                    <input type="text" name="email" id="email" v-model="email" required
                                        class="form-control" placeholder="example@mail.com">
                                </div>
                                <input type="text" name="login_ip" hidden v-model="logIp">
                                <div class="form-group mb-3">
                                    <div class="input_group">
                                        <input :type="showPassword ? 'text' : 'password'" name="Password" id="password"
                                            v-model="password" required class="form-control" placeholder="Password">

                                        <button class="btn_pass" type="button" @click="showHidePass">
                                            <i
                                                :class="showPassword ? 'fa-regular fa-eye-slash' : 'fa-regular fa-eye'"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- <nuxt-link class="forget_link" to="/auth/forgetpassword">Forget Password?</nuxt-link> -->
                                <button class="btn_submit" type="submit">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<!-- <script setup>
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
const globalScript = useGlobalScript();
// import axios from "axios";


// const { $axios } = useNuxtApp();
// const axios = $axios;
import { useRouter } from 'vue-router';
import { useAuthStore } from '@/stores/auth';  // Import useAuthStore

import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const router = useRouter();

const email = ref('');
const password = ref('');
const logIp = ref('');

const showPassword = ref(false);

const showHidePass = () => {
    showPassword.value = !showPassword.value;
};

const userLogin = async () => {
    const formData = new FormData();
    formData.append('email', email.value);
    formData.append('password', password.value);
    formData.append('login_ip', logIp.value);

    // console.log(formData);
    axios.post('/login', formData).then(response => {
        const token = response.data.token;
        const user = response.data.user;

        if (token != null) {
            if (user.role == 2) {

                const authStore = useAuthStore();
                authStore.login(token, user);
                $notyf.success(response.data.message);
                window.location.reload();
            } else {
                $notyf.error("Your Are Not Admin");
            }
        } else {

            $notyf.error(response.data.error);
        }


    })
    // .catch(error => {
    //     // If the error response is validation errors, show them using Notyf
    //     if (error.response && error.response.data && error.response.data.errors) {
    //         const errorMessages = error.response.data.errors;

    //         // Loop through the errors object and show each error message
    //         for (const field in errorMessages) {
    //             if (errorMessages.hasOwnProperty(field)) {
    //                 errorMessages[field].forEach((msg) => {
    //                     $notyf.error(msg); // Show each error message using Notyf
    //                 });
    //             }
    //         }
    //     } else {
    //         // If it's not validation errors, show a general error message
    //         $notyf.error("An error occurred. Please try again.");
    //     }
    // });

};

const getIp = () => {
    fetch("https://api64.ipify.org?format=json")
        .then(response => response.json())
        .then(data => {
            // console.log("User's Public IP: " + data.ip);
            logIp.value = data.ip;
        })
        .catch(error => console.error("Error fetching IP:", error));
}

// Load saved theme when component is mounted
onMounted(() => {
    getIp();
});
</script> -->
