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
                        <h1 class="page_title text-white ps-4 mb-0">All History</h1>
                        <div class="tab-content" id="myTabContent">
                            <!-- ======== Bating ========  -->
                            <div class="tab-pane fade" id="Batting-tab-pane" role="tabpanel"
                                aria-labelledby="Batting-tab" tabindex="0">
                                <ul class="report_user">
                                    <li>
                                        <nuxt-link to="/report-details/batsman">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/batsman">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/batsman">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/batsman">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/batsman">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                </ul>
                            </div>
                            <!-- ============= Bowlers ============= -->
                            <div class="tab-pane fade show active" id="Bowling-tab-pane" role="tabpanel"
                                aria-labelledby="Bowling-tab" tabindex="0">
                                <ul class="report_user">
                                    <li>
                                        <nuxt-link to="/report-details/bowlers">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/bowlers">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/bowlers">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/bowlers">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/bowlers">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                </ul>
                            </div>
                            <!-- =============== Tournament =================  -->
                            <div class="tab-pane fade" id="Tournament-tab-pane" role="tabpanel"
                                aria-labelledby="Tournament-tab" tabindex="0">
                                <ul class="report_user">
                                    <li>
                                        <nuxt-link to="/report-details/tournament">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/tournament">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/tournament">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/tournament">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                    <li>
                                        <nuxt-link to="/report-details/tournament">
                                            <div class="img_part">
                                                <div>
                                                    <h3>Team A Vs Team B</h3>
                                                    <p>08:25 PM</p>
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
