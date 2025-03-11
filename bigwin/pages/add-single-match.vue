<template>
    <div class="main_container">
        <!-- sidebar start here  -->
        <Sidebar />
        <!-- main container section  -->
        <div class="main_content">
            <!-- navbar section  -->
            <Navbar />

            <!-- content section -->
            <div class="content_section">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="page_title">Add Single Match</h1>
                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add Banner</button>
                </div>

                <!-- banner section start here -->
                <div class="banner_slider">
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="banner_slider_image">
                                    <img src="/images/banner(1).png" alt="" class="img-fluid">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="banner_slider_image">
                                    <img src="/images/banner2.png" alt="" class="img-fluid">
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="banner_slider_image">
                                    <img src="/images/banner(2).png" alt="" class="img-fluid">
                                </div>
                            </div>
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
                <!-- banner section end here -->

                <div class="card banner_card">
                    <div class="card-body">
                        <form action="">
                            <div class="row">
                                <div class="col-md-6 m-auto">
                                    <!-- <div class="team_image_upload">
                                        <div class="banner_image_upload">
                                            <label for="banner">
                                                <h1>Upload</h1>
                                            </label>
                                            <input type="file" hidden id="banner">
                                        </div>
                                        <h1>Vs</h1>

                                        <div class="banner_image_upload">
                                            <label for="banner">
                                                <h1>Upload</h1>
                                            </label>
                                            <input type="file" hidden id="banner">
                                        </div>
                                    </div> -->

                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="addMatch()">
                                            <div class="form-group mb-3">
                                                <!-- <input type="text" class="form-control" id="name" placeholder="Team A Name"> -->
                                                <select class="form-control" v-model="teamA">
                                                    <option value="">Select Team A</option>
                                                    <option v-for="(item,index) in teamList" value="1">{{item.name}}</option>
                                                </select>
                                            </div>
                                            <div class="form-group mb-3">
                                                <!-- <input type="text" class="form-control" id="name" placeholder="Team B Name"> -->
                                                 <!-- {{ teamList }} -->
                                                <select class="form-control" v-model="teamB">
                                                    <option value="">Select Team B</option>
                                                    <option v-for="(item,index) in teamList" value="1">{{item.name}}</option>
                                                    <!-- <option value="2">Pakistan</option> -->
                                                </select>
                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="text" class="form-control" v-model="dateTime"
                                                    onfocus="(this.type='datetime-local')" onblur="(this.type='text')"
                                                    placeholder="Select Date/Time GMT" id="datetime" :min="minDateTime">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Add</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Add Modal -->
                <div class="modal fade" id="adduser" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="adduser_form">
                                    <h1>Banner</h1>
                                    <form>
                                        <div class="banner_image_upload">
                                            <label for="banner">
                                                <h1>Upload</h1>
                                            </label>
                                            <input type="file" hidden id="banner">
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

const minDateTime = ref('');
const teamA = ref('');
const teamB = ref('');
const dateTime = ref('');
const teamList = ref(['']);

const addMatch = () => {
    const formData = new FormData();

    formData.append('teamA', teamA.value);
    formData.append('teamB', teamB.value);
    formData.append('dateTime', dateTime.value);

    console.log(formData);

    axios.post('api/add-match', formData).then( response =>{
        console.log(response.data);
    });
}
const getTeamList = () => {

    axios.get('api/getteamlist').then( response =>{
        teamList.value = response.data;
        // console.log(response.data);
    });
}

const bannerslider = () => {
    new Swiper(".mySwiper", {
        slidesPerView: 1.5,
        spaceBetween: 30,
        centeredSlides: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
}
const today = () => {
    const now = new Date();
    now.setMinutes(now.getMinutes() - now.getTimezoneOffset()); // Adjust for timezone

    minDateTime.value = now.toISOString().slice(0, 16); // Format: YYYY-MM-DDTHH:MM
}
onMounted(() => {
    bannerslider();
    today();
    getTeamList();
});
</script>
