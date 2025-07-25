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
                        <!-- <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add User </button> -->
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
import { ref, onMounted, computed } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
// import { useAuthStore } from '@/stores/authStore'; // make sure this exists
import { useRouter } from 'vue-router';
import { useNuxtApp, useCookie } from '#app';
import { apiFetch } from '~/utils/api'

const globalScript = useGlobalScript();
// const authStore = useAuthStore();
const router = useRouter();
const { $notyf } = useNuxtApp();

// ===============================
// Auth & Logout
// ===============================

const handleLogout = () => {
    const authToken = useCookie('auth_token');
    authToken.value = null;
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    $notyf?.success("Logout successful");
    router.push('/auth/login');
};



// ===============================
// State
// ===============================

const userList = ref([]);
const itemsPerPage = ref(10);
const searchQuery = ref('');
const statusFilter = ref('');
const pagination = ref(null);
const showPassword = ref(false);
const locations = ref({}); // IP to Location map

const showHidePass = () => {
    showPassword.value = !showPassword.value;
};

// ===============================
// Pagination
// ===============================

const goToPage = (page) => {
    if (page >= 1 && pagination.value && page <= pagination.value.last_page) {
        UserList(page);
    }
};

const getPageNumbers = computed(() => {
    if (!pagination.value) return [];

    const pages = [];
    const currentPage = pagination.value.current_page;
    const lastPage = pagination.value.last_page;

    const startPage = Math.max(1, currentPage - 1);
    const endPage = Math.min(lastPage, currentPage + 1);

    for (let i = startPage; i <= endPage; i++) pages.push(i);
    if (startPage > 1) pages.unshift(1);
    if (endPage < lastPage) pages.push(lastPage);

    return pages;
});

// ===============================
// User List (fetch version)
// ===============================

const UserList = async (page = 1) => {
    try {
        const formData = new FormData();
        formData.append('perPage', itemsPerPage.value.toString());
        formData.append('search', searchQuery.value);
        formData.append('status', statusFilter.value);
        formData.append('page', page.toString());

        const res = await apiFetch('/api/user-list', {
            method: 'POST',
            body: formData,
        });

        if (!res.ok) throw new Error(`Error: ${res.status}`);

        const data = await res.json();
        // console.log(data)
        userList.value = data.data;
        pagination.value = data.meta;
    } catch (error) {
        console.error("Failed to fetch user list:", error);
    }
};

// ===============================
// Location by IP (fetch version)
// ===============================

const fetchLocation = async (ip) => {
    if (!locations.value[ip]) {
        try {
            const res = await fetch(`http://ip-api.com/json/${ip}`);
            if (!res.ok) throw new Error(`Error: ${res.status}`);

            const data = await res.json();
            locations.value[ip] = `${data.city}, ${data.country}`;
        } catch (error) {
            console.error("Error fetching IP location:", error);
            locations.value[ip] = "Location not available";
        }
    }
    return locations.value[ip];
};

onMounted(() => {
    UserList();
});
</script>
