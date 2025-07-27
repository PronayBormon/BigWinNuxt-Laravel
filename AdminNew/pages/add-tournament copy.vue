<template>
    <div class="main_container">
        <!-- Sidebar -->
        <Sidebar />

        <!-- Main Content -->
        <div class="main_content">
            <!-- Navbar -->
            <Navbar />

            <div class="content_section">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="page_title">Add Tournament</h1>
                </div>

                <div class="card banner_card">
                    <div class="card-body">
                        <form @submit.prevent="addTournament">
                            <div class="row">
                                <div class="col-md-12 m-auto">
                                    <div class="adduser_form">
                                        <div class="row">
                                            <div class="col-md-3 col-sm-6 col-12">
                                                <div class="form-group mb-3">
                                                    <input type="text" class="form-control" v-model="tname"
                                                        placeholder="Tournament Name" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-12">
                                                <div class="form-group mb-3">
                                                    <input type="datetime-local" class="form-control" v-model="tdate" />
                                                </div>
                                            </div>
                                            <div class="col-md-3 col-sm-6 col-12">
                                                <div class="form-group mb-3">
                                                    <input type="datetime-local" class="form-control"
                                                        v-model="tenddate" />
                                                </div>
                                            </div>

                                            <div class="col-md-3 col-sm-6 col-12">
                                                <div class="form-group mb-3">
                                                    <div class="d-flex align-items-center">
                                                        <input type="number" v-model="numTeams" min="1" max="10"
                                                            placeholder="How many teams" class="form-control" />
                                                        <button type="button" @click="generateTeams"
                                                            class="btn_default">+</button>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group mb-3">
                                                <img :src="preview_image1"
                                                    style="height: 50px; width: 80px; border: 1px solid #ededed;"
                                                    class="img-fluid mb-2">
                                                <br>
                                                <p class="text-small text-danger" style="font-size: 10px;">Image
                                                    Dimension Muxt be Height <strong>350px</strong> and weight
                                                    <strong>700px</strong>. <span class="text-danger">*</span>
                                                </p>
                                                <input type="file" class="form-control" @change="previewImageupdate">
                                            </div>
                                        </div>

                                        <!-- Dynamic Team Selection -->
                                        <div class="form-group mb-3">
                                            <label for="" class="text-white">Select Teams</label>
                                            <div class="team_list">
                                                <div class="row">
                                                    <!-- For each team -->
                                                    <div v-for="(team, teamIndex) in teams" :key="teamIndex"
                                                        class="col-md-12">
                                                        <h6 class="select_title">Team {{ teamIndex + 1 }}</h6>
                                                        <div class="row">
                                                            <!-- Team Selection -->
                                                            <div class="col-md-3 col-sm-6">
                                                                <div class="form-group">
                                                                    <label class="select_title">Select Team {{ teamIndex
                                                                        + 1 }}</label>
                                                                    <select v-model="team.team_id"
                                                                        class="form-control mb-3 js-example-basic-single">
                                                                        <option selected disabled>Select Team</option>
                                                                        <option v-for="teamOption in availableTeams"
                                                                            :key="teamOption.id" :value="teamOption.id">
                                                                            {{ teamOption.name }}
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <!-- Player Selection (min 15 players) -->
                                                            <div v-for="(player, playerIndex) in team.players"
                                                                :key="playerIndex" class="col-md-3 col-sm-6">
                                                                <label class="select_title">Select Player {{ playerIndex
                                                                    + 1 }}</label>
                                                                <select v-model="team.players[playerIndex]"
                                                                    class="form-control mb-3 js-example-basic-single">
                                                                    <option selected disabled>Select Player {{
                                                                        playerIndex + 1 }}</option>
                                                                    <option v-for="playerOption in availablePlayers"
                                                                        :key="playerOption.id" :value="playerOption.id">
                                                                        {{ playerOption.player_name }}
                                                                    </option>
                                                                </select>
                                                            </div>

                                                            <!-- Add More Players Button -->
                                                            <hr>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <h1 class="page_title">Tournament List </h1>
                <div class="card app_card">
                    <div class="card-header">
                        <div class="header_filter">
                            <div class="show_">
                                <p>Show</p>
                                <select name="" v-model="items" id="" @change="getTournamentList(1)">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                            </div>

                            <div class="form-group d-none d-md-block">
                                <div class="seach_box">
                                    <i class="fa-solid fa-search"></i>
                                    <input type="text" v-model="searchInput" @input="getTournamentList(1)"
                                        placeholder="Search team" class="form-control nav_search">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th class="text-center">Tournament Name</th>
                                        <th>Start Date </th>
                                        <th>End Date </th>
                                        <th>Status </th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(item, index) in tournamentList" :key="index">
                                        <!-- {{ item }} -->
                                        <td class="text-center">{{ item.name }}</td>
                                        <td>{{ item.start_date }}</td>
                                        <td>{{ item.end_date }}</td>
                                        <td>
                                            <span :class="item.status == 1 ? 'badge bg-success' : 'badge bg-danger'">{{
                                                item.status == 1 ? "Active" : "inactive" }}</span>
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-default p-2"
                                                @click="changeStatus(item.id)"> Change status</button>

                                            <button type="button" @click="teamlistId(item.id, item.name)"
                                                class="btn btn-default py-2 ms-2">Team List</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#"
                                        @click.prevent="getMatchList(link.url.split('page=')[1])" class="page-link">
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
    </div>
</template>

<script setup>
import { ref, onMounted, nextTick, watch } from 'vue';

import { apiFetch } from '~/utils/api'
import { useRouter } from 'vue-router';
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();
// $notyf.success(response.data.message);



const router = useRouter();
const availableTeams = ref([]);
const availablePlayers = ref([]);
const tname = ref("");
const tdate = ref("");
const tenddate = ref("");
const t_image = ref("");
const preview_image1 = ref("");
const numTeams = ref(1); // Default to 1 team
const teams = ref([]);
const tournamentList = ref([]);
const pagination = ref([]);
const items = ref('10');
const searchInput = ref('');

const previewImageupdate = (event) => {
    const file = event.target.files[0];
    if (file) {
        t_image.value = file;
        preview_image1.value = URL.createObjectURL(file); // Generate preview URL
    }
};

const teamlistId = (id, name) => {
    router.push(`/tournament/team-list?id=${id}`);
}
// Generate the required number of teams
// const generateTeams = () => {
//     teams.value = [];
//     for (let i = 0; i < numTeams.value; i++) {
//         teams.value.push({
//             team_id: null,
//             players: Array(15).fill(null), // Initialize with 15 empty player slots
//         });
//     }
// };
const generateTeams = async () => {
  teams.value = [];
  for (let i = 0; i < numTeams.value; i++) {
    teams.value.push({
      team_id: null,
      players: Array(15).fill(null),
    });
  }

  await nextTick();

  // Re-initialize Select2 safely
  if (window.$ && typeof window.$.fn.select2 === 'function') {
    const $selects = window.$('.js-example-basic-single');

    $selects.each(function () {
      const $el = window.$(this);
      if ($el.hasClass('select2-hidden-accessible')) {
        $el.select2('destroy'); // Only destroy if already initialized
      }
      $el.select2(); // Re-initialize
    });
  }
};

const changeStatus = async (id) => {
  try {
    const params = new URLSearchParams({ id });
    const response = await apiFetch(`/api/update-tournament-status?${params.toString()}`, {
      method: 'GET',
    });
    const data = await response.json();
    $notyf.success(data.message);
    getTournamentList();
  } catch (error) {
    if (error.response && error.response._data?.errors) {
      const errorMessages = error.response._data.errors;
      for (const field in errorMessages) {
        if (errorMessages.hasOwnProperty(field)) {
          errorMessages[field].forEach((msg) => {
            $notyf.error(msg);
          });
        }
      }
    } else {
      $notyf.error("An error occurred. Please try again.");
    }
  }
};

const teamsdata = async () => {
  try {
    const response = await apiFetch('/api/team-list', { method: 'GET' });
    const data = await response.json();
    availableTeams.value = data;
  } catch {
    $notyf.error("Failed to load teams.");
  }
};

const playersdata = async () => {
  try {
    const response = await apiFetch('/api/player-list', { method: 'GET' });
    const data = await response.json();
    availablePlayers.value = data;
  } catch {
    $notyf.error("Failed to load players.");
  }
};

const addTournament = async () => {
  try {
    const formData = new FormData();

    formData.append("tname", tname.value);
    formData.append("tdate", tdate.value);
    formData.append("tenddate", tenddate.value);
    formData.append("t_image", t_image.value);

    teams.value.forEach((team) => {
      formData.append("teams[]", JSON.stringify({ team_id: team.team_id, players: team.players }));
    });

    const response = await apiFetch('/api/make-tournament', {
      method: 'POST',
      body: formData,
    });
    const data = await response.json();

    getTournamentList();
    $notyf.success(data.message);
  } catch (error) {
    if (error.response && error.response._data?.errors) {
      const errorMessages = error.response._data.errors;
      for (const field in errorMessages) {
        if (errorMessages.hasOwnProperty(field)) {
          errorMessages[field].forEach((msg) => {
            $notyf.error(msg);
          });
        }
      }
    } else {
      $notyf.error("An error occurred. Please try again.");
    }
  }
};

const getTournamentList = async (pages =1) => {
  try {
    const params = new URLSearchParams({
      items: items.value,
      search: searchInput.value,
      page: pages,
    });

    const response = await apiFetch(`/api/get-tournamentList?${params.toString()}`, {
      method: 'GET',
    });
    const data = await response.json();

    tournamentList.value = data.data;
    pagination.value = data.pagination.links;
  } catch {
    $notyf.error("Failed to load tournament list.");
  }
};

onMounted(() => {
    // if (window.$ && typeof window.$.fn.select2 === 'function') {
    //     window.$('.js-example-basic-single').select2()
    // } else {
    //     console.warn('Select2 or jQuery not loaded.')
    // }

    teamsdata();
    playersdata();
    getTournamentList();
})
</script>
