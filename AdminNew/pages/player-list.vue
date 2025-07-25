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
                <h1 class="page_title">Player List <span v-if="matchdetails">({{ matchdetails.team_a.name }} Vs
                        {{ matchdetails.team_b.name }})</span> </h1>
                <div class="card app_card">
                    <div class="card-header">
                        <form>
                            <div class="header_filter">
                                <div class="show_">
                                    <p>Show</p>
                                    <select name="item" id="item-select" v-model="items" @change="getPlayers(1)">
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
                                            @input="getPlayers(1)" name="search" class="form-control nav_search" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <select name="status" id="status-select" v-model="status" @change="getPlayers(1)">

                                        <option value="">All</option>
                                        <option value="1">Active</option>
                                        <option value="2">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                        <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add User </button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead class="thead">
                                    <tr>
                                        <th class="text-center">SL.</th>
                                        <th>Player Name</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr  v-for="(items, index) in playerlist"
                                        :key="items.id">
                                        <td class="text-center">{{ index + 1 }}</td>
                                        <td>
                                            <p>{{ items.player_name }}</p>
                                        </td>
                                        <td>
                                            <span v-if="items.status == 1" class="badge bg-success">Active</span>
                                            <span v-else class="badge bg-danger">Inactive</span>
                                        </td>
                                        <td>
                                            <button data-bs-toggle="modal" data-bs-target="#edituser"
                                                @click="playerDetails(items.id)" class="btn btn_default">Details
                                                Action</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- Pagination -->
                            <ul class="pagination">
                                <li v-for="link in pagination" :key="link.label"
                                    :class="{ 'active page-item': link.active, 'disabled page-item': !link.url }">
                                    <a v-if="link.url" href="#"
                                        @click.prevent="getPlayers(link.url.split('page=')[1])" class="page-link">
                                        {{ link.label }}
                                    </a>
                                    <span v-else>{{ link.label }}</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!--add Modal -->
                <div class="modal fade" id="adduser" tabindex="-1" aria-labelledby="adduserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="adduser_form">
                                    <h1>Add Player</h1>
                                    <form @submit.prevent="addPlayer">
                                        <div class="form-group mb-3">
                                            <input type="text" v-model="player_name" class="form-control"
                                                id="Player name" placeholder="Player Name">
                                        </div>
                                        <div class="form-group mb-2 d-none">
                                            <select name="" id="" v-model="player_type" class="form-control">
                                                <option value="1">Boller</option>
                                                <option value="2">Batsman</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn_primary w-100">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Edit Modal -->
                <div class="modal fade" id="edituser" tabindex="-1" aria-labelledby="edituserLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="adduser_form">
                                    <h1>Edit Player</h1>
                                    <form id="#updateForm" action="/" @submit.prevent="updatePlayer()">
                                        <div class="form-group mb-3">
                                            <input type="text" hidden v-model="player_id" class="form-control" id="Player id">
                                        </div>
                                        <div class="form-group mb-3">
                                            <input type="text" v-model="editplayer_name" class="form-control"
                                                id="Player name" placeholder="Name">
                                        </div>
                                        <div class="form-group mb-2">
                                            <select name="" id="" v-model="editstatus" class="form-control">
                                                <option value="1">Active</option>
                                                <option value="2">Inactive</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn_primary w-100">Update</button>
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
import { useRoute } from 'vue-router';
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();
import { apiFetch } from '~/utils/api'

const route = useRoute();
// const teamId = route.query.id;

const player_name = ref();
const player_type = ref();

const editplayer_name = ref();
const editstatus = ref();
const player_id = ref();

const items = ref("10");
const searchInput = ref('');
const status = ref('');

const playerlist = ref([]);
const pagination = ref([]);
const updatePlayer = async () => {
    const formData = new FormData();
    formData.append('player_name', editplayer_name.value);
    formData.append('status', editstatus.value);
    formData.append('player_id', player_id.value);

    const res = await apiFetch('/api/update-player', {
        method: 'POST',
        body: formData
    });

    const data = await res.json();

    if (!res.ok) {
        if (data?.errors) {
            for (const field in data.errors) {
                data.errors[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    getPlayers();

    const modalElement = document.getElementById('edituser');
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        }
    }

    $notyf.success(data.message);
};
const playerDetails = async (id) => {
    const res = await apiFetch(`/api/get-player-details/${id}`, {
        method: 'GET'
    });

    const data = await res.json();

    if (!res.ok) {
        $notyf.error("Failed to fetch player details.");
        return;
    }

    player_id.value = data.id;
    editplayer_name.value = data.player_name;
    editstatus.value = data.status;
};
const addPlayer = async () => {
    const formData = new FormData();
    formData.append('player_name', player_name.value);
    formData.append('player_type', player_type.value);

    const res = await apiFetch('/api/add-team-player', {
        method: 'POST',
        body: formData
    });

    const data = await res.json();

    if (!res.ok) {
        if (data?.errors) {
            for (const field in data.errors) {
                data.errors[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    getPlayers();

    const modalElement = document.getElementById('adduser');
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        }
    }

    $notyf.success(data.message);
};

const getPlayers = async (page = 1) => {
    const queryParams = new URLSearchParams({
        items: items.value,
        searchInput: searchInput.value,
        status: status.value,
        page: page,
    });

    const res = await apiFetch(`/api/get-team-players?${queryParams.toString()}`, {
        method: 'GET'
    });

    const data = await res.json();

    if (!res.ok) {
        $notyf.error("Failed to fetch players.");
        return;
    }

    playerlist.value = data.data;
    pagination.value = data.pagination.links;
};


onMounted(() => {
    getPlayers();
});



</script>
