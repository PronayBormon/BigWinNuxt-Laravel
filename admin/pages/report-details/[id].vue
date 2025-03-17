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
                        <h3 class="page_title my-0">Reports</h3>
                    </div>
                    <button type="button" class="btn btn-primary" data-bs-target="#addManual" data-bs-toggle="modal">Add
                        Manual</button>
                </div>
                <div class="card app_card ">
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
                                    <li v-for="item in batsmanDataList">
                                        <nuxt-link :to="`/report-details/batsman?id=${item.match_id}&user_id=${item.user_id}`">
                                            <div class="img_part">
                                                <img src="/images/user.png" class="img-fluid" alt="">
                                                <div>
                                                    <h3>{{item.user.username}}</h3>
                                                    <p>{{item.user.email}}</p>
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
                                    <li v-for="item in ballerDataList">
                                        <nuxt-link :to="`/report-details/bowlers?id=${item.match_id}&user_id=${item.user_id}`">
                                            <div class="img_part">
                                                <img src="/images/user.png" class="img-fluid" alt="">
                                                <div>
                                                    <h3>{{item.user.username}}</h3>
                                                    <p>{{item.user.email}}</p>
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

                <!-- =-============ Modal ============ -->
                 
            <div class="modal fade" id="addManual" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">

                            <div class="adduser_form">
                                <h1>Add Prediction</h1>
                                <nav class="mb-3">
                                    <div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
                                        <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                            data-bs-target="#Batting-home" type="button" role="tab"
                                            aria-controls="nav-home" aria-selected="true">Batting</button>
                                        <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
                                            data-bs-target="#Bowling-profile" type="button" role="tab"
                                            aria-controls="nav-profile" aria-selected="false">Bowling</button>
                                    </div>
                                </nav>
                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="Batting-home" role="tabpanel"
                                        aria-labelledby="nav-home-tab" tabindex="0">
                                        <form @submit.prevent="addbatsman">
                                            <div class="form-group mb-3">
                                                <select name="" v-model="bat_user_id" required autocomplete="off" id="" class="form-control">
                                                    <option value="">Select User</option>
                                                    <option v-for="user in userdata" :value="user.id">{{ user.username
                                                        }}
                                                    </option>
                                                </select>
                                            </div>
                                            <div class="form-group mb-3"
                                                v-if="teamlist && teamlist.team_a && teamlist.team_b">
                                                <select name="" id="" required autocomplete="off" class="form-control" v-model="bat_team_id">
                                                    <option value="">Select Team</option>
                                                    <option :value="teamlist.team_a.id">{{ teamlist.team_a.name }}
                                                    </option>
                                                    <option :value="teamlist.team_b.id">{{ teamlist.team_b.name }}
                                                    </option>
                                                </select>
                                            </div>

                                            <div class="form-group mb-3">
                                                <input type="text" required autocomplete="off" class="form-control" v-model="bat_player_name"
                                                    id="name" placeholder="Player Name">
                                            </div>

                                            <div class="form-group mb-3">
                                                <input type="text" required autocomplete="off" v-model="bat_run" class="form-control" id="run"
                                                    placeholder="Run">
                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="text" required autocomplete="off" v-model="bat_ball" class="form-control" id="Ball"
                                                    placeholder="Ball">
                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="text" required autocomplete="off" v-model="bat_four" class="form-control" id="4"
                                                    placeholder="Total 4">
                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="text" required autocomplete="off" v-model="bat_six" class="form-control" id="6"
                                                    placeholder="Total 6">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Submit</button>
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="Bowling-profile" role="tabpanel"
                                        aria-labelledby="nav-profile-tab" tabindex="0">
                                        <form  @submit.prevent="addbowlers">
                                            <div class="form-group mb-3">
                                                <select name="" id="" v-model="ball_user_id" class="form-control">
                                                    <option value="">Select User</option>
                                                    <option v-for="user in userdata" :value="user.id">{{ user.username
                                                        }}
                                                    </option>
                                                </select>
                                            </div>
                                            <div v-if="teamlist && teamlist.team_a && teamlist.team_b"
                                                class="form-group mb-3">
                                                <select name="" id="" class="form-control" v-model="ball_team_id">
                                                    <option value="">Select Team</option>
                                                    <option :value="teamlist.team_a.id">{{ teamlist.team_a.name }}
                                                    </option>
                                                    <option :value="teamlist.team_b.id">{{ teamlist.team_b.name }}
                                                    </option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group mb-3">
                                                <input type="text" class="form-control" id="name" v-model="ball_palyer_name"
                                                    placeholder="Player Name">
                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="text" class="form-control"  v-model="ball_over" id="name" placeholder="Over">
                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="text" class="form-control" id="name"  v-model="ball_maden_over"
                                                    placeholder="Maden Over">
                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="text" class="form-control"  v-model="ball_run" id="name" placeholder="Run">
                                            </div>
                                            <div class="form-group mb-3">
                                                <input type="text" class="form-control"  v-model="ball_wicket" id="name" placeholder="Wicket">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Submit</button>
                                        </form>
                                    </div>
                                    <!-- <div class="tab-pane fade" id="nav-contact" role="tabpanel"
                                        aria-labelledby="nav-contact-tab" tabindex="0">...</div> -->
                                </div>
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
import { ref, onMounted } from 'vue';
import { useGlobalScript } from '@/stores/globalScript';
import { useRoute } from 'vue-router';
import axios from 'axios';

const route = useRoute();
const matchId = route.params.id;
// console.log("==============" + matchId);

const router = useRouter();
const globalScript = useGlobalScript();

const userdata = ref();
const teamlist = ref([]);

const bat_team_id = ref('');
const bat_player_name = ref();
const bat_run = ref();
const bat_ball = ref();
const bat_four = ref();
const bat_six = ref();
const bat_user_id = ref('');

const ball_user_id = ref('');
const ball_team_id = ref('');
const ball_palyer_name = ref('');
const ball_over = ref('');
const ball_maden_over = ref('');
const ball_run = ref('');
const ball_wicket = ref('');
const batsmanDataList = ref([]);
const ballerDataList = ref([]);

const back = () => {
    router.back();
}
const BowlersData = () =>{    
    const id = matchId;     
    axios.get(`api/batsman/${id}`).then( response =>{
        // console.log(response.data);
        batsmanDataList.value = response.data.data;
    })
}

const batsmanData = () =>{    
    const id = matchId;     
    axios.get(`api/baller/${id}`).then( response =>{
        // console.log(response.data);
        ballerDataList.value = response.data.data;
    })
}

const  addbowlers = () => {
    const formData = new FormData();

    formData.append('match_id', matchId);
    formData.append('user_id', ball_user_id.value);
    formData.append('team_id', ball_team_id.value);
    formData.append('player_name', ball_palyer_name.value);
    formData.append('over', ball_over.value);
    formData.append('maden_over', ball_maden_over.value);
    formData.append('run', ball_run.value);
    formData.append('wicket', ball_wicket.value);

    axios.post('api/add-bowler-predict',formData).then(response =>{
        ball_user_id.value = "";
        ball_team_id.value = "";
        ball_palyer_name.value = "";
        ball_over.value = "";
        ball_maden_over.value = "";
        ball_run.value = "";
        ball_wicket.value = "";

        let modalElement = document.getElementById('addManual');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
        BowlersData();
        batsmanData();
    })


}

const addbatsman = () => {
    const formData = new FormData();

    formData.append('match_id', matchId);
    formData.append('user_id', bat_user_id.value);
    formData.append('team_id', bat_team_id.value);
    formData.append('player_name', bat_player_name.value);
    formData.append('run', bat_run.value);
    formData.append('ball', bat_ball.value);
    formData.append('four', bat_four.value);
    formData.append('six', bat_six.value);

    // console.log(formData);
    axios.post('api/add-bastsman-predict', formData).then(response => {
        // console.log(response.data);
        bat_team_id.value = "";
        bat_player_name.value = "";
        bat_run.value = "";
        bat_ball.value = "";
        bat_user_id.value = "";
        bat_six.value = "";
        bat_four.value = "";

        let modalElement = document.getElementById('addManual');
        if (modalElement) {
            let modalInstance = bootstrap.Modal.getInstance(modalElement);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
        BowlersData();
        batsmanData();
    })
}
const userList = () => {
    axios.get('api/user-data').then(Response => {
        // console.log(Response.data);
        userdata.value = Response.data;
    })
}

const teamdata = async () => {
    try {
        const id = matchId; // Ensure matchId is defined
        if (!id) {
            console.error("matchId is undefined or null");
            return;
        }
        const response = await axios.get(`api/team-data/${id}`);
        // console.log(response.data); // Check the structure of this response
        teamlist.value = response.data; // Assuming teamlist is a ref() or reactive()
    } catch (error) {
        console.error("Error fetching team data:", error);
    }
};


onMounted(() => {
    userList();
    teamdata();
    batsmanData();
    BowlersData();
})



</script>
