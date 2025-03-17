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
                <h1 class="page_title">Team List</h1>
                <div class="card app_card">
                    <div class="card-body">

                        <div class="d-flex justify-content-end align-items-center m-3">
                            <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#baner3">Add
                                New Team</button>
                        </div>
                        <ul class="report_user country_team">
                            <li v-if="countries && countries.length" v-for="(item, index) in countries" :key="index">
                                <nuxt-link>
                                    <div class="country_">
                                        <img :src="item.image" class="img-fluid" alt="">
                                        <div>
                                            <h3>{{ item.name }}</h3>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <button @click="DelId(item.id,item.name)" data-bs-toggle="modal" :data-bs-target="'#deleteConfirm'+ item.id" class="btn "><i class="fa-regular fa-trash text-danger"
                                            ></i></button>
                                    </div>
                                </nuxt-link>
                                <!-- Modal  -->
                                <div class="modal fade" :id="'deleteConfirm'+ item.id" tabindex="-1"
                                    aria-labelledby="adduserLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <div class="adduser_form">
                                                    <h1>Are you sure?</h1>
                                                    <p class="text-danger text-center">{{delete_name}}</p>
                                                    <a @click="deletCountry(item.id)" type="button"
                                                        class="btn w-100 text-white bg-danger text-center d-flex justify-content-center">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="text-center" v-else style="background-color: var(--scondary_color);">
                                <p class="text-center text-white">No Data Available.</p>
                            </li>


                        </ul>
                    </div>
                </div>

                <!-- Add Modal -->
                <div class="modal fade" id="baner3" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="adduser_form">
                                    <h1>Add New Team</h1>
                                    <form @submit.prevent="submitForm" id="submitForm">
                                        <div class="banner_image_upload">
                                            <label for="banner">
                                                <img v-if="imagePreview" :src="imagePreview" alt="Preview"
                                                    class="preview-image w-100" />
                                                <h1 v-else>Upload</h1>

                                            </label>
                                            <input type="file" hidden id="banner" ref="images" @change="previewImage">
                                        </div>


                                        <div class="form-group mb-3">
                                            <input type="text" v-model="country_name" class="form-control"
                                                placeholder="Team Name">
                                        </div>

                                        <button type="submit" class="btn_primary w-100">Submit</button>
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
    import axios from 'axios';
    import { useGlobalScript } from '@/stores/globalScript';
    const globalScript = useGlobalScript();

    const showPassword = ref(false);
    const country_name = ref('');
    const country_image = ref('');
    const countries = ref([]);

    const delete_id = ref(['']);
    const delete_name = ref(['']);

    const imagePreview = ref(null);

    const previewImage = (event) => {
        const file = event.target.files[0];
        if (file) {
            country_image.value = file;
            imagePreview.value = URL.createObjectURL(file); // Generate preview URL
        }
    };

    const DelId = (id, name) => {
        delete_id.value = id;
        delete_name.value = name;
    }
    const submitForm = () => {
        const formData = new FormData();
        formData.append('name', country_name.value);
        if (country_image.value) {
            formData.append("image", country_image.value);
        }
        axios.post('/api/add-country', formData).then(response => {
            // console.log(response.data);
            getCountryList();

            const form = document.getElementById("submitForm");
            if (form) {
                form.reset(); // Correct method to reset the form
            }

            let modalElement = document.getElementById("baner3");
            if (modalElement) {
                let modalInstance = bootstrap.Modal.getInstance(modalElement);
                if (modalInstance) {
                    modalInstance.hide();
                }
            }
        })
    };

    const showHidePass = () => {
        showPassword.value = !showPassword.value;
    };
    const getCountryList = () => {

        axios.post('/api/get-country').then(response => {
            // console.log(response.data.data);
            countries.value = response.data.data;

        })
    }
    const deletCountry = (id) => {

        axios.delete(`/api/delete-country/${id}`).then(response => {

            let modalElement = document.getElementById(`deleteConfirm${id}`);
            if (modalElement) {
                let modalInstance = bootstrap.Modal.getInstance(modalElement);
                if (modalInstance) {
                    modalInstance.hide();
                }
            }
            getCountryList();
        })
    }

    onMounted(() => {
        getCountryList();
    });

</script>