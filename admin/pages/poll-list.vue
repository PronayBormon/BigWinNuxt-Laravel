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
                <h1 class="page_title">Poll List</h1>
                <div class="card app_card">
                    <div class="card-header">
                        <form>
                            <div class="header_filter">
                                <div class="show_">
                                    <p>Show</p>
                                    <select name="item" id="item-select" v-model="items" @change="getPolls(1)">
                                        <option value="10" selected>10</option>
                                        <option value="20">20</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                </div>

                                <div class="form-group d-none d-md-block">
                                    <div class="seach_box">
                                        <i class="fa-solid fa-search"></i>
                                        <input type="text" placeholder="Search" v-model="searchInput"
                                            @input="getPolls(1)" name="search" class="form-control nav_search" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <select name="status" id="status-select" v-model="status" @change="getPolls(1)">

                                        <option value="">All</option>
                                        <option value="active">Active</option>
                                        <option value="inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                        <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add Poll </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th class="text-center">SL.</th>
                                        <th>Poll</th>
                                        <th>Options</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(items, index) in PollList" :key="items.id">
                                        <td class="text-center">{{ index + 1 }}</td>
                                        <td>
                                            <p>{{ items.question }}</p>
                                        </td>
                                        <td>
                                            <p v-for="(option, index) in items.options" :key="option.id">
                                                <small>{{ index + 1 }}. {{ option.option_text }}</small>
                                            </p>
                                        </td>

                                        <td>
                                            <span v-if="items.status == 'active'" class="badge bg-success">Active</span>
                                            <span v-else class="badge bg-danger">Inactive</span>
                                        </td>
                                        <td>
                                            <button data-bs-toggle="modal" data-bs-target="#edituser"
                                                @click="PollDetails(items.id)" class="btn btn_default">Details
                                                Action</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- Pagination -->
                            <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#"
                                        @click.prevent="getPolls(link.url.split('page=')[1])" class="page-link">
                                        {{ link.label }}
                                    </a>
                                    <span v-else>{{ link.label }}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!--add Modal -->
                <div class="modal fade" id="adduser" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="adduser_form">
                                    <h1>Add Poll</h1>
                                    <form @submit.prevent="addPoll">
                                        <div class="form-group mb-3">
                                            <input type="text" v-model="Poll_name" class="form-control"
                                                placeholder="Poll Name" />
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-2" v-for="(opt, index) in option" :key="index">
                                                <input type="text" :placeholder="`Option ${index + 1}`"
                                                    v-model="option[index]" class="form-control" />
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
                                    <h1>Edit Poll</h1>
                                    <form id="updateForm" action="/" @submit.prevent="updatePoll()">
                                        <!-- Hidden Poll ID -->
                                        <input type="hidden" v-model="Poll_id" />

                                        <!-- Poll text -->
                                        <div class="form-group mb-3">
                                            <input type="text" v-model="editPoll_name" class="form-control"
                                                placeholder="Poll" />
                                        </div>

                                        <!-- Status -->
                                        <div class="form-group mb-2">
                                            <select v-model="editstatus" class="form-control">
                                                <option value="active">Active</option>
                                                <option value="inactive">Inactive</option>
                                            </select>
                                        </div>

                                        <!-- Options (4 fields) -->
                                        <div class="form-group mb-2" v-for="(option, index) in editOptions"
                                            :key="option.id">
                                            <label>Option {{ index + 1 }}</label>
                                            <input type="text" v-model="option.option_text" class="form-control"
                                                :placeholder="'Option ' + (index + 1)" />
                                        </div>

                                        <!-- Submit button -->
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
import { useRoute } from 'vue-router';
import axios from 'axios';
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const route = useRoute();
// const teamId = route.query.id;


const editPoll_name = ref();
const editstatus = ref();
const Poll_id = ref();
const editOptions = ref([]);

const items = ref("10");
const searchInput = ref();
const status = ref('');

const PollList = ref([]);
const pagination = ref([]);

const updatePoll = () => {
    const formData = new FormData();
    formData.append('question', editPoll_name.value);
    formData.append('status', editstatus.value);
    formData.append('poll_id', Poll_id.value);
    formData.append('options', JSON.stringify(editOptions.value));

    axios.post('/update-poll', formData).then(response => {
        getPolls();
        let modalElement = document.getElementById('edituser');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
        $notyf.success(response.data.message);
    }).catch(error => {
        // If the error response is validation errors, show them using Notyf
        if (error.response && error.response.data && error.response.data.errors) {
            const errorMessages = error.response.data.errors;

            // Loop through the errors object and show each error message
            for (const field in errorMessages) {
                if (errorMessages.hasOwnProperty(field)) {
                    errorMessages[field].forEach((msg) => {
                        $notyf.error(msg); // Show each error message using Notyf
                    });
                }
            }
        } else {
            // If it's not validation errors, show a general error message
            $notyf.error("An error occurred. Please try again.");
        }
    });
}

const PollDetails = (id) => {
    axios.get(`/polls/${id}`).then(response => {
        // console.log(response.data.id);
        Poll_id.value = response.data.id;
        editPoll_name.value = response.data.question;
        editOptions.value = response.data.options;
        editstatus.value = response.data.status;

        // console.log(editOptions);

    });
}


const Poll_name = ref();
const option = ref(['', '', '', '']);
const addPoll = () => {
    const formData = new FormData();
    // formData.append('team_id', teamId);
    formData.append('question', Poll_name.value);

    option.value.forEach((opt, i) => {
        formData.append(`options[${i}]`, opt);
    });

    axios.post('/polls', formData).then(response => {
        getPolls();
        let modalElement = document.getElementById('adduser');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
        $notyf.success(response.data.message);
    }).catch(error => {
        // If the error response is validation errors, show them using Notyf
        if (error.response && error.response.data && error.response.data.errors) {
            const errorMessages = error.response.data.errors;

            // Loop through the errors object and show each error message
            for (const field in errorMessages) {
                if (errorMessages.hasOwnProperty(field)) {
                    errorMessages[field].forEach((msg) => {
                        $notyf.error(msg); // Show each error message using Notyf
                    });
                }
            }
        } else {
            // If it's not validation errors, show a general error message
            $notyf.error("An error occurred. Please try again.");
        }
    });
}

const getPolls = (page) => {
    axios.get(`/poll-list`, {
        params: {
            items: items.value,
            search: searchInput.value,
            status: status.value,
            page: page,
        }
    }).then(response => {
        console.log(response.data.data);
        PollList.value = response.data.data;
        pagination.value = response.data.pagination.links;
    });
}

onMounted(() => {
    getPolls();
});



</script>
