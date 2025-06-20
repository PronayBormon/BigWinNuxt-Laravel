<template>

    <div class="main_container">

        <!-- sidebar start here  -->
        <Sidebar />
        <!-- main container section  -->
        <div class="main_content">

            <!-- navbar section  -->
            <Navbar />

            <!-- content setion  -->
            <div class="content_section">
                <h1 class="page_title">Dashboard</h1>
                <!-- ================================= -->
                 
                <!-- ================================= -->
                <div class="card app_card">
                    <div class="card-header">
                        <form @submit.prevent="UserList">
                            <div class="header_filter">
                                <div class="show_">
                                    <p>Show</p>
                                    <select name="item" id="item-select" v-model="itemsPerPage" @change="UserList">
                                        <option value="10" selected>10</option>
                                        <option value="20">20</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                </div>

                                <div class="form-group d-none d-md-block">
                                    <div class="seach_box">
                                        <i class="fa-solid fa-search"></i>
                                        <input type="text" placeholder="Search" v-model="searchQuery" @input="UserList"
                                            name="search" class="form-control nav_search" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <select name="status" id="status-select" v-model="statusFilter" @change="UserList">

                                        <option value="">All</option>
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                        <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add User </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th class="text-center">User Id</th>
                                        <th>User Info</th>
                                        <th>Status</th>
                                        <th>Register IP</th>
                                        <th>Login IP</th>
                                        <th>Reg/Update Time</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- {{ userList }} -->
                                    <tr v-if="userList && userList.length" v-for="(items, index) in userList"
                                        :key="items.id">

                                        <td class="text-center">{{ index + 1 }}</td>
                                        <td>
                                            <p>{{ items.name }}</p>
                                            <p>Phone No: {{ items.phone }}</p>
                                            <p>{{ items.email }}</p>
                                        </td>
                                        <td>
                                            <span v-if="items.status == 1" class="badge bg-success">Active</span>
                                            <span v-else class="badge bg-danger">Inactive</span>
                                        </td>
                                        <td>
                                            <p>{{ items.register_ip }}</p>
                                            <p v-if="fetchLocation(items.register_ip)">{{ locations[items.register_ip]
                                                }}</p>
                                            <p v-else>Loading location...</p>
                                        </td>
                                        <td>
                                            <p>{{ items.login_ip }}</p>
                                        </td>
                                        <td>
                                            <p>R: {{ new Date(items.created_at).toLocaleString('en-GB', {
                                                year: 'numeric',
                                                month: 'short',
                                                day: '2-digit',
                                                hour: '2-digit',
                                                minute: '2-digit',
                                                second: '2-digit',
                                                hour12: true
                                            }) }}</p>
                                            <p>U: {{ new Date(items.updated_at).toLocaleString('en-GB', {
                                                year: 'numeric',
                                                month: 'short',
                                                day: '2-digit',
                                                hour: '2-digit',
                                                minute: '2-digit',
                                                second: '2-digit',
                                                hour12: true
                                            }) }}</p>

                                        </td>
                                        <td>
                                            <button data-bs-toggle="modal" data-bs-target="#edituser"
                                                @click="getSingleData(items.id)" class="btn btn_default">Details
                                                Action</button>
                                        </td>
                                    </tr>
                                    <tr v-else>
                                        <td colspan="6" class="text-center"><span class="my-4">No data available</span>
                                        </td>
                                        <!-- Adjust colspan based on number of columns -->
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
                <!-- Pagination -->
                <nav aria-label="..." v-if="pagination">
                    <ul class="pagination">

                        <li class="page-item ">
                            <button class="page-link" @click="goToPage(1)"
                                :disabled="pagination.current_page <= 1">First</button>
                        </li>
                        <li class="page-item ">
                            <button class="page-link" @click="goToPage(pagination.current_page - 1)"
                                :disabled="pagination.current_page <= 1">Prev</button>
                        </li>


                        <li class="page-item " aria-current="page" v-for="page in getPageNumbers" :key="page">
                            <button class="page-link" :disabled="page === pagination.current_page"
                                @click="goToPage(page)" href="#">{{ page }}</button>
                        </li>

                        <li class="page-item">
                            <button class="page-link" @click="goToPage(pagination.current_page + 1)"
                                href="#">Next</button>
                        </li>
                        <li class="page-item">
                            <button class="page-link" @click="goToPage(pagination.last_page)"
                                :disabled="pagination.current_page >= pagination.last_page" href="#">Last</button>
                        </li>
                    </ul>
                </nav>



                <!--add Modal -->
                <div class="modal fade" id="adduser" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="adduser_form">
                                    <h1>Add User</h1>
                                    <form>
                                        <div class="form-group mb-3">
                                            <input type="text" class="form-control" id="name" placeholder="Name">
                                        </div>

                                        <div class="form-group mb-3">
                                            <input type="email" class="form-control" id="email" placeholder="Email">
                                        </div>

                                        <div class="form-group mb-3">
                                            <input type="tel" class="form-control" id="phone"
                                                placeholder="Phone Number">
                                        </div>

                                        <div class="form-group mb-3">

                                            <div class="input_group">
                                                <input :type="showPassword ? 'text' : 'password'" name="Password"
                                                    id="password" class="form-control" placeholder="Password">

                                                <button class="btn_pass" type="button" @click="showHidePass">
                                                    <i
                                                        :class="showPassword ? 'fa-regular fa-eye-slash' : 'fa-regular fa-eye'"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Edit Modal -->
                <div class="modal fade" id="edituser" tabindex="-1" aria-labelledby="edituserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="adduser_form">
                                    <h1>Edit User</h1>
                                    <form id="#updateForm" action="/" @submit.prevent="updateUser()">
                                        <div class="form-group mb-3">
                                            <input type="hidden" v-model="userDataid" class="form-control" id="name"
                                                placeholder="Name">
                                            <input type="text" v-model="userDataName" class="form-control" id="name"
                                                placeholder="Name">
                                        </div>

                                        <div class="form-group mb-3">
                                            <input type="email" v-model="userDataEmail" class="form-control" id="email"
                                                placeholder="Email">
                                        </div>

                                        <div class="form-group mb-3">
                                            <input type="tel" v-model="userDataPhone" class="form-control" id="phone"
                                                placeholder="Phone Number">
                                        </div>

                                        <div class="form-group mb-3">

                                            <div class="input_group">
                                                <select name="" v-model="userDataStatus" id="" class="form-control">
                                                    <option value="1" :selected="userDataStatus == '1'">Active</option>
                                                    <option :selected="userDataStatus == '2'" value="2">Inactive
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn_primary w-100">Update</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>

    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
const globalScript = useGlobalScript();
const authStore = useAuthStore();
import axios from "axios";
import $ from "jquery";

import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();
// $notyf.success(response.data.message);

// Check if the user is an admin
const isAdmin = authStore.isAdmin();



const showPassword = ref(false);
const userList = ref('');
const userRegIp = ref('');

const itemsPerPage = ref(10);
const searchQuery = ref('');
const statusFilter = ref('');
const pagination = ref(null);


const userDataid = ref({});
const userDataName = ref({});
const userDataEmail = ref({});
const userDataPhone = ref({});
const userDataStatus = ref({});
const userDataPassword = ref({});


const showHidePass = () => {
    showPassword.value = !showPassword.value;
};

// Go to specific page
const goToPage = (page) => {
    if (page >= 1 && page <= pagination.value.last_page) {
        UserList(page); // Call UserList with the selected page
    }
};

const getPageNumbers = computed(() => {
    const pages = [];
    const currentPage = pagination.value.current_page;
    const lastPage = pagination.value.last_page;


    const startPage = Math.max(1, currentPage - 1);
    const endPage = Math.min(lastPage, currentPage + 1);

    for (let i = startPage; i <= endPage; i++) {
        pages.push(i);
    }

    // Show more pages if there is room (start and end)
    if (startPage > 1) {
        pages.unshift(1);
    }
    if (endPage < lastPage) {
        pages.push(lastPage);
    }

    return pages;
});
const UserList = async (page = 1) => {
    const formData = new FormData();
    formData.append('perPage', itemsPerPage.value);
    formData.append('search', searchQuery.value);
    formData.append('status', statusFilter.value);
    formData.append('page', page);
    // console.log(formData);

    axios.post('/api/user-list', formData).then(response => {
        // console.log(response.data.data);
        userList.value = response.data.data;
        pagination.value = response.data.meta; // Store pagination metadata
        // checkAdmin();
    });

};

const locations = ref({}); // Store locations in an object

// Fetch the location based on IP
const fetchLocation = async (ip) => {
    if (!locations.value[ip]) {
        try {
            const response = await axios.get(`http://ip-api.com/json/${ip}`);
            locations.value[ip] = `${response.data.city}, ${response.data.country}`; // Cache the location

        } catch (error) {

            console.error("Error fetching IP location:", error);
            locations.value[ip] = "Location not available";

        }
    }
    return locations.value[ip]; // Return the cached or fetched location
};

const getSingleData = (id) => {
    axios.post(`/api/user-data/${id}`).then(response => {
        // console.log(response.data);
        userDataid.value = response.data.id;
        userDataName.value = response.data.name;
        userDataEmail.value = response.data.email;
        userDataPhone.value = response.data.phone;
        userDataStatus.value = response.data.status;
    }).catch(error => {
        console.error("Error fetching user data:", error);
    });
};

const updateUser = () => {

    const formData = new FormData();
    formData.append('id', userDataid.value);
    formData.append('name', userDataName.value);
    formData.append('email', userDataEmail.value);
    formData.append('phone', userDataPhone.value);
    formData.append('status', userDataStatus.value);

    axios.post('/api/update', formData).then(response => {
        console.log(response.data.message);
        // Reset the form correctly
        const form = document.getElementById("updateForm");
        if (form) {
            form.reset(); // Correct method to reset the form
        }

        // Close modal correctly (Bootstrap way)
        let modalElement = document.getElementById('edituser');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
        UserList();
        $notyf.success(response.data.message);
    });
}
import { useRouter } from 'vue-router';

const router = useRouter();
const checkAdmin = () => {
    if (!isAdmin) {
        handleLogout();
    }
}
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

onMounted(() => {
    UserList();
    fetchLocation();
    
});



</script>
