<template>
  <div class="main_container">
    <Sidebar />
    <div class="main_content">
      <Navbar />
      <div class="content_section">
        <h1 class="page_title">Add Max Predict</h1>
        <div class="card banner_card">
          <div class="card-body">
            <form @submit.prevent="addmaxpredict">
              <div class="row">
                <div class="col-md-3">
                  <input type="datetime-local" v-model="tdate" class="form-control mb-3" />
                </div>
                <div class="col-md-3">
                  <input type="datetime-local" v-model="tenddate" class="form-control mb-3" />
                </div>
              </div>
              <div class="form-group mb-3">
                <div v-for="(team, teamIndex) in teams" :key="teamIndex" class="mb-4 border p-3">
                  <h6>Team {{ teamIndex + 1 }}</h6>
                  <select
                    :data-index="teamIndex"
                    class="form-control team-select"
                    v-model="team.team_id"
                  >
                    <option value="">Select Team</option>
                    <option v-for="t in teamOptions" :key="t.id" :value="t.id">{{ t.name }}</option>
                  </select>

                  <div class="row mt-3">
                    <div class="col-md-4" v-for="(player, playerIndex) in team.players" :key="playerIndex">
                      <select
                        :data-team="teamIndex"
                        :data-player="playerIndex"
                        class="form-control player-select mt-2"
                        v-model="team.players[playerIndex]"
                      >
                        <option value="">Select Player {{ playerIndex + 1 }}</option>
                        <option
                          v-for="p in playerOptions"
                          :key="p.id"
                          :value="p.id"
                        >
                          {{ p.player_name }}
                        </option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <button type="submit" class="btn btn-primary w-100">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, nextTick, watch } from 'vue'
// import axios from 'axios'
const { $axios } = useNuxtApp();
const axios = $axios;
import { useNuxtApp } from '#app'
const { $notyf } = useNuxtApp()

const tdate = ref('')
const tenddate = ref('')
const teams = ref([
  { team_id: '', players: Array(15).fill('') },
  { team_id: '', players: Array(15).fill('') }
])
const teamOptions = ref([])
const playerOptions = ref([])

const initSelect2 = () => {
  nextTick(() => {
    $('.team-select').each(function () {
      const index = $(this).data('index')
      $(this).select2().on('change', function () {
        teams.value[index].team_id = $(this).val()
      })
      $(this).val(teams.value[index].team_id).trigger('change')
    })

    $('.player-select').each(function () {
      const teamIndex = $(this).data('team')
      const playerIndex = $(this).data('player')
      $(this).select2().on('change', function () {
        teams.value[teamIndex].players[playerIndex] = $(this).val()
      })
      $(this)
        .val(teams.value[teamIndex].players[playerIndex])
        .trigger('change')
    })
  })
}

onMounted(() => {
  teamsdata()
  playersdata()
})

watch([teams, teamOptions, playerOptions], () => initSelect2(), {
  deep: true
})

const teamsdata = () => {
  axios.get('api/team-list').then((res) => {
    teamOptions.value = res.data
  })
}

const playersdata = () => {
  axios.get('api/player-list').then((res) => {
    playerOptions.value = res.data
  })
}

const addmaxpredict = () => {
  for (let i = 0; i < teams.value.length; i++) {
    if (!teams.value[i].team_id) {
      alert(`Please select a team for Team ${i + 1}`)
      return
    }
    if (teams.value[i].players.includes('')) {
      alert(`Please select all 15 players for Team ${i + 1}`)
      return
    }
  }

  const formData = new FormData()
  formData.append('start_date', tdate.value)
  formData.append('end_date', tenddate.value)

  teams.value.forEach((team, i) => {
    formData.append(`teams[${i}][team_id]`, team.team_id)
    team.players.forEach((player, j) => {
      formData.append(`teams[${i}][players][${j}]`, player)
    })
  })

  axios.post('api/add-max-predict', formData).then((res) => {
    $notyf.success(res.data.message)
  })
}
</script>

<style scoped>
.select2-container--default .select2-selection--single .select2-selection__rendered {
  color: #444;
  line-height: 35px;
}
.select2-container .select2-selection--single {
  height: 35px;
}
</style>