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
                <h1 class="page_title">All Winners</h1>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" id="">
                                    <option value="">10</option>
                                    <option value="">20</option>
                                    <option value="">50</option>
                                    <option value="">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" placeholder="Search" class="form-control nav_search">
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
                                        <th class="text-center">Join Date</th>
                                        <th>Winner Name </th>
                                        <th>Email </th>
                                        <th class="text-center">Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">25 Jan 2025</td>
                                        <td>
                                            <div class="winner_">
                                                <img src="/images/user.png" alt="" class="img-fluid">
                                                <p>Elena Pena</p>
                                            </div>
                                        </td>
                                        <td>elenapena@gmail.com</td>
                                        <td class="text-center">
                                            <button type="button" class="btn_primary">$20</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">25 Jan 2025</td>
                                        <td>
                                            <div class="winner_">
                                                <img src="/images/user.png" alt="" class="img-fluid">
                                                <p>Elena Pena</p>
                                            </div>
                                        </td>
                                        <td>elenapena@gmail.com</td>
                                        <td class="text-center">
                                            <button type="button" class="btn_primary">$20</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">25 Jan 2025</td>
                                        <td>
                                            <div class="winner_">
                                                <img src="/images/user.png" alt="" class="img-fluid">
                                                <p>Elena Pena</p>
                                            </div>
                                        </td>
                                        <td>elenapena@gmail.com</td>
                                        <td class="text-center">
                                            <button type="button" class="btn_primary">$20</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">25 Jan 2025</td>
                                        <td>
                                            <div class="winner_">
                                                <img src="/images/user.png" alt="" class="img-fluid">
                                                <p>Elena Pena</p>
                                            </div>
                                        </td>
                                        <td>elenapena@gmail.com</td>
                                        <td class="text-center">
                                            <button type="button" class="btn_primary">$20</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">25 Jan 2025</td>
                                        <td>
                                            <div class="winner_">
                                                <img src="/images/user.png" alt="" class="img-fluid">
                                                <p>Elena Pena</p>
                                            </div>
                                        </td>
                                        <td>elenapena@gmail.com</td>
                                        <td class="text-center">
                                            <button type="button" class="btn_primary">$20</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">25 Jan 2025</td>
                                        <td>
                                            <div class="winner_">
                                                <img src="/images/user.png" alt="" class="img-fluid">
                                                <p>Elena Pena</p>
                                            </div>
                                        </td>
                                        <td>elenapena@gmail.com</td>
                                        <td class="text-center">
                                            <button type="button" class="btn_primary">$20</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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
const globalScript = useGlobalScript();

const showPassword = ref(false);

const showHidePass = () => {
    showPassword.value = !showPassword.value;
};



</script>
