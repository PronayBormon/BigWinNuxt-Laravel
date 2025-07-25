<template>
    <nav class="navbar main-navbar  ">
        <div class="container-fluid">
            <div class="d-flex align-item-center">
                <button type="button" @click="globalScript.toggleSidebar" class="btn btn_menu btn-default"><i
                        class="fa-regular fa-bars"></i></button>

                <form action="" method="get">
                    <div class="form-group d-none d-md-block">
                        <div class="seach_box">
                            <i class="fa-solid fa-search"></i>
                            <input type="text" placeholder="Search" class="form-control nav_search">
                        </div>
                    </div>
                </form>
            </div>
            <div class="nav_right">

                <div class="profile_option">
                    <ul>
                        <li class="nav_item">
                            <NuxtLink class="nav_link" to="/">
                                <img src="/images/user.png" alt="profile-image" class="img-fluid">
                                <div>
                                    <strong>{{username}}</strong>
                                    <p>{{useremail}}</p>
                                </div>
                            </NuxtLink>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</template>
<script setup>
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
// // import { useAuthStore } from '~/stores/authStore'; // ✅ Import Pinia store
const globalScript = useGlobalScript();

const theme = ref('body-light');

// const authStore = useAuthStore();
// const username = ref();
// const useremail = ref();

// const getUserData = () => {
//     // console.log(authStore.user.name);
//     username.value = authStore.user.name;
//     useremail.value = authStore.user.email;
// }


// // Load saved theme when component is mounted
// onMounted(() => {
//     authStore.initialize();
//     getUserData();
//     const savedTheme = localStorage.getItem('theme-mode');
//     if (savedTheme) {
//         theme.value = savedTheme;
//         document.body.classList.add(theme.value); // Ensure correct class on mount
//     }
// });

// // Function to toggle between dark and light mode
// const toggleTheme = () => {
//     const oldTheme = theme.value;
//     theme.value = theme.value === "body-light" ? "body-dark" : "body-light";

//     // Save theme in localStorage
//     localStorage.setItem('theme-mode', theme.value);

//     // Remove old class and add new class
//     document.body.classList.remove(oldTheme);
//     document.body.classList.add(theme.value);
// };
</script>