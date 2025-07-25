<template>
  <div>
    <NuxtRouteAnnouncer />
    <!-- <NuxtWelcome /> -->
    <NuxtPage />
  </div>
</template>

<script setup>
import { useNuxtApp } from '#app'

const { $notyf } = useNuxtApp()
</script>
