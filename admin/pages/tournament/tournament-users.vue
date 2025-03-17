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
                    <div class="d-flex align-items-center my-2">
                        <button type="button" @click="back" class="btn btn-default py-0"><i
                                class="fa-solid fa-arrow-left"></i></button>
                        <h3 class="page_title my-0"><span v-if="tournamename">{{ tournamename }}</span></h3>
                    </div>
                    <button type="button" class="btn btn-primary" data-bs-target="#addManual" data-bs-toggle="modal">Add
                        Manual</button>
                </div>
                <div class="card app_card ">
                    <div class="card-body">
                        <h1 class="page_title text-white ps-4 mb-0">All History</h1>

                        <ul class="report_user">
                            <li>
                                <nuxt-link :to="`/tournament/tournament-details?id=`">
                                    <div class="img_part">
                                        <img src="/images/user.png" class="img-fluid" alt="">
                                        <div>
                                            <h3>urer</h3>
                                            <p>user@mail.com</p>
                                        </div>
                                    </div>
                                    <i class="fa-solid fa-arrow-right"></i>
                                </nuxt-link>
                            </li>
                        </ul>

                    </div>
                </div>

                <!-- =-============ Modal ============ -->

                <div class="modal fade" id="addManual" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">

                                <div class="adduser_form">
                                    <h1>Add Prediction</h1>

                                    <form @submit.prevent="addbatsman">
                                        <div class="form-group mb-3">
                                            <select name="" v-model="bat_user_id" required autocomplete="off" id=""
                                                class="form-control">
                                                <option value="">Select User</option>
                                                <option v-for="user in userdata" :value="user.id">{{
                                                    user.username
                                                    }}
                                                </option>
                                            </select>
                                        </div>
                                        <label for="">Team 1</label>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <select name="" id="" class="form-control">
                                                        <option value="">Select Team</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" placeholder="HWT">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" placeholder="HS">
                                                </div>
                                            </div>
                                        </div>
                                        <label for="">Team 2</label>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <select name="" id="" class="form-control">
                                                        <option value="">Select Team</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" placeholder="HWT">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" placeholder="HS">
                                                </div>
                                            </div>
                                        </div>
                                        <label for="">Team 3</label>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <select name="" id="" class="form-control">
                                                        <option value="">Select Team</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" placeholder="HWT">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" placeholder="HS">
                                                </div>
                                            </div>
                                        </div>
                                        <label for="">Team 4</label>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group mb-3">
                                                    <select name="" id="" class="form-control">
                                                        <option value="">Select Team</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" placeholder="HWT">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" placeholder="HS">
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                    </form>
                                    <!-- ============ -->

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
import { onMounted, ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import axios from 'axios';

const route = useRoute();
const router = useRouter();  // Initialize router

const tid = route.query.id;
const tournamename = route.query.tournament;

const userdata = ref([]);
const bat_user_id = ref("");

// console.log(tid);

const back = () => {
    router.back(); // Correct method to navigate back
}

const userList = () => {
    axios.get('api/user-data').then(Response => {
        // console.log(Response.data);
        userdata.value = Response.data;
    })
}

onMounted(() => {
    userList();
});
</script>
