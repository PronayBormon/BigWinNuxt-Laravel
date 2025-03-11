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
                <h1 class="page_title">Reports</h1>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">

                            <div class="form-group d-none d-md-block me-2">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" placeholder="Search by Name,Email, Phone"
                                        class="form-control nav_search">
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
                        <ul class="report_user">
                            <li>
                                <nuxt-link to="/report-details">
                                    <div class="img_part">
                                        <img src="/images/user.png" class="img-fluid" alt="">
                                        <div>
                                            <h3>Jhone Smith</h3>
                                            <p>jhone@mail.com</p>
                                        </div>
                                    </div>
                                    <i class="fa-solid fa-arrow-right"></i>
                                </nuxt-link>
                            </li>
                            <li>
                                <nuxt-link to="/report-details">
                                    <div class="img_part">
                                        <img src="/images/user.png" class="img-fluid" alt="">
                                        <div>
                                            <h3>Jhone Smith</h3>
                                            <p>jhone@mail.com</p>
                                        </div>
                                    </div>
                                    <i class="fa-solid fa-arrow-right"></i>
                                </nuxt-link>
                            </li>
                            <li>
                                <nuxt-link to="/report-details">
                                    <div class="img_part">
                                        <img src="/images/user.png" class="img-fluid" alt="">
                                        <div>
                                            <h3>Jhone Smith</h3>
                                            <p>jhone@mail.com</p>
                                        </div>
                                    </div>
                                    <i class="fa-solid fa-arrow-right"></i>
                                </nuxt-link>
                            </li>
                            <li>
                                <nuxt-link to="/report-details">
                                    <div class="img_part">
                                        <img src="/images/user.png" class="img-fluid" alt="">
                                        <div>
                                            <h3>Jhone Smith</h3>
                                            <p>jhone@mail.com</p>
                                        </div>
                                    </div>
                                    <i class="fa-solid fa-arrow-right"></i>
                                </nuxt-link>
                            </li>
                        </ul>
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

const showPassword = ref(false);

const showHidePass = () => {
    showPassword.value = !showPassword.value;
};



</script>
