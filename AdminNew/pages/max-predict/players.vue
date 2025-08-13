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
                <div class="d-flex align-items-center justify-content-between">
                    <h1 class="page_title"> <button @click.prevent="back" class="border-0 bg-transparent"
                            type="button"><i class="fa-solid fa-arrow-left"></i></button> My Player List </h1>
                    <h1 v-if="teamlist && teamlist.length >= 2" class="m-0 page_title">
                        <span v-if="teamlist[0]?.country?.name && teamlist[1]?.country?.name">
                            {{ teamlist[0].country.name }} vs {{ teamlist[1].country.name }}
                        </span>
                    </h1>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card app_card">
                            <div class="card-body">
                                <div class="adduser_form">
                                    <h4 class="text-center text-white mb-2">Input Player Result</h4>
                                    <hr>
                                    <nav class="mb-3 tabnav">
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
                                                    <input type="text" class="form-control" id=""
                                                        v-model="result_bat_run" placeholder="run">
                                                </div>
                                                <!-- <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id=""
                                                        v-model="result_bat_ball" placeholder="ball">
                                                </div> -->
                                                <!-- <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id=""
                                                        v-model="result_bat_four" placeholder="Total Four">
                                                </div> -->
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id=""
                                                        v-model="result_bat_six" placeholder="Total six">
                                                </div>
                                                <button type="submit" class="btn_primary w-100">Submit</button>
                                            </form>
                                        </div>
                                        <div class="tab-pane fade" id="result_Bowling-profile" role="tabpanel"
                                            aria-labelledby="nav-profile-tab" tabindex="0">
                                            <form @submit.prevent="addResultbowlers">

                                                <div v-if="teamlist" class="form-group mb-3">
                                                    <select name="" id="" class="form-control"
                                                        v-model="result_ball_team_id" @change="resultplayersDataboll">
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
                                                    <input type="text" class="form-control" v-model="result_ball_over"
                                                        id="name" placeholder="Over">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" id="name"
                                                        v-model="result_ball_maden_over" placeholder="Maden Over">
                                                </div> -->
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" v-model="result_ball_run"
                                                        id="name" placeholder="Run">
                                                </div>
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" v-model="result_ball_wicket"
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
                    <div class="col-md-8">

                        <div class="card app_card">
                            <div class="card-header">
                                <form>
                                    <div class="header_filter">
                                        <div class="show_">
                                            <p>Show</p>
                                            <select name="item" id="item-select" v-model="items" @change="teamData(1)">
                                                <option value="10" selected>10</option>
                                                <option value="20">20</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select>
                                        </div>

                                        <div class="form-group d-none d-md-block">
                                            <div class="seach_box">
                                                <i class="fa-solid fa-search"></i>
                                                <input type="text" placeholder="Search" v-model="searchInput"
                                                    @input="teamData(1)" name="search"
                                                    class="form-control nav_search" />
                                            </div>
                                        </div>

                                        <!-- <div class="form-group">
                                    <select name="status" id="status-select" v-model="status" @change="teamData(1)">

                                        <option value="">All</option>
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div> -->
                                    </div>
                                </form>
                                <!-- <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#editList">Edit List
                        </button> -->
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="thead">
                                            <tr>
                                                <!-- <th class="text-start">Tournament name</th> -->
                                                <th>Player Name</th>
                                                <th>Team</th>
                                                <!-- <th>Status</th> -->
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-if="playersList && playersList.length"
                                                v-for="(items, index) in playersList" :key="items.id">
                                                <td class="text-start">
                                                    {{ items.player.player_name }}

                                                    <p class=" pt-1" v-if="items.boll_result != null"
                                                        style="color: #000;">
                                                        <Strong>Boller Result: </Strong>
                                                        <!-- <span>Over: {{ items.boll_result.over }}</span>
                                                        <span class="mx-2">Maden Over: {{ items.boll_result.maden_over
                                                        }}</span> -->
                                                        <span class="mx-2">Run: {{ items.boll_result.run }}</span>
                                                        <span class="mx-2">Wicket: {{ items.boll_result.wicket }}</span>
                                                    </p>
                                                    <p class=" pb-1" v-if="items.bat_result != null"
                                                        style="color: #000;">
                                                        <Strong>Bat Result: </Strong>
                                                        <span class="mx-2">Run: {{ items.bat_result.run }}</span>
                                                        <!-- <span>Boll: {{ items.bat_result.ball }}</span>
                                                        <span class="mx-2">4s: {{ items.bat_result.total_4
                                                        }}</span> -->
                                                        <span class="mx-2">6s: {{ items.bat_result.total_6 }}</span>
                                                    </p>

                                                </td>
                                                <td class="text-start">{{ items.team.country.name }}</td>

                                                <td>
                                                    <button @click="addResult(items)" class="btn btn_default">Add
                                                        Result</button>
                                                </td>
                                            </tr>
                                            <tr v-else>
                                                <td colspan="6" class="text-center"><span class="my-4">No data
                                                        available</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!-- Pagination -->
                                    <ul class="pagination">
                                        <li v-for="link in pagination" :key="link.label"
                                            :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                            <a v-if="link.url" href="#"
                                                @click.prevent="teamData(link.url.split('page=')[1])" class="page-link">
                                                {{ link.label }}
                                            </a>
                                            <span v-else>{{ link.label }}</span>
                                        </li>
                                    </ul>


                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!--add Modal -->
                <div class="modal fade" id="editList" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="adduser_form">
                                    <h1>Edit Team List</h1>

                                    <div class="d-flex align-items-center flex-wrap">
                                        <span v-for="(items, index) in teamList"
                                            class="badge text-dark d-flex align-items-center">{{ items.team.name }}
                                            <button type="button" @click="removeTeam(items.team.id)"
                                                class="btn btn-danger btn-sm ms-1 p-0 px-2">-</button>
                                        </span>
                                    </div>

                                    <form @submit.prevent="addTeams">

                                        <div class="form-group">
                                            <label class="text-white">Select Teams</label>
                                            <div v-for="item in teams" :key="item.id" class="form-check">
                                                <input type="checkbox" :id="'team-' + item.name" :value="item.id"
                                                    v-model="selectedTeamsid" class="form-check-input">
                                                <label :for="'team-' + item.name" class="form-check-label">
                                                    {{ item.name }}
                                                </label>
                                            </div>

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
import { ref, onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';

import { apiFetch } from '~/utils/api'
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();


const route = useRoute();
const router = useRouter();
const id = route.query.predict_id;

const items = ref("10");
const searchInput = ref('');
const status = ref('');

const teamList = ref([]);
const pagination = ref([]);
const teams = ref([]);
const playersList = ref([]);
const teamlist = ref([]);

const result_bat_id = ref('');
const result_bat_team_id = ref('');
const result_bat_player_id = ref('');
const result_bat_run = ref();
const result_bat_ball = ref();
const result_bat_four = ref();
const result_bat_six = ref();
const result_bat_playeslist = ref([]);

const result_ball_id = ref('');
const result_ball_team_id = ref('');
const result_boll_player_id = ref('');
const result_ball_over = ref('');
const result_ball_maden_over = ref('');
const result_ball_run = ref('');
const result_ball_wicket = ref('');
const result_boll_playeslist = ref([]);

const back = () => {
    router.back();
}
const addResultbowlers = async () => {
  try {
    const formData = new FormData();
    formData.append('id', result_ball_id.value);
    formData.append('match_id', id);
    formData.append('team_id', result_ball_team_id.value);
    formData.append('player_id', result_boll_player_id.value);
    formData.append('over', result_ball_over.value);
    formData.append('maden_over', result_ball_maden_over.value);
    formData.append('run', result_ball_run.value);
    formData.append('wicket', result_ball_wicket.value);

    const response = await apiFetch('/api/add-boller-result', {
      method: 'POST',
      body: formData,
    });
    const data = await response.json();

    const modalElement = document.getElementById('result');
    if (modalElement) {
      const modalInstance = bootstrap.Modal.getInstance(modalElement);
      if (modalInstance) modalInstance.hide();
    }

    $notyf.success(data.message);

    result_ball_team_id.value = "";
    result_boll_player_id.value = "";
    result_ball_over.value = "";
    result_ball_maden_over.value = "";
    result_ball_run.value = "";
    result_ball_wicket.value = "";

    teamData();

  } catch (error) {
    handleApiError(error);
  }
};

const addbatsmanresult = async () => {
  try {
    const formData = new FormData();
    formData.append('id', result_bat_id.value);
    formData.append('match_id', id);
    formData.append('team_id', result_bat_team_id.value);
    formData.append('player_id', result_bat_player_id.value);
    formData.append('run', result_bat_run.value);
    // formData.append('ball', result_bat_ball.value);
    // formData.append('four', result_bat_four.value);
    formData.append('six', result_bat_six.value);

    const response = await apiFetch('/api/add-batsman-result', {
      method: 'POST',
      body: formData,
    });
    const data = await response.json();

    const modalElement = document.getElementById('result');
    if (modalElement) {
      const modalInstance = bootstrap.Modal.getInstance(modalElement);
      if (modalInstance) modalInstance.hide();
    }

    $notyf.success(data.message);
    teamData();

  } catch (error) {
    handleApiError(error);
  }
};

const addResult = (items) => {
  if (items.bat_result != null) {
    result_bat_id.value = items.bat_result.id;
    result_bat_run.value = items.bat_result.run;
    result_bat_ball.value = items.bat_result.ball;
    result_bat_four.value = items.bat_result.total_4;
    result_bat_six.value = items.bat_result.total_6;
  } else {
    result_bat_id.value = "";
    result_bat_run.value = "";
    result_bat_ball.value = "";
    result_bat_four.value = "";
    result_bat_six.value = "";
  }

  if (items.boll_result != null) {
    result_ball_id.value = items.boll_result.id;
    result_ball_over.value = items.boll_result.over;
    result_ball_maden_over.value = items.boll_result.maden_over;
    result_ball_run.value = items.boll_result.run;
    result_ball_wicket.value = items.boll_result.wicket;
  } else {
    result_ball_id.value = "";
    result_ball_over.value = "";
    result_ball_maden_over.value = "";
    result_ball_run.value = "";
    result_ball_wicket.value = "";
  }

  result_ball_team_id.value = items.predict_team_id;
  result_bat_team_id.value = items.predict_team_id;

  resultplayersData();
  resultplayersDataboll();

  result_boll_player_id.value = items.id;
  result_bat_player_id.value = items.id;
};

const teamData = async (page = 1) => {
  try {
    const query = new URLSearchParams({
      id: id,
      items: items.value,
      searchInput: searchInput.value,
      status: status.value,
      page: page,
    });

    const response = await apiFetch(`/api/maxpredict-playerList?${query.toString()}`, {
      method: 'GET',
    });
    const data = await response.json();

    playersList.value = data.data;
    pagination.value = data.pagination.links;
  } catch (error) {
    handleApiError(error);
  }
};

const resultplayersData = async () => {
  try {
    const query = new URLSearchParams({
      match_id: id,
      team_id: result_bat_team_id.value,
    });

    const response = await apiFetch(`/api/max-match-players?${query.toString()}`, {
      method: 'GET',
    });
    const data = await response.json();

    result_bat_playeslist.value = data;
  } catch (error) {
    handleApiError(error);
  }
};

const resultplayersDataboll = async () => {
  try {
    const query = new URLSearchParams({
      match_id: id,
      team_id: result_ball_team_id.value,
    });

    const response = await apiFetch(`/api/max-match-players?${query.toString()}`, {
      method: 'GET',
    });
    const data = await response.json();

    result_boll_playeslist.value = data;
  } catch (error) {
    handleApiError(error);
  }
};

const teamsdata = async () => {
  try {
    const response = await apiFetch(`/api/team-data/${id}`, {
      method: 'GET',
    });
    const data = await response.json();
    teamlist.value = data.teams;
  } catch (error) {
    handleApiError(error);
  }
};

// Helper function for error handling
const handleApiError = (error) => {
  if (error.response) {
    const { status, data } = error.response;

    if (status === 422 && data.errors) {
      Object.values(data.errors).forEach(messages => {
        messages.forEach(msg => $notyf.error(msg));
      });
    } else if (status === 409) {
      $notyf.error(data.message);
    } else {
      $notyf.error(data.message || "An error occurred. Please try again.");
    }
  } else {
    $notyf.error("Unable to connect to the server. Please check your internet connection.");
  }
};

onMounted(() => {
    teamData();
    teamsdata();
});



</script>
<style>
.tabnav button {
    color: #fff;
}

.tabnav button:hover {
    color: var(--main_color);
}
</style>