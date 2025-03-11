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
                <h1 class="page_title">Prize</h1>
                <div class="card app_card">
                    <div class="card-header justify-content-center">
                        <!-- ==================== -->
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
                        <!-- ====================== -->
                    </div>
                    <div class="card-body">
                        
                        <div class="tab-content" id="myTabContent">
                            <!-- ======== Single Mach ========  -->
                            <div class="tab-pane fade" id="Batting-tab-pane" role="tabpanel"
                                aria-labelledby="Batting-tab" tabindex="0">

                                <div class="d-flex justify-content-end align-items-center m-3">
                                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add
                                        Banner</button>
                                </div>
                                <div style="min-height: 50vh;">

                                </div>

                                <!-- Add Modal -->
                                <div class="modal fade" id="adduser" tabindex="-1" aria-labelledby="adduserLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <div class="adduser_form">
                                                    <h1>Batting Prize Banner</h1>
                                                    <form @submti.prevent="addBowling">
                                                        <div class="banner_image_upload">
                                                            <label for="banner">
                                                                <h1>Upload</h1>
                                                            </label>
                                                            <input type="file" hidden id="banner">
                                                        </div>
                                                        <div class="form-group mb-3">
                                                            <input type="text" placeholder="Prize Title" class="form-control">
                                                        </div>
                                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- ============= Max-predict ============= -->
                            <div class="tab-pane fade show active" id="Bowling-tab-pane" role="tabpanel"
                                aria-labelledby="Bowling-tab" tabindex="0">

                                <div class="d-flex justify-content-end align-items-center m-3">
                                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#baner2">Add
                                        Banner</button>
                                </div>
                                <div style="min-height: 50vh;">

                                </div>

                                <!-- Add Modal -->
                                <div class="modal fade" id="baner2" tabindex="-1" aria-labelledby="adduserLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <div class="adduser_form">
                                                    <h1>Bowling Prize Banner</h1>
                                                    <form>
                                                        <div class="banner_image_upload">
                                                            <label for="banner">
                                                                <h1>Upload</h1>
                                                            </label>
                                                            <input type="file" hidden id="banner">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" placeholder="Prize Title" class="form-control">
                                                        </div>
                                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- =============== Tournament =================  -->
                            <div class="tab-pane fade" id="Tournament-tab-pane" role="tabpanel"
                                aria-labelledby="Tournament-tab" tabindex="0">

                                <div class="d-flex justify-content-end align-items-center m-3">
                                    <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#baner3">Add
                                        Banner</button>
                                </div>
                                <div style="min-height: 50vh;">

                                </div>

                                <!-- Add Modal -->
                                <div class="modal fade" id="baner3" tabindex="-1" aria-labelledby="adduserLabel"
                                    aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-body">
                                                <div class="adduser_form">
                                                    <h1>Tournament Prize Banner</h1>
                                                    <form>
                                                        <div class="banner_image_upload">
                                                            <label for="banner">
                                                                <h1>Upload</h1>
                                                            </label>
                                                            <input type="file" hidden id="banner">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" placeholder="Prize Title" class="form-control">
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
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
const globalScript = useGlobalScript();

const showPassword = ref(false);
const bowling_name = ref();


const showHidePass = () => {
    showPassword.value = !showPassword.value;
};

const addBowling = () =>{
    const formData = new FormData();

    formData.append('name', bowling_name.value);
}


</script>
