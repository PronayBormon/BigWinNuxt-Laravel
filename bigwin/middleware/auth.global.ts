export default defineNuxtRouteMiddleware((to, from) => {
    // Check if we are on the client-side
    if (process.client) {
        const token = localStorage.getItem('token'); // Get token from localStorage
        const userData = JSON.parse(localStorage.getItem('user'))? JSON.parse(localStorage.getItem('user')) : 'null';
        
        // console.log(userData.role);

        // Define the public routes that don't require authentication
        const publicRoutes = ['/auth/login', '/auth/register', '/auth/forgetpassword'];

        // Get the router instance
        const router = useRouter();

        // If the user is not logged in and tries to access a private route
        if (!token && !publicRoutes.includes(to.path) && userData.role != 2 || userData == null) {
            router.push('/auth/login'); // Redirect to login page
            return; // Stop further navigation
        }
        
        if (token && publicRoutes.includes(to.path) && userData.role == 2) {
            router.push('/'); 
            return; 
        }
    }
});
