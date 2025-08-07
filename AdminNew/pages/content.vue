<template>
    <div class="main_container">
        <Sidebar />

        <div class="main_content">
            <Navbar />

            <div class="content_section">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center my-2">
                        <h3 class="page_title my-0"><span> Pre Settings </span></h3>
                    </div>
                </div>

                <div class="card app_card">
                    <div class="card-body p-4">
                        <div class="row">
                            <div class="col-md-8 m-auto">
                                <form action="" method="post" @submit.prevent="updateSettings">

                                    <div class="mb-3">
                                        <label class="form-label text-white">How it's Work</label>
                                        <textarea class="form-control" v-model="form.metaDescription"
                                            placeholder="Meta Description" rows="3"></textarea>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="text-center mt-4">
                                        <button type="submit" class="btn btn-primary px-5">Save Settings</button>
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
import { onMounted, ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { useNuxtApp } from '#app';
const { $notyf } = useNuxtApp();

const route = useRoute();
const router = useRouter();  // Initialize router

const tid = route.query.id;
const tournamename = route.query.tournament;


const form = ref({
    spin_creadit: '',
});

const logoFile = ref(null); // for file
const logoPreview = ref('');


onMounted(() => {
    fetchSettings();
});


const updateSettings = async () => {
    const formData = new FormData();
    formData.append('website_name', form.value.websiteName);

    if (logoFile.value) {
        formData.append('logo', logoFile.value);
    }

    const res = await apiFetch('/settings/rule', {
        method: 'POST',
        body: formData,
    });

    if (!res.ok) {
        const error = await res.json();
        if (error?.errors) {
            for (const messages of Object.values(error.errors)) {
                messages.forEach((msg) => $notyf.error(msg));
            }
        } else if (error?.error) {
            $notyf.error(error.error);
        } else {
            $notyf.error("An unexpected error occurred.");
        }
        return;
    }

    const data = await res.json();
    $notyf.success(data.message || "Settings updated successfully");
};


const fetchSettings = async () => {
    const res = await apiFetch('/api/settings', {
        method: 'GET',
    });

    if (!res.ok) {
        $notyf.error('Failed to load settings');
        return;
    }

    const data = await res.json();

    logoPreview.value = data.logo_url;

    form.value = {
        websiteName: data.website_name || '',
        spin_creadit: data.spin_creadit || '',
        question_credit: data.question_credit || '',
        pull_credit: data.pull_credit || '',
        registerBonus: data.register_bonus || '',
        singleMatchBonus: data.single_match_bonus || '',
        maxPredictBonus: data.max_predict_bonus || '',
        tournamentBonus: data.tournament_bonus || '',
        adminEmail: data.admin_email || '',
        supportEmail: data.support_email || '',
        phone: data.phone || '',
        facebook: data.facebook || '',
        whatsapp: data.whatsapp || '',
        telegram: data.telegram || '',
        instagram: data.instagram || '',
        twitter: data.twitter || '',
        linkedin: data.linkedin || '',
        youtube: data.youtube || '',
        metaTitle: data.meta_title || '',
        metaDescription: data.meta_description || '',
        metaKeywords: data.meta_keywords || '',
        ads_prize: data.ads_prize || '',
    };
};

onMounted(() => {
    fetchSettings();
});
</script>
