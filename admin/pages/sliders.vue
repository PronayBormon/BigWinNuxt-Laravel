<template>
    <div class="main_container">
        <!-- sidebar start here  -->
        <Sidebar />
        <!-- main container section  -->
        <div class="main_content">
            <!-- navbar section  -->
            <Navbar />

            <!-- content section -->
            <div class="content_section" style="overflow-x: hidden;">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="page_title">Sliders </h1>
                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add Banner</button>
                </div>

                <!-- banner section start here -->
                <div class="banner_slider">
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide" v-for="(item, index) in sliderListdata" :key="index">
                                <div class="banner_slider_image">
                                    <img :src="item.banner" alt="item.banner" class="img-fluid">
                                </div>
                                <button type="button" class="btn-danger btn btn-sm mx-auto d-flex my-2" @click="deleteSlider(item.id)">Delete</button>
                            </div>
                            <!-- <div class="swiper-slide">
                                <div class="banner_slider_image">
                                    <img src="/images/banner2.png" alt="" class="img-fluid">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="banner_slider_image">
                                    <img src="/images/banner(2).png" alt="" class="img-fluid">
                                </div>
                            </div> -->
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
                <!-- banner section end here -->


                                

                <!-- Add Modal -->
                <div class="modal fade" id="adduser" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="adduser_form">
                                    <h1>Banner</h1>
                                    <form @submit.prevent="addBanner">
                                        <div class="banner_image_upload">
                                            <label for="banner">
                                                <img v-if="imagePreview" :src="imagePreview" alt="" class="preview-image w-100">
                                                <h1 v-else>Upload</h1>
                                            </label>
                                            <input type="file" hidden id="banner"  @change="uploadImagePreview">
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
import { onMounted } from "vue";
import axios from "axios";
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const sliderListdata = ref([]);
const imagePreview = ref();
const bannerImage = ref();

const uploadImagePreview = (event) =>{
    const file = event.target.files[0];
    if (file) {
        if (imagePreview.value) {
            URL.revokeObjectURL(imagePreview.value); // Clear previous URL
        }
        bannerImage.value = file;
        imagePreview.value = URL.createObjectURL(file); // Create a new preview URL
    }
}
const addBanner = () =>{
    const formData = new FormData();
    formData.append('image', bannerImage.value);

    axios.post('api/add-slider',formData).then(response =>{
        // console.log(response.data);
        bannerImage.value = "";
        imagePreview.value = "";
        let modalElement = document.getElementById("adduser");
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
        sliderList();
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
const bannerslider = () => {
    new Swiper(".mySwiper", {
        slidesPerView: 1.5,
        spaceBetween: 30,
        loop: true,
        centeredSlides: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
}
const sliderList = () =>{
    axios.get('api/slider-list').then(response => {
        // console.log(response.data);
        sliderListdata.value = response.data;
    })
}

const deleteSlider = (id) =>{
    axios.get(`api/delete-slider/${id}`).then(response =>{
        console.log(response.data);
        sliderList();
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

onMounted(() => {
    bannerslider();
    sliderList();
});
</script>
