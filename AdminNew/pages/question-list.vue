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
                <h1 class="page_title">Question List</h1>
                <div class="card app_card">
                    <div class="card-header">
                        <form>
                            <div class="header_filter">
                                <div class="show_">
                                    <p>Show</p>
                                    <select name="item" id="item-select" v-model="items" @change="getQuestions(1)">
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
                                            @input="getQuestions(1)" name="search" class="form-control nav_search" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <select name="status" id="status-select" v-model="status" @change="getQuestions(1)">

                                        <option value="">All</option>
                                        <option value="active">Active</option>
                                        <option value="inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                        <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add Question </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th class="text-center">SL.</th>
                                        <th>Question</th>
                                        <th>Options</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(items, index) in questionList" :key="items.id">
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
                                                @click="QuestionDetails(items.id)" class="btn btn_default">Details
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
                                        @click.prevent="getQuestions(link.url.split('page=')[1])" class="page-link">
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
                                    <h1>Add Question</h1>
                                    <form @submit.prevent="addQuestion">
                                        <div class="form-group mb-3">
                                            <input type="text" v-model="Question_name" class="form-control"
                                                placeholder="Question Name" />
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
                                    <h1>Edit Question</h1>
                                    <form id="updateForm" action="/" @submit.prevent="updateQuestion()">
                                        <!-- Hidden question ID -->
                                        <input type="hidden" v-model="question_id" />

                                        <!-- Question text -->
                                        <div class="form-group mb-3">
                                            <input type="text" v-model="editQuestion_name" class="form-control"
                                                placeholder="Question" />
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
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const route = useRoute();
// const teamId = route.query.id;


const editQuestion_name = ref();
const editstatus = ref();
const question_id = ref();
const editOptions = ref([]);

const items = ref("10");
const searchInput = ref('');
const status = ref('');

const questionList = ref([]);
const pagination = ref([]);

const updateQuestion = async () => {
    const formData = new FormData();
    formData.append('question', editQuestion_name.value);
    formData.append('status', editstatus.value);
    formData.append('question_id', question_id.value);
    formData.append('options', JSON.stringify(editOptions.value));

    const res = await apiFetch('/update-question', {
        method: 'POST',
        body: formData,
    });

    const data = await res.json();

    if (!res.ok) {
        if (data?.errors) {
            for (const field in data.errors) {
                data.errors[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    getQuestions();

    const modalElement = document.getElementById('edituser');
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        }
    }

    $notyf.success(data.message);
};


const QuestionDetails = async (id) => {
    const res = await apiFetch(`/questions/${id}`, {
        method: 'GET',
    });

    const data = await res.json();

    if (!res.ok) {
        $notyf.error("Failed to load question details.");
        return;
    }

    question_id.value = data.id;
    editQuestion_name.value = data.question;
    editOptions.value = data.options;
    editstatus.value = data.status;
};



const Question_name = ref();
const option = ref(['', '', '', '']);

const addQuestion = async () => {
    const formData = new FormData();
    formData.append('question', Question_name.value);

    option.value.forEach((opt, i) => {
        formData.append(`options[${i}]`, opt);
    });

    const res = await apiFetch('/questions', {
        method: 'POST',
        body: formData,
    });

    const data = await res.json();

    if (!res.ok) {
        if (data?.errors) {
            for (const field in data.errors) {
                data.errors[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    getQuestions();

    const modalElement = document.getElementById('adduser');
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        }
    }

    $notyf.success(data.message);
};

const getQuestions = async (page) => {
    const queryParams = new URLSearchParams({
        items: items.value,
        search: searchInput.value,
        status: status.value,
        page: page,
    });

    const res = await apiFetch(`/question-list?${queryParams.toString()}`, {
        method: 'GET',
    });

    const data = await res.json();

    if (!res.ok) {
        $notyf.error("Failed to fetch questions.");
        return;
    }

    questionList.value = data.data;
    pagination.value = data.pagination.links;
};


onMounted(() => {
    getQuestions();
});



</script>
