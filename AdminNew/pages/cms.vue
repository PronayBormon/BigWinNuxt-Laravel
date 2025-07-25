<template>
    <div class="main_container">
        <!-- sidebar start here  -->
        <Sidebar />
        <!-- main container section  -->
        <div class="main_content">
            <!-- navbar section  -->
            <Navbar />

            <!-- content section -->
            <div class="content_section">
                <div class="d-flex justify-content-between align-items-center">
                    <h1 class="page_title">Add Single Match</h1>
                    <!-- <button class="btn_primary" data-bs-toggle="modal" data-bs-target="#adduser">Add Banner</button> -->
                </div>

                <div class="row">
                    <div class="col-md-6 m-auto my-3">
                        <div class="card banner_card">
                            <div class="card-body">
                                <h5 class="text-white">Team Win Prediction page </h5>
                                <hr>
                                <form action="">
                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="matchPagesave()">
                                            <div class="form-group mb-3">
                                                <label for="matchPage" class="w-100">
                                                    <img :src="matchPage_preview"
                                                        style="height: 120px; width: 100%; object-fit: contain; border: 1px solid #ededed;"
                                                        class="img-fluid mb-2"></label>
                                                <br>
                                                <!-- <p class="text-small text-white" style="font-size: 10px;">Image Dimension Muxt be Height <strong>350px</strong> and weight <strong>700px</strong>. <span class="text-danger">*</span></p> -->
                                                <input type="file" class="form-control" id="matchPage"
                                                    @change="previewImage">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Add</button>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 m-auto my-3">
                        <div class="card banner_card">
                            <div class="card-body">
                                <h5 class="text-white">Team Max-Prediction page </h5>
                                <hr>
                                <form action="">
                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="maxPredictsave()">
                                            <div class="form-group mb-3">
                                                <label for="matchPage" class="w-100">
                                                    <img :src="maxpredict_image_preview"
                                                        style="height: 120px; width: 100%; object-fit: contain; border: 1px solid #ededed;"
                                                        class="img-fluid mb-2"></label>
                                                <br>
                                                <!-- <p class="text-small text-white" style="font-size: 10px;">Image Dimension Muxt be Height <strong>350px</strong> and weight <strong>700px</strong>. <span class="text-danger">*</span></p> -->
                                                <input type="file" class="form-control" id="matchPage"
                                                    @change="previewmaxPredict">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Update</button>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 m-auto my-3">
                        <div class="card banner_card">
                            <div class="card-body">
                                <h5 class="text-white">WalletPage page </h5>
                                <hr>
                                <form action="">
                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="WalletPagesave()">
                                            <div class="form-group mb-3">
                                                <label for="matchPage" class="w-100">
                                                    <img :src="wallet_image_preview"
                                                        style="height: 120px; width: 100%; object-fit: contain; border: 1px solid #ededed;"
                                                        class="img-fluid mb-2"></label>
                                                <br>
                                                <!-- <p class="text-small text-white" style="font-size: 10px;">Image Dimension Muxt be Height <strong>350px</strong> and weight <strong>700px</strong>. <span class="text-danger">*</span></p> -->
                                                <input type="file" class="form-control" id="matchPage"
                                                    @change="preview_walletPage">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Update</button>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 m-auto my-3">
                        <div class="card banner_card">
                            <div class="card-body">
                                <h5 class="text-white"> Winner page </h5>
                                <hr>
                                <form action="">
                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="WinnerPagesave()">
                                            <div class="form-group mb-3">
                                                <label for="matchPage" class="w-100">
                                                    <img :src="winner_image_preview"
                                                        style="height: 120px; width: 100%; object-fit: contain; border: 1px solid #ededed;"
                                                        class="img-fluid mb-2"></label>
                                                <br>
                                                <!-- <p class="text-small text-white" style="font-size: 10px;">Image Dimension Muxt be Height <strong>350px</strong> and weight <strong>700px</strong>. <span class="text-danger">*</span></p> -->
                                                <input type="file" class="form-control" id="matchPage"
                                                    @change="preview_winner">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Update</button>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 m-auto my-3">
                        <div class="card banner_card">
                            <div class="card-body">
                                <h5 class="text-white"> Profile page </h5>
                                <hr>
                                <form action="">
                                    <div class="adduser_form">
                                        <form action="" @submit.prevent="ProfilePagesave()">
                                            <div class="form-group mb-3">
                                                <label for="matchPage" class="w-100">
                                                    <img :src="profile_image_preview"
                                                        style="height: 120px; width: 100%; object-fit: contain; border: 1px solid #ededed;"
                                                        class="img-fluid mb-2"></label>
                                                <br>
                                                <!-- <p class="text-small text-white" style="font-size: 10px;">Image Dimension Muxt be Height <strong>350px</strong> and weight <strong>700px</strong>. <span class="text-danger">*</span></p> -->
                                                <input type="file" class="form-control" id="matchPage"
                                                    @change="previewProfile">
                                            </div>
                                            <button type="submit" class="btn_primary w-100">Update</button>
                                        </form>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</template>

<script setup>
import { onMounted } from "vue";
import { useRouter } from 'vue-router';
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();
// $notyf.success(response.data.message);
import { apiFetch } from '~/utils/api'

const router = useRouter();

const matchPage = ref();
const maxpredict_image = ref();
const walletpage = ref();
const winnerPage = ref();
const profilepage = ref();

const maxpredict_image_preview = ref();
const wallet_image_preview = ref();
const winner_image_preview = ref();
const profile_image_preview = ref();
const matchPage_preview = ref();

const previewProfile = (event) => {
    const file = event.target.files[0];
    if (file) {
        profilepage.value = file;
        profile_image_preview.value = URL.createObjectURL(file); // Generate preview URL
    }
};

const preview_winner = (event) => {
    const file = event.target.files[0];
    if (file) {
        winnerPage.value = file;
        winner_image_preview.value = URL.createObjectURL(file); // Generate preview URL
    }
};
const preview_walletPage = (event) => {
    const file = event.target.files[0];
    if (file) {
        walletpage.value = file;
        wallet_image_preview.value = URL.createObjectURL(file); // Generate preview URL
    }
};
const previewImage = (event) => {
    const file = event.target.files[0];
    if (file) {
        matchPage.value = file;
        matchPage_preview.value = URL.createObjectURL(file); // Generate preview URL
    }
};

const previewmaxPredict = (event) => {
    const file = event.target.files[0];
    if (file) {
        maxpredict_image.value = file;
        maxpredict_image_preview.value = URL.createObjectURL(file); // Generate preview URL
    }
};
const ProfilePageimage = async () => {
    const res = await apiFetch('/cms/Profile-image', {
        method: 'GET',
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            const errorMessages = error.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    const data = await res.json();
    profile_image_preview.value = data.image;
};

const WinnerPageimage = async () => {
    const formData = new FormData();
    formData.append('image', profilepage.value);

    const res = await apiFetch('/cms/Winner-image', {
        method: 'get',
        // body: formData,
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            const errorMessages = error.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    const data = await res.json();
    winner_image_preview.value = data.image;
};


const walletPageimage = async () => {
    const res = await apiFetch('/cms/Wallet-image', {
        method: 'GET',
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            const errorMessages = error.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    const data = await res.json();
    wallet_image_preview.value = data.image;
};

const maxPredictimage = async () => {
    const res = await apiFetch('/cms/maxpredict-image', {
        method: 'GET',
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            const errorMessages = error.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    const data = await res.json();
    maxpredict_image_preview.value = data.image;
};

const matchPageimage = async () => {
    const res = await apiFetch('/cms/match-image', {
        method: 'GET',
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            const errorMessages = error.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    const data = await res.json();
    matchPage_preview.value = data.image;
};




const ProfilePagesave = async () => {
    const formData = new FormData();
    formData.append('image', profilepage.value);

    const res = await apiFetch('/cms/Profile-page', {
        method: 'POST',
        body: formData,
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            const errorMessages = error.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    const data = await res.json();
    profilepage.value = "";

    const modalElement = document.getElementById('editMatch');
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        }
    }

    $notyf.success(data.message);
};

const WinnerPagesave = async () => {
    const formData = new FormData();
    formData.append('image', winnerPage.value);

    const res = await apiFetch('/cms/Winner-page', {
        method: 'POST',
        body: formData,
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            const errorMessages = error.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    const data = await res.json();
    winnerPage.value = "";

    const modalElement = document.getElementById('editMatch');
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        }
    }

    $notyf.success(data.message);
};
const maxPredictsave = async () => {
    const formData = new FormData();
    formData.append('image', maxpredict_image.value);

    const res = await apiFetch('/cms/maxpredict-page', {
        method: 'POST',
        body: formData,
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            const errorMessages = error.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    const data = await res.json();
    maxpredict_image.value = "";

    const modalElement = document.getElementById('editMatch');
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        }
    }

    $notyf.success(data.message);
};
const WalletPagesave = async () => {
    const formData = new FormData();
    formData.append('image', walletpage.value);

    const res = await apiFetch('/cms/Wallet-page', {
        method: 'POST',
        body: formData,
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            const errorMessages = error.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }
        return;
    }

    const data = await res.json();
    walletpage.value = "";

    const modalElement = document.getElementById('editMatch');
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        }
    }

    $notyf.success(data.message);
};



const matchPagesave = async () => {
    const formData = new FormData();
    formData.append('image', matchPage.value);

    const res = await apiFetch('/cms/match-page', {
        method: 'POST',
        body: formData,
    });

    if (!res.ok) {
        const error = await res.json();

        if (error?.errors) {
            const errorMessages = error.errors;
            for (const field in errorMessages) {
                errorMessages[field].forEach((msg) => {
                    $notyf.error(msg);
                });
            }
        } else {
            $notyf.error("An error occurred. Please try again.");
        }

        return;
    }

    const data = await res.json();

    matchPage.value = "";

    const modalElement = document.getElementById('editMatch');
    if (modalElement) {
        const modalInstance = bootstrap.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        }
    }

    $notyf.success(data.message);
};

onMounted(() => {
    WinnerPageimage();
    ProfilePageimage();
    walletPageimage();
    maxPredictimage();
    matchPageimage();
});
</script>