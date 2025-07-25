<template>
    <title>Please register a new account</title>
    <div class="login_container">
        <div class="container">
            <div class="row " style="height: 100vh;">
                <div class="col-md-6 m-auto align-items-center">
                    <div class="auth_container">

                        <nuxt-link to="/" class="logo_link">
                            <img src="/images/logo.png" v-if="theme == 'body-light'" alt="Logo" class="img-fluid">
                            <img src="/images/logo.png" v-if="theme == 'body-dark'" alt="Logo" class="img-fluid">
                        </nuxt-link>

                        <div class="form_container">
                            <h1>Create an account</h1>
                            <p>Enter your Phone & password to Register</p>
                            <form action="/" @submit.prevent="register">
                                <div class="form-group ">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" name="name" id="name" v-model="name" class="form-control"
                                        placeholder="Full name">
                                </div>
                                <div class="form-group ">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" name="email" id="email" v-model="email" class="form-control"
                                        placeholder="example@mail.com">
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input type="text" autocomplete="off" autocorrect="off" autocapitalize="off"
                                        name="phone" id="phone" class="form-control" placeholder="+880" v-model="phone">

                                    <!-- @input="validatePhone" -->
                                    <small v-if="phoneError" class="text-danger">{{ phoneError }}</small>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="form-label">Password</label>
                                    <div class="input_group">
                                        <input :type="showPassword ? 'text' : 'password'" name="Password" id="password"
                                            v-model="password" class="form-control" placeholder="Password">

                                        <button class="btn_pass" type="button" @click="showHidePass">
                                            <i
                                                :class="showPassword ? 'fa-regular fa-eye-slash' : 'fa-regular fa-eye'"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="form-label">Confirm Password</label>
                                    <div class="input_group">
                                        <input :type="showCPassword ? 'text' : 'password'" name="Password" id="password"
                                            class="form-control" placeholder="Password" v-model="confirmpassword">

                                        <button class="btn_pass" type="button" @click="showHideCPass">
                                            <i
                                                :class="showCPassword ? 'fa-regular fa-eye-slash' : 'fa-regular fa-eye'"></i>
                                        </button>
                                    </div>
                                </div>
                                <nuxt-link class="forget_link" to="/auth/forgetpassword">Forget Password?</nuxt-link>

                                <button class="btn_submit" type="submit">Register</button>


                                <h1 class="back_login"><nuxt-link to="/auth/login"><i
                                            class="fa-solid fa-arrow-left"></i>Back to Login </nuxt-link></h1>
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

// import axios from 'axios';
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const globalScript = useGlobalScript();
const theme = ref('body-light');
const phoneError = ref('');


const logIp = ref('');
const name = ref('test');
const email = ref('test@mail.com');
const phone = ref('11111');
const password = ref('Pass@12');
const confirmpassword = ref('Pass@12');

const validatePhone = () => {
    const phonePattern = /^\+8801[3-9]\d{8}$/; // Validates Bangladeshi numbers (+8801XXXYYYYYY)    
    if (!phone.value) {
        phoneError.value = "Phone number is required.";
    } else if (!phonePattern.test(phone.value)) {
        phoneError.value = "Invalid phone number. Use format: +8801XXXXXXXXX";
    } else {
        phoneError.value = "";
    }
};
const checkTheme = () => {
    const savedTheme = localStorage.getItem('theme-mode');
    if (savedTheme) {
        theme.value = savedTheme;
        document.body.classList.add(theme.value); // Ensure correct class on mount
    }
}
const showPassword = ref(false);
const showCPassword = ref(false);

const showHidePass = () => {
    showPassword.value = !showPassword.value;
};
const showHideCPass = () => {
    showCPassword.value = !showPassword.value;
};

const register = () => {
    const formdata = new FormData();
    formdata.append('name', name.value);
    formdata.append('email', email.value);
    formdata.append('phone', phone.value);
    formdata.append('password', password.value);
    formdata.append('password_confirmation', confirmpassword.value);
    formdata.append('ip_address', logIp.value);

    axios.post('/add-account', formdata).then(response => {
        console.log(response.data);
        $notyf.error("response.data.error");
    }).catch(errors => {
        console.error(errors.response.data);
    });
}


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
    checkTheme();
    getIp();
});
</script> -->