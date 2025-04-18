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
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="page_title">Creadit List</h1>
                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#addCreditModal">Add
                        New</button>
                </div>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" id="" @change="getCreditList(1)" v-model="items">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="1">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getCreditList(1)"
                                        placeholder="Search" class="form-control nav_search">
                                </div>
                            </div>

                            <!-- <div class="form-group">
                                <select name="" id="">
                                    <option value="" selected disabled>Status</option>
                                    <option value="">Acitve</option>
                                    <option value="">Inactive</option>
                                </select>
                            </div> -->
                        </div>
                        <!-- <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add User </button> -->
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Created at </th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-if="creditList && creditList.length" v-for="(item, index) in creditList">
                                        <td class="">{{ item.name }}</td>
                                        <td>$ {{ Number(item.price).toFixed(2) }}</td>
                                        <td>{{ item.created }}</td>
                                        <td class="text-center">
                                            <button class="btn btn_default" data-bs-toggle="modal"
                                                @click="getCreditDetails(item.id)" data-bs-target="#editCreditModal"><i
                                                    class="fa-regular fa-pencil-square"></i></button>
                                        </td>
                                    </tr>
                                    <tr v-else>
                                        <td colspan="4" class="text-center">No Data Available</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- <button @click="getNotificaitonList" type="button">test</button> -->
                            <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#"
                                        @click.prevent="getCreditList(link.url.split('page=')[1])"
                                        class="page-link">
                                        {{ link.label }}
                                    </a>
                                    <span v-else>{{ link.label }}</span> <!-- Show "..." for ellipsis -->
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>


            </div>


        </div>

        <!-- Edit Credit Modal -->
        <div class="modal fade" id="editCreditModal" tabindex="-1" aria-labelledby="editCreditLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="adduser_form">
                            <h1>Edit Credit</h1>
                            <form @submit.prevent="UpdateCredit">
                                <!-- Credit Name -->
                                <div class="form-group mb-3">
                                    <input type="text" v-model="editCredit.name" placeholder="Credit Name"
                                        class="form-control" required />
                                </div>

                                <!-- Credit Price -->
                                <div class="form-group mb-3">
                                    <input type="number" v-model="editCredit.price" placeholder="Price"
                                        class="form-control" required />
                                </div>

                                <!-- Credit Status -->
                                <div class="form-group mb-3">
                                    <select v-model="editCredit.status" class="form-control" required>
                                        <option disabled value="">Select Status</option>
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn_primary w-100">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Credit Modal -->
        <div class="modal fade" id="addCreditModal" tabindex="-1" aria-labelledby="addCreditLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="adduser_form">
                            <h1>Add Credit</h1>
                            <form @submit.prevent="addCredit">
                                <!-- Credit Name -->
                                <div class="form-group mb-3">
                                    <input type="text" v-model="credit.name" required placeholder="Credit Name"
                                        class="form-control" />
                                </div>

                                <!-- Credit Price -->
                                <div class="form-group mb-3">
                                    <input type="number" v-model="credit.price" required placeholder="Price"
                                        class="form-control" />
                                </div>

                                <!-- Credit Status -->
                                <div class="form-group mb-3">
                                    <select v-model="credit.status" required class="form-control">
                                        <option disabled value="">Select Status</option>
                                        <option value="1">Active</option>
                                        <option value="0">Inactive</option>
                                    </select>
                                </div>

                                <button type="submit" class="btn_primary w-100">Submit</button>
                            </form>
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
import axios from 'axios';
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const globalScript = useGlobalScript();

const items = ref('10');
const searchInput = ref();
const message = ref();
const editId = ref();
const editmessage = ref();
const creditList = ref([]);
const pagination = ref([]);

const credit = ref({
    name: '',
    price: '',
    status: ''
});

const editCredit = ref({
    id: '',
    name: '',
    price: '',
    status: ''
});
;

const errors = ref();
const addCredit = () => {
    axios.post('/api/add-credits', credit.value)
        .then(response => {
            // Success
            $notyf.success(response.data.message);
            credit.value = { name: '', price: '', status: '' };

            let modalElement = document.getElementById("addCreditModal");
            if (modalElement) {
                let modalInstance = bootstrap.Modal.getInstance(modalElement);
                if (modalInstance) {
                    modalInstance.hide();
                }
            }
            getCreditList();

        })
        .catch(errors => {
            // Validation errors
            if (errors.response && errors.response.data && error.response.data.errors) {
                const errorMessages = errors.response.data.errors;
                for (const field in errorMessages) {
                    if (errorMessages.hasOwnProperty(field)) {
                        errorMessages[field].forEach(msg => $notyf.error(msg));
                    }
                }
            } else {
                // General error
                $notyf.error("An error occurred. Please try again.");
            }
        });
};

const getCreditDetails = (id) => {
    axios.get(`/api/credit-details/${id}`).then(response => {
        const data = response.data;
        editCredit.value = {
            id: data.id,
            name: data.name,
            price: data.price,
            status: data.status
        };
    }).catch(error => {
        console.error("Error fetching credit details:", error);
    });
};


const getCreditList = (pages) => {

    const pageNum = pages;
    axios.get('api/credit-list', {
        params: {
            item: items.value,
            searchInput: searchInput.value,
            page: pages,
        }
    }).then(response => {
        // console.log(response.data.data);
        creditList.value = response.data.data;
        pagination.value = response.data.pagination.links;
    })
}
const UpdateCredit = () => {
    axios.post('/api/update-credit', editCredit.value)
        .then(response => {
            $notyf.success(response.data.message);
            editCredit.value = { id: '', name: '', price: '', status: '' };

            const modalElement = document.getElementById("editCreditModal");
            if (modalElement) {
                const modalInstance = bootstrap.Modal.getInstance(modalElement);
                if (modalInstance) modalInstance.hide();
            }

            getCreditList(); // refresh table/list
        })
        .catch(error => {
            if (error.response?.data?.errors) {
                const errorMessages = error.response.data.errors;
                for (const field in errorMessages) {
                    errorMessages[field].forEach(msg => $notyf.error(msg));
                }
            } else {
                $notyf.error("An error occurred. Please try again.");
            }
        });
};

onMounted(() => {
    getCreditList(1);
})




</script>
