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
                        <h3 class="page_title my-0">My Player Reports</h3>
                    </div>
                    <div class="d-flex align-items-center">
                        <!-- <button type="button" class="btn btn-primary" data-bs-target="#result"
                            data-bs-toggle="modal">Add
                            result</button> -->
                        <!-- <button type="button" class="btn btn-primary" data-bs-target="#addManual"
                            data-bs-toggle="modal">Add
                            Manual</button> -->
                    </div>
                </div>
                <div class="card app_card ">
                    <div class="card-header justify-content-center">
                        <!-- ==================== -->
                        <ul class="nav tabs_navigation nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="Batting-tab" data-bs-toggle="tab"
                                    data-bs-target="#Batting-tab-pane" type="button" role="tab"
                                    aria-controls="Batting-tab-pane" aria-selected="true">Batting</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link " id="Bowling-tab" data-bs-toggle="tab"
                                    data-bs-target="#Bowling-tab-pane" type="button" role="tab"
                                    aria-controls="Bowling-tab-pane" aria-selected="false">Bowling</button>
                            </li>
                        </ul>
                        <!-- ====================== -->
                    </div>
                    <div class="card-body">
                        <h1 class="page_title text-white ps-4 mb-0">All History</h1>
                        <div class="tab-content" id="myTabContent">
                            <!-- ======== Bating ========  -->
                            <div class="tab-pane fade show active" id="Batting-tab-pane" role="tabpanel"
                                aria-labelledby="Batting-tab" tabindex="0">
                                <ul class="report_user">
                                    <li v-for="item in batsmanDataList">
                                        <nuxt-link
                                            :to="`/max-predict/batsman?id=${item.match_id}&user_id=${item.user_id}`">
                                            <div class="img_part">
                                                <img src="/images/user.png" class="img-fluid" alt="">
                                                <div>
                                                    <h3>{{ item.user.username }}</h3>
                                                    <p>{{ item.user.email }}</p>
                                                </div>
                                            </div>
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </nuxt-link>
                                    </li>
                                </ul>
                                
                        <div class="table-responsive d-none">
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
                                </tbody>
                            </table>
                        </div>
                            </div>
                            <!-- ============= Bowlers ============= -->
                            <div class="tab-pane fade " id="Bowling-tab-pane" role="tabpanel"
                                aria-labelledby="Bowling-tab" tabindex="0">
                                <ul class="report_user">
                                    <li v-for="item in ballerDataList">
                                        <nuxt-link
                                            :to="`/max-predict/bowlers?id=${item.match_id}&user_id=${item.user_id}`">
                                            <div class="img_part">
                                                <img src="/images/user.png" class="img-fluid" alt="">
                                                <div>
                                                    <h3>{{ item.user.username }}</h3>
                                                    <p>{{ item.user.email }}</p>
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
                                                    <select name="" v-model="bat_user_id" required autocomplete="off"
                                                        id="" class="form-control">
                                                        <option value="">Select User</option>
                                                        <option v-for="user in userdata" :value="user.id">{{
                                                            user.username
                                                        }}
                                                        </option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <select name="" id="" required autocomplete="off"
                                                        class="form-control" v-model="bat_team_id"
                                                        @change="playersData">
                                                        <option value="">Select Team</option>
                                                        <option v-for="item in teamlist" :value="item.id">
                                                            {{ item.country.name }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <select name="" id="" required autocomplete="off"
                                                        class="form-control" v-model="bat_player_id">
                                                        <option value="" disabled>Select Player</option>
                                                        <option :value="item.id" v-for="item in bat_playeslist">
                                                            {{ item.player.player_name }}</option>
                                                    </select>
                                                </div>
                                                <!-- match_id	team_id	user_id	player_id	run	ball	total_4	total_6	status -->
                                                <div class="form-group mb-3">
                                                    <input type="number" class="form-control" id="" v-model="bat_run"
                                                        placeholder="run">
                                                </div>
                                                <!-- <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id="" v-model="bat_ball"
                                                        placeholder="ball">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id="" v-model="bat_four"
                                                        placeholder="Total Four">
                                                </div> -->
                                                <div class="form-group mb-3">
                                                    <input type="number" class="form-control" id="" v-model="bat_six"
                                                        placeholder="Total six">
                                                </div>
                                                <button type="submit" class="btn_primary w-100">Submit</button>
                                            </form>
                                        </div>
                                        <div class="tab-pane fade" id="Bowling-profile" role="tabpanel"
                                            aria-labelledby="nav-profile-tab" tabindex="0">
                                            <form @submit.prevent="addbowlers">
                                                <div class="form-group mb-3">
                                                    <select name="" id="" v-model="ball_user_id" class="form-control">
                                                        <option value="">Select User</option>
                                                        <option v-for="user in userdata" :value="user.id">{{
                                                            user.username
                                                        }}
                                                        </option>
                                                    </select>
                                                </div>
                                                <div v-if="teamlist" class="form-group mb-3">
                                                    <select name="" id="" class="form-control" v-model="ball_team_id"
                                                        @change="playersDataboll">
                                                        <option value="">Select Team</option>
                                                        <option v-for="item in teamlist" :value="item.id">
                                                            {{ item.country.name }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <select name="" id="" required autocomplete="off"
                                                        class="form-control" v-model="boll_player_id">
                                                        <option value="" disabled>Select Player</option>
                                                        <option :value="item.id" v-for="item in boll_playeslist">
                                                            {{ item.player.player_name }}</option>
                                                    </select>
                                                </div>
                                                <!-- <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id="name"
                                                        v-model="ball_palyer_name" placeholder="Player Name">
                                                </div> -->
                                                <!-- <div class="form-group mb-3">
                                                    <input type="text" class="form-control" v-model="ball_over"
                                                        id="name" placeholder="Over">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id="name"
                                                        v-model="ball_maden_over" placeholder="Maden Over">
                                                </div> -->
                                                <div class="form-group mb-3">
                                                    <input type="number" class="form-control" v-model="ball_run" id="name"
                                                        placeholder="Run">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <input type="number" class="form-control" v-model="ball_wicket"
                                                        id="name" placeholder="Wicket">
                                                </div>
                                                <button type="submit" class="btn_primary w-100">Submit</button>
                                            </form>
                                        </div>
                                        <!-- <div class="tab-pane fade" id="nav-contact" role="tabpanel"
                                        aria-labelledby="nav-contact-tab" tabindex="0">...</div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- --------------- Result Modal ------------------  -->
                <div class="modal fade" id="result" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">

                                <div class="adduser_form">
                                    <h1>Add Result</h1>
                                    <nav class="mb-3">
                                        <div class="nav nav-tabs justify-content-center" id="nav-tab" role="tablist">
                                            <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                                data-bs-target="#result_Batting-home" type="button" role="tab"
                                                aria-controls="nav-home" aria-selected="true">Batting</button>
                                            <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
                                                data-bs-target="#result_Bowling-profile" type="button" role="tab"
                                                aria-controls="nav-profile" aria-selected="false">Bowling</button>
                                        </div>
                                    </nav>
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="result_Batting-home" role="tabpanel"
                                            aria-labelledby="nav-home-tab" tabindex="0">
                                            <form @submit.prevent="addbatsmanresult">
                                                <div class="form-group mb-3">
                                                    <select name="" id="" required autocomplete="off"
                                                        class="form-control" v-model="result_bat_team_id"
                                                        @change="resultplayersData">
                                                        <option value="">Select Team</option>
                                                        <option v-for="item in teamlist" :value="item.id">
                                                            {{ item.country.name }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <select name="" id="" required autocomplete="off"
                                                        class="form-control" v-model="result_bat_player_id">
                                                        <option value="" disabled>Select Player</option>
                                                        <option :value="item.id" v-for="item in result_bat_playeslist">
                                                            {{ item.player.player_name }}</option>
                                                    </select>
                                                </div>
                                                <!-- match_id	team_id	user_id	player_id	run	ball	total_4	total_6	status -->
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id="" v-model="result_bat_run"
                                                        placeholder="run">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <!-- <input type="text" class="form-control" id="" v-model="result_bat_ball"
                                                        placeholder="ball">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id="" v-model="result_bat_four"
                                                        placeholder="Total Four"> -->
                                                </div>
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id="" v-model="result_bat_six"
                                                        placeholder="Total six">
                                                </div>
                                                <button type="submit" class="btn_primary w-100">Submit</button>
                                            </form>
                                        </div>
                                        <div class="tab-pane fade" id="result_Bowling-profile" role="tabpanel"
                                            aria-labelledby="nav-profile-tab" tabindex="0">
                                            <form @submit.prevent="addResultbowlers">
                                                
                                                <div v-if="teamlist" class="form-group mb-3">
                                                    <select name="" id="" class="form-control" v-model="result_ball_team_id"
                                                        @change="resultplayersDataboll">
                                                        <option value="">Select Team</option>
                                                        <option v-for="item in teamlist" :value="item.id">
                                                            {{ item.country.name }}</option>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-3">
                                                    <select name="" id="" required autocomplete="off"
                                                        class="form-control" v-model="result_boll_player_id">
                                                        <option value="" disabled>Select Player</option>
                                                        <option :value="item.id" v-for="item in result_boll_playeslist">
                                                            {{ item.player.player_name }}</option>
                                                    </select>
                                                </div>
                                                <!-- <div class="form-group mb-3">
                                                    <input type="number" class="form-control" v-model="result_ball_over"
                                                        id="name" placeholder="Over">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <input type="number" class="form-control" id="name"
                                                        v-model="result_ball_maden_over" placeholder="Maden Over">
                                                </div> -->
                                                <div class="form-group mb-3">
                                                    <input type="number" class="form-control" v-model="result_ball_run" id="name"
                                                        placeholder="Run">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <input type="number" class="form-control" v-model="result_ball_wicket"
                                                        id="name" placeholder="Wicket">
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
import { useRoute, useRouter } from 'vue-router';
import { useNuxtApp } from '#app';
import { apiFetch } from '~/utils/api';

const { $notyf } = useNuxtApp();
const route = useRoute();
const matchId = route.query.id;
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
const bat_player_id = ref('');
const bat_playeslist = ref([]);

const result_bat_team_id = ref('');
const result_bat_player_id = ref('');
const result_bat_run = ref();
const result_bat_ball = ref();
const result_bat_four = ref();
const result_bat_six = ref();
const result_bat_playeslist = ref([]);

const boll_playeslist = ref([]);

const ball_user_id = ref('');
const ball_team_id = ref('');
const boll_player_id = ref('');
const ball_over = ref('');
const ball_maden_over = ref('');
const ball_run = ref('');
const ball_wicket = ref('');

const batsmanDataList = ref([]);
const ballerDataList = ref([]);

const result_ball_team_id = ref('');
const result_boll_player_id = ref('');
const result_ball_over = ref('');
const result_ball_maden_over = ref('');
const result_ball_run = ref('');
const result_ball_wicket = ref('');
const result_boll_playeslist = ref([]);

const handleError = async (error) => {
  const response = await error.response?.json();
  if (response?.errors) {
    Object.values(response.errors).forEach(messages => {
      messages.forEach(msg => $notyf.error(msg));
    });
  } else {
    $notyf.error("An error occurred. Please try again.");
  }
};

const addResultbowlers = async () => {
  const formData = new FormData();
  formData.append('match_id', matchId);
  formData.append('team_id', result_ball_team_id.value);
  formData.append('player_id', result_boll_player_id.value);
  formData.append('over', result_ball_over.value);
  formData.append('maden_over', result_ball_maden_over.value);
  formData.append('run', result_ball_run.value);
  formData.append('wicket', result_ball_wicket.value);

  try {
    const res = await apiFetch('/api/add-boller-result', {
      method: 'POST',
      body: formData
    });
    const data = await res.json();
    const modal = bootstrap.Modal.getInstance(document.getElementById('result'));
    modal?.hide();
    $notyf.success(data.message);
  } catch (error) {
    await handleError(error);
  }
};

const addbatsmanresult = async () => {
  const formData = new FormData();
  formData.append('match_id', matchId);
  formData.append('team_id', result_bat_team_id.value);
  formData.append('player_id', result_bat_player_id.value);
  formData.append('run', result_bat_run.value);
  formData.append('ball', result_bat_ball.value);
  formData.append('four', result_bat_four.value);
  formData.append('six', result_bat_six.value);

  try {
    const res = await apiFetch('/api/add-batsman-result', {
      method: 'POST',
      body: formData
    });
    const data = await res.json();
    const modal = bootstrap.Modal.getInstance(document.getElementById('result'));
    modal?.hide();
    $notyf.success(data.message);
  } catch (error) {
    await handleError(error);
  }
};

const resultplayersData = async () => {
  const query = new URLSearchParams({ match_id: matchId, team_id: result_bat_team_id.value });
  const res = await apiFetch(`/api/max-match-players?${query}`, { method: 'GET' });
  result_bat_playeslist.value = await res.json();
};

const resultplayersDataboll = async () => {
  const query = new URLSearchParams({ match_id: matchId, team_id: result_ball_team_id.value });
  const res = await apiFetch(`/api/max-match-players?${query}`, { method: 'GET' });
  result_boll_playeslist.value = await res.json();
};

const playersData = async () => {
  const query = new URLSearchParams({ match_id: matchId, team_id: bat_team_id.value });
  const res = await apiFetch(`/api/max-match-players?${query}`, { method: 'GET' });
  bat_playeslist.value = await res.json();
};

const playersDataboll = async () => {
  const query = new URLSearchParams({ match_id: matchId, team_id: ball_team_id.value });
  const res = await apiFetch(`/api/max-match-players?${query}`, { method: 'GET' });
  boll_playeslist.value = await res.json();
};

const back = () => router.back();

const batsmanData = async () => {
  const res = await apiFetch(`/api/batsman/${matchId}`, { method: 'GET' });
  const data = await res.json();
  batsmanDataList.value = data.data;
};

const BowlersData = async () => {
  const res = await apiFetch(`/api/baller/${matchId}`, { method: 'GET' });
  const data = await res.json();
  ballerDataList.value = data.data;
};

const addbowlers = async () => {
  const formData = new FormData();
  formData.append('match_id', matchId);
  formData.append('user_id', ball_user_id.value);
  formData.append('team_id', ball_team_id.value);
  formData.append('player_id', boll_player_id.value);
  formData.append('over', ball_over.value);
  formData.append('maden_over', ball_maden_over.value);
  formData.append('run', ball_run.value);
  formData.append('wicket', ball_wicket.value);

  const res = await apiFetch('/api/add-bowler-predict', { method: 'POST', body: formData });
  await res.json();
  Object.assign(ball_user_id, { value: '' });
  Object.assign(ball_team_id, { value: '' });
  Object.assign(boll_player_id, { value: '' });
  Object.assign(ball_over, { value: '' });
  Object.assign(ball_maden_over, { value: '' });
  Object.assign(ball_run, { value: '' });
  Object.assign(ball_wicket, { value: '' });

  bootstrap.Modal.getInstance(document.getElementById('addManual'))?.hide();
  await BowlersData();
  await batsmanData();
};

const addbatsman = async () => {
  const formData = new FormData();
  formData.append('match_id', matchId);
  formData.append('user_id', bat_user_id.value);
  formData.append('team_id', bat_team_id.value);
  formData.append('player_id', bat_player_id.value);
  formData.append('run', bat_run.value);
  formData.append('ball', bat_ball.value);
  formData.append('four', bat_four.value);
  formData.append('six', bat_six.value);

  await apiFetch('/api/add-bastsman-predict', { method: 'POST', body: formData });

  Object.assign(bat_user_id, { value: '' });
  Object.assign(bat_team_id, { value: '' });
  Object.assign(bat_player_name, { value: '' });
  Object.assign(bat_player_id, { value: '' });
  Object.assign(bat_run, { value: '' });
  Object.assign(bat_ball, { value: '' });
  Object.assign(bat_four, { value: '' });
  Object.assign(bat_six, { value: '' });

  bootstrap.Modal.getInstance(document.getElementById('addManual'))?.hide();
  await BowlersData();
  await batsmanData();
};

const userList = async () => {
  const res = await apiFetch('/api/user-data', { method: 'GET' });
  userdata.value = await res.json();
};

const teamdata = async () => {
  const res = await apiFetch(`/api/team-data/${matchId}`, { method: 'GET' });
  const data = await res.json();
  teamlist.value = data.teams;
};

onMounted(() => {
  batsmanData();
  userList();
  teamdata();
  BowlersData();
});
</script>
