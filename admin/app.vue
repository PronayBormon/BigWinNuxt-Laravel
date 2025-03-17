<template>
  <div>
    <NuxtRouteAnnouncer />
    <NuxtPage />
  </div>
</template>

<script setup>
import { onMounted } from 'vue';
import { useAuthStore } from '@/stores/auth'; // ✅ Import Pinia store

const authStore = useAuthStore(); 

onMounted(() => {
    authStore.initialize();  
});
</script>
