<template>
    <div class="main_container">
        <!-- sidebar start here -->
        <Sidebar />
        <!-- main container section -->
        <div class="main_content">
            <!-- navbar section -->
            <Navbar />

            <!-- content section -->
            <div class="content_section">
                <h1 class="page_title">Prize</h1>
                <div class="card app_card">
                    <div class="card-header justify-content-center">
                        <ul class="nav tabs_navigation nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="Batting-tab" data-bs-toggle="tab"
                                    data-bs-target="#Batting-tab-pane" type="button" role="tab"
                                    aria-controls="Batting-tab-pane" aria-selected="true">Batting</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="Bowling-tab" data-bs-toggle="tab"
                                    data-bs-target="#Bowling-tab-pane" type="button" role="tab"
                                    aria-controls="Bowling-tab-pane" aria-selected="false">Bowling</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="Tournament-tab" data-bs-toggle="tab"
                                    data-bs-target="#Tournament-tab-pane" type="button" role="tab"
                                    aria-controls="Tournament-tab-pane" aria-selected="false">Tournament</button>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <!-- Batting Tab -->
                            <div class="tab-pane fade" id="Batting-tab-pane" role="tabpanel"
                                aria-labelledby="Batting-tab" tabindex="0">
                                <div class="d-flex justify-content-end align-items-center m-3">
                                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add
                                        Banner</button>
                                </div>
                                <div style="min-height: 50vh;"></div>

                                <!-- Add Batting Modal -->
                                <div class="modal fade" id="adduser" tabindex="-1" aria-labelledby="adduserLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <div class="adduser_form">
                                                    <h1>Batting Prize Banner</h1>
                                                    <form @submit.prevent="addbatting" id="submitForm">
                                                        <div class="banner_image_upload">
                                                            <label for="banner">
                                                                <img v-if="imagePreviewBat" :src="imagePreviewBat"
                                                                    alt="Preview" class="preview-image w-100" />
                                                                <h1 v-else>Upload</h1>
                                                            </label>
                                                            <input type="file" hidden @change="previewImageBatting"
                                                                id="banner">
                                                        </div>
                                                        <div class="form-group mb-3">
                                                            <input type="text" placeholder="Prize Title"
                                                                v-model="batting_name" class="form-control">
                                                        </div>
                                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Bowling Tab -->
                            <div class="tab-pane fade show active" id="Bowling-tab-pane" role="tabpanel"
                                aria-labelledby="Bowling-tab" tabindex="0">
                                <div class="d-flex justify-content-end align-items-center m-3">
                                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#baner2">Add
                                        Banner</button>
                                </div>
                                <div style="min-height: 50vh;"></div>

                                <!-- Add Bowling Modal -->
                                <div class="modal fade" id="baner2" tabindex="-1" aria-labelledby="baner2Label"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <div class="adduser_form">
                                                    <h1>Bowling Prize Banner</h1>
                                                    <form @submit.prevent="addBowling" id="submitForm1">
                                                        <div class="banner_image_upload">
                                                            <label for="bannerimg">
                                                                <img v-if="imagePreview" :src="imagePreview"
                                                                    alt="Preview" class="preview-image w-100" />
                                                                <h1 v-else>Upload</h1>
                                                            </label>
                                                            <input type="file" hidden @change="previewImage"
                                                                id="bannerimg">
                                                        </div>
                                                        <div class="form-group mb-3">
                                                            <input type="text" placeholder="Prize Title"
                                                                v-model="bowling_name" class="form-control">
                                                        </div>
                                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Tournament Tab -->
                            <div class="tab-pane fade" id="Tournament-tab-pane" role="tabpanel"
                                aria-labelledby="Tournament-tab" tabindex="0">
                                <div class="d-flex justify-content-end align-items-center m-3">
                                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#baner3">Add
                                        Banner</button>
                                </div>
                                <div style="min-height: 50vh;"></div>

                                <!-- Add Tournament Modal -->
                                <div class="modal fade" id="baner3" tabindex="-1" aria-labelledby="baner3Label"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <div class="adduser_form">
                                                    <h1>Tournament Prize Banner</h1>
                                                    
                                                    <form @submit.prevent="addTournament" id="submitForm2">
                                                        <div class="banner_image_upload">
                                                            <label for="banner">
                                                                <!-- This will display the preview image if it exists -->
                                                                <img v-if="imagePreviewtournament" :src="imagePreviewtournament"
                                                                    alt="Preview" class="preview-image w-100" />
                                                                <h1 v-else>Upload</h1>
                                                            </label>
                                                            <input type="file" hidden id="banner" @change="tournamentImage">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" placeholder="Prize Title" v-model="tournament_name"
                                                                class="form-control">
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
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import axios from 'axios';

const bowling_name = ref('');
const bowling_image = ref('');
const imagePreview = ref();

const batting_name = ref('');
const batting_image = ref('');
const imagePreviewBat = ref();

const tournament_name = ref('');
const tournament_image = ref('');
const imagePreviewtournament = ref('');

// Preview image for Bowling
const tournamentImage = () => {
    const file = event.target.files[0];
    if (file) {
        if (imagePreviewtournament.value) {
            URL.revokeObjectURL(imagePreviewtournament.value); // Clear previous URL
        }
        tournament_image.value = file;
        imagePreviewtournament.value = URL.createObjectURL(file);
        console.log("file");
    }
};

// Preview image for Bowling
const previewImage = (event) => {
    const file = event.target.files[0];
    if (file) {
        if (imagePreview.value) {
            URL.revokeObjectURL(imagePreview.value); // Clear previous URL
        }
        bowling_image.value = file;
        imagePreview.value = URL.createObjectURL(file);
    }
};

// Preview image for Batting
const previewImageBatting = (event) => {
    const file = event.target.files[0];
    if (file) {
        if (imagePreviewBat.value) {
            URL.revokeObjectURL(imagePreviewBat.value); // Clear previous URL
        }
        batting_image.value = file;
        imagePreviewBat.value = URL.createObjectURL(file);
    }
};


// Add Bowling Prize Banner
const addTournament = () => {
    const formData = new FormData();
    formData.append('name', tournament_name.value);
    formData.append('image', tournament_image.value);
    formData.append('type', '3');

    axios.post('api/add-prize-banner', formData).then(response => {
        console.log(response.data);

        // Reset form
        tournament_name.value = '';
        tournament_image.value = '';
        imagePreviewtournament.value = ''; // Clear preview

        // Close modal
        let modalElement = document.getElementById("baner2");
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
    });
};

// Add Bowling Prize Banner
const addBowling = () => {
    const formData = new FormData();
    formData.append('name', bowling_name.value);
    formData.append('image', bowling_image.value);
    formData.append('type', '2');

    axios.post('api/add-prize-banner', formData).then(response => {
        console.log(response.data);

        // Reset form
        bowling_name.value = '';
        bowling_image.value = '';
        imagePreview.value = ''; // Clear preview

        // Close modal
        let modalElement = document.getElementById("baner2");
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
    });
};

// Add Batting Prize Banner
const addbatting = () => {
    const formData = new FormData();
    formData.append('name', batting_name.value);
    formData.append('image', batting_image.value);
    formData.append('type', '1');

    axios.post('api/add-prize-banner', formData).then(response => {
        console.log(response.data);

        // Reset form
        batting_name.value = '';
        batting_image.value = '';
        imagePreviewBat.value = ''; // Clear preview

        // Close modal
        let modalElement = document.getElementById("adduser");
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
    });
};
</script>
