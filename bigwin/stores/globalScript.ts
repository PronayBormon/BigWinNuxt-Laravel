// stores/globalScript.ts
import { defineStore } from 'pinia';

export const useGlobalScript = defineStore('globalScript', {
  state: () => ({
    sidebarClass: 'sidebar-closed', // Default sidebar class
  }),
  actions: {
    toggleSidebar() {
      this.sidebarClass = this.sidebarClass === 'sidebar-closed' ? 'sidebar-open' : 'sidebar-closed';
    }
  }
});
