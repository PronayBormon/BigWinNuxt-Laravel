<template>
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
                            <h1>Forgot Password</h1>
                            <p>Please enter your number  to reset the password</p>
                            <form action="/">
                                <div class="form-group">
                                    <label for="phone" class="form-label">Phone</label>
                                    <input 
                                        type="text" 
                                        autocomplete="off" 
                                        autocorrect="off" 
                                        autocapitalize="off" 
                                        name="phone" 
                                        id="phone" 
                                        class="form-control"
                                        placeholder="+880"
                                        v-model="phone"
                                        @input="validatePhone"
                                    >
                                    <small v-if="phoneError" class="text-danger">{{ phoneError }}</small>
                                </div>
                                <button class="btn_submit" type="submit">Send Code</button>
                                <h1 class="back_login"><nuxt-link to="/auth/login"><i class="fa-solid fa-arrow-left"></i>Back to Login </nuxt-link></h1>
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

    const theme = ref('body-light');
    const phone = ref('');
    const phoneError = ref('');
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
  

    // Load saved theme when component is mounted
    onMounted(() => {
        checkTheme();
    });
</script> -->