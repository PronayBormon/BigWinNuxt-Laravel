<template>
  <div>
    <NuxtRouteAnnouncer />
    <NuxtPage />
  </div>
</template>

<script setup>
import { onMounted } from 'vue';
import { useAuthStore } from '@/stores/auth'; // ✅ Import Pinia store

const authStore = useAuthStore(); // ✅ Initialize store

onMounted(() => {
    authStore.initialize(); // ✅ Load user from localStorage
    authStore.startInactivityTimer(); // ✅ Start auto logout timer
});
</script>
