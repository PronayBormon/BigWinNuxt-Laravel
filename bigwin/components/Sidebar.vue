<template>
    <aside class="sidebar sidebar_main" :class="globalScript.sidebarClass">
        <div class="position-relative h-100">
            <div class="sidebar_header">
                <button type="button" @click="globalScript.toggleSidebar" class="btn btn_menu btn-default">
                    <i class="fa-regular fa-x"></i>
                </button>
                <img src="/public/images/logo.png" alt="App Logo" class="img-fluid">
            </div>

            <!-- Sidebar Menu -->
            <ul class="sidebar_menu">
                <li class="menu_group" :class="{ active: route.path === '/' }">
                    <NuxtLink class="menu_link" to="/">
                        <img src="/assets/icons/allUser.svg" alt="" class="img-fluid"> All Users
                    </NuxtLink>
                </li>
                <li class="menu_group" :class="{ active: route.path === '/add-single-match' }">
                    <NuxtLink class="menu_link" to="/add-single-match">
                        <img src="/assets/icons/singleMatch.svg" alt="" class="img-fluid"> Add Single Match
                    </NuxtLink>
                </li>
                <li class="menu_group" :class="{ active: route.path === '/all-winners' }">
                    <NuxtLink class="menu_link" to="/all-winners">
                        <img src="/assets/icons/allwinner.svg" alt="" class="img-fluid"> All Winners
                    </NuxtLink>
                </li>
                <li class="menu_group" :class="{ active: route.path === '/spin-list' }">
                    <NuxtLink class="menu_link" to="/spin-list">
                        <img src="/assets/icons/spinList.svg" alt="" class="img-fluid"> Spin List
                    </NuxtLink>
                </li>
                <li class="menu_group" :class="{ active: route.path === '/notification' }">
                    <NuxtLink class="menu_link" to="/notification">
                        <img src="/assets/icons/notification.svg" alt="" class="img-fluid"> Notification
                    </NuxtLink>
                </li>
                <li class="menu_group" :class="{ active: route.path === '/deposit' }">
                    <NuxtLink class="menu_link" to="/deposit">
                        <img src="/assets/icons/deposit.svg" alt="" class="img-fluid"> Deposit
                    </NuxtLink>
                </li>
                <li class="menu_group" :class="{ active: route.path === '/reports' }">
                    <NuxtLink class="menu_link" to="/reports">
                        <img src="/assets/icons/report.svg" alt="" class="img-fluid"> Reports
                    </NuxtLink>
                </li>
                <li class="menu_group" :class="{ active: route.path === '/prize' }">
                    <NuxtLink class="menu_link" to="/prize">
                        <img src="/assets/icons/report.svg" alt="" class="img-fluid"> Prize
                    </NuxtLink>
                </li>
                <li class="menu_group" :class="{ active: route.path === '/country' }">
                    <NuxtLink class="menu_link" to="/country">
                        <img src="/assets/icons/report.svg" alt="" class="img-fluid"> Team List
                    </NuxtLink>
                </li>
            </ul>
            <div class="sidebar_footer">
                <ul class="sidebar_menu">
                    <li class="menu_group active" @click="handleLogout()">
                        <NuxtLink class="menu_link" to="/">
                            <img src="/assets/icons/logout.svg" alt="" class="img-fluid"> Logout
                        </NuxtLink>
                    </li>
                </ul>
            </div>
        </div>
    </aside>
</template>

<script setup>
import { useRoute } from 'vue-router';
import { useGlobalScript } from '@/stores/globalScript';
import { useAuthStore } from '@/stores/auth';
import { useRouter } from 'vue-router';
import axios from 'axios';

const router = useRouter();


const route = useRoute();
const globalScript = useGlobalScript();
const authStore = useAuthStore();

const handleLogout = () => {
    // authStore.logout();
    // Remove from localStorage


    // axios.post('/api/logout').then(response => {
        // router.push('/');
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        console.log("success Logout");
        router.push('/auth/login');
    // });

    // // Redirect to login page
};
</script>
