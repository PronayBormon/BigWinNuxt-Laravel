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

        <div class="card banner_card p-4">
          <div class="card-body">
            <form @submit.prevent="addTournament">
              <div class="row mb-3">
                <div class="col-md-3 col-sm-6 col-12">
                  <input type="text" required class="form-control" v-model="tname" placeholder="Tournament Name" />
                </div>
                <div class="col-md-3 col-sm-6 col-12">
                  <input type="datetime-local" required class="form-control" v-model="tdate" />
                </div>
                <div class="col-md-3 col-sm-6 col-12">
                  <input type="datetime-local" required class="form-control" v-model="tenddate" />
                </div>

                <div class="form-group my-3 w-100">
                  <img :src="preview_image1" style="height: 50px; width: 80px; border: 1px solid #ededed;"
                    class="img-fluid mb-2" />
                  <p class="text-small text-danger" style="font-size: 10px;">
                    Image Dimension must be Height <strong>350px</strong> and Width <strong>700px</strong>.
                  </p>
                  <input type="file" required class="form-control" @change="previewImageupdate" />
                </div>
              </div>


              <!-- Teams & players in same row -->
              <div id="teams">
                <div v-for="(teamEntry, teamIndex) in teams" :key="teamIndex"
                  class="row align-items-start mb-4 p-3 border rounded">
                  <!-- Team select with unique ID -->
                  <div class="col-xl-4 col-lg-5 col-md-6 mb-3 mb-md-0">
                    <label class="text-white mb-2">Team</label>
                    <select :id="`team-select-${teamIndex}`" required class="form-control" v-model="teamEntry.team">
                      <option disabled value="">Select Team</option>
                      <option v-for="teamOption in availableTeams" :key="teamOption.id" :value="teamOption.id">
                        {{ teamOption.name }}
                      </option>
                    </select>
                  </div>

                  <!-- Players selects with unique IDs -->
                  <div class="col-xl-8 col-lg-7 col-md-6">
                    <label class="text-white mb-2">Players</label>
                    <div v-for="(playerId, playerIndex) in teamEntry.players" :key="playerIndex" class="mb-2">
                      <select :id="`player-select-${teamIndex}-${playerIndex}`" required class="form-control"
                        v-model="teamEntry.players[playerIndex]">
                        <option disabled value="">Select Player</option>
                        <option v-for="playerOption in availablePlayers" :key="playerOption.id"
                          :value="playerOption.id">
                          {{ playerOption.player_name }}
                        </option>
                      </select>
                    </div>

                    <button type="button" class="btn btn-success mt-2" @click="addPlayerToTeam(teamIndex)">
                      + Add Player
                    </button>
                  </div>
                </div>
                
              <div class="mb-3">
                <button type="button" class="btn btn-primary" @click="addNewTeamSelection">
                  + Add Team
                </button>
              </div>
              </div>

              <button type="submit" class="btn_primary w-100">Submit</button>
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
                  <input type="text" v-model="searchInput" @input="getTournamentList(1)" placeholder="Search team"
                    class="form-control nav_search">
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
                      <button type="button" class="btn btn-default p-2" @click="changeStatus(item.id)"> Change
                        status</button>

                      <button type="button" @click="teamlistId(item.id, item.name)"
                        class="btn btn-default py-2 ms-2">Team List</button>
                    </td>
                  </tr>
                </tbody>
              </table>


              <ul class="pagination">
                <li v-for="link in pagination" :key="link.label"
                  :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                  <a v-if="link.url" href="#" @click.prevent="getMatchList(link.url.split('page=')[1])"
                    class="page-link">
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
import { apiFetch } from '~/utils/api';
import { useNuxtApp } from '#app';
import 'choices.js/public/assets/styles/choices.min.css';
import { useRouter } from 'vue-router';


const router = useRouter();
const { $notyf } = useNuxtApp();

const tname = ref('');
const tdate = ref('');
const tenddate = ref('');
const t_image = ref(null);
const preview_image1 = ref('');
const tournamentList = ref([]);
const pagination = ref([]);
const items = ref('10');
const searchInput = ref('');
const availableTeams = ref([]);
const availablePlayers = ref([]);

// Each team: { team: '', players: [''] }
const teams = ref([
  {
    team: '',
    players: [''],
  },
]);


const teamlistId = (id, name) => {
  router.push(`/tournament/team-list?id=${id}`);
}

const choicesInstances = { teams: {}, players: {} };
let Choices = null;

const addNewTeamSelection = () => {
  teams.value.push({
    team: '',
    players: [''],
  });
};

const addPlayerToTeam = (teamIndex) => {
  teams.value[teamIndex].players.push('');
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
  } catch {
    $notyf.error('An error occurred. Please try again.');
  }
};

const teamsdata = async () => {
  try {
    const response = await apiFetch('/api/team-list', { method: 'GET' });
    const data = await response.json();
    availableTeams.value = data;
  } catch {
    $notyf.error('Failed to load teams.');
  }
};

const playersdata = async () => {
  try {
    const response = await apiFetch('/api/player-list', { method: 'GET' });
    const data = await response.json();
    availablePlayers.value = data;
  } catch {
    $notyf.error('Failed to load players.');
  }
};

const getTournamentList = async (pages = 1) => {
  try {
    const params = new URLSearchParams({
      items: items.value,
      search: searchInput.value,
      page: pages,
    });
    const response = await apiFetch(`/api/get-tournamentList?${params.toString()}`, { method: 'GET' });
    const data = await response.json();
    tournamentList.value = data.data;
    pagination.value = data.pagination.links;
  } catch {
    $notyf.error('Failed to load tournament list.');
  }
};

const addTournament = async () => {
  // Frontend validations
  if (!tname.value.trim()) {
    $notyf.error("Tournament name is required.");
    return;
  }

  if (!tdate.value) {
    $notyf.error("Start date is required.");
    return;
  }

  if (!tenddate.value) {
    $notyf.error("End date is required.");
    return;
  }

  if (!t_image.value) {
    $notyf.error("Tournament image is required.");
    return;
  }

  if (!teams.value.length) {
    $notyf.error("At least one team is required.");
    return;
  }

  for (let i = 0; i < teams.value.length; i++) {
    const team = teams.value[i];

    if (!team.team || team.team === '') {
      $notyf.error(`Team ${i + 1} must be selected.`);
      return;
    }

    if (!Array.isArray(team.players) || !team.players.length) {
      $notyf.error(`Team ${i + 1} must have at least one player.`);
      return;
    }

    for (let j = 0; j < team.players.length; j++) {
      if (!team.players[j] || team.players[j] === '') {
        $notyf.error(`Player ${j + 1} in Team ${i + 1} is missing.`);
        return;
      }
    }
  }

  try {
    const formData = new FormData();
    formData.append('tname', tname.value);
    formData.append('tdate', tdate.value);
    formData.append('tenddate', tenddate.value);
    formData.append('t_image', t_image.value);

    teams.value.forEach((teamEntry, teamIndex) => {
      formData.append(`teams[${teamIndex}][team_id]`, teamEntry.team);
      teamEntry.players.forEach((playerId, playerIndex) => {
        formData.append(`teams[${teamIndex}][players][${playerIndex}]`, playerId);
      });
    });

    const response = await apiFetch('/api/make-tournament', {
      method: 'POST',
      body: formData,
    });

    const data = await response.json();

    if (response.ok) {
      $notyf.success(data.message || "Tournament created successfully.");
      getTournamentList();

      // Optionally reset the form
      tname.value = '';
      tdate.value = '';
      tenddate.value = '';
      t_image.value = null;
      preview_image1.value = '';
      teams.value = [{ team: '', players: [''] }];
    } else {
      $notyf.error(data.message || "Something went wrong.");
    }
  } catch (err) {
    $notyf.error(err?.message || "Submission failed. Please try again.");
  }
};


const previewImageupdate = (e) => {
  const file = e.target.files[0];
  if (file) {
    preview_image1.value = URL.createObjectURL(file);
    t_image.value = file;
  }
};

const initChoices = () => {
  if (!process.client || !Choices) return;

  // Destroy previous instances
  Object.values(choicesInstances.teams).forEach((instance) => instance.destroy());
  Object.values(choicesInstances.players).forEach((instance) => instance.destroy());

  choicesInstances.teams = {};
  choicesInstances.players = {};

  teams.value.forEach((teamEntry, teamIndex) => {
    const teamSelectEl = document.getElementById(`team-select-${teamIndex}`);
    if (teamSelectEl) {
      choicesInstances.teams[`team-select-${teamIndex}`] = new Choices(teamSelectEl, {
        searchEnabled: true,
        itemSelectText: '',
        shouldSort: false,
        placeholderValue: 'Select Team',
      });
      teamSelectEl.addEventListener('change', () => {
        teams.value[teamIndex].team = teamSelectEl.value;
      });
    }

    teamEntry.players.forEach((playerId, playerIndex) => {
      const playerSelectEl = document.getElementById(`player-select-${teamIndex}-${playerIndex}`);
      if (playerSelectEl) {
        choicesInstances.players[`player-select-${teamIndex}-${playerIndex}`] = new Choices(playerSelectEl, {
          searchEnabled: true,
          itemSelectText: '',
          shouldSort: false,
          placeholderValue: 'Select Player',
        });
        playerSelectEl.addEventListener('change', () => {
          teams.value[teamIndex].players[playerIndex] = playerSelectEl.value;
        });
      }
    });
  });
};

watch(
  teams,
  () => {
    nextTick(() => {
      initChoices();
    });
  },
  { deep: true }
);

onMounted(async () => {
  if (!process.client) return;

  const module = await import('choices.js');
  Choices = module.default;

  await teamsdata();
  await playersdata();
  await nextTick();

  initChoices();
  getTournamentList();
});
</script>

<style setup>
/* Choices wrapper to match form-control height & border */
.choices__inner {
  min-height: 38px;
  /* same as Bootstrap input height */
  border-radius: 0.375rem;
  border: 1px solid #ced4da;
  background-color: #fff;
  font-size: 1rem;
  color: #495057;
  padding: 0.375rem 0.75rem;
  box-shadow: none !important;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

/* Focus state */
.choices.is-focused .choices__inner,
.choices.is-open .choices__inner {
  border-color: #86b7fe;
  box-shadow: 0 0 0 0.25rem rgb(13 110 253 / 0.25);
}

/* Dropdown list style */
.choices__list--dropdown {
  border-radius: 0 0 0.375rem 0.375rem;
  border: 1px solid #ced4da;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
  max-height: 220px;
  overflow-y: auto;
  font-size: 0.9rem;
  z-index: 1050;
  /* higher than modal, navbar etc */
}

/* Hover on selectable items */
.choices__item--selectable.is-highlighted {
  background-color: #e9ecef;
  color: #212529;
  cursor: pointer;
}

/* Placeholder text */
.choices__placeholder {
  color: #6c757d;
}

/* Remove padding-left from search input inside Choices */
.choices__input {
  padding-left: 0 !important;
}

/* Multiple selections (tags) */
.choices__list--multiple .choices__item {
  background-color: #0d6efd;
  color: #fff;
  border-radius: 0.25rem;
  padding: 0.25rem 0.5rem;
  margin: 0.2rem 0.25rem 0 0;
}

/* Responsive fix for mobile */
@media (max-width: 576px) {
  .choices {
    width: 100% !important;
  }
}
</style>
