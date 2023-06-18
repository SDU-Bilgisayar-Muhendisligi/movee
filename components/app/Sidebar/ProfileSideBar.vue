<template>
    <base-card height-type="height-auto" class="lg:w-7/12" flex-type="between-row" padding-size="p-0"
               style="border: none !important;">
        <div class="profile-left-side">
            <p class="profile-left-side-questions">Sorularım</p>
            <div class="profile-left-side-items">
                <nuxt-link to="/profile/cevaplananlar" class="profile-left-side-answered">Cevaplanmış (1)
                    <arrow/>
                </nuxt-link>
                <nuxt-link to="/profile/cevaplanmayanlar" class="profile-left-side-unanswered">Henüz Cevaplanmamış (4)
                    <arrow/>
                </nuxt-link>
            </div>
            <p class="profile-left-side-settings">Ayarlar</p>
            <div class="profile-left-side-items">
                <nuxt-link to="/profile/info" class="profile-left-side-info">Profil Bilgilerim
                    <arrow/>
                </nuxt-link>
                <nuxt-link to="/profile/password" class="profile-left-side-password">Profil Şifremi Değiştir
                    <arrow/>
                </nuxt-link>
                <nuxt-link to="/" class="profile-left-side-exit">Çıkış Yap
                    <arrow/>
                </nuxt-link>
            </div>
        </div>
    </base-card>
</template>

<script setup>

import BaseCard from "~/components/cards/BaseCard.vue";
import Arrow from "~/components/common/Arrow.vue";


</script>

<style scoped>
.profile-left-side {
    @apply
    flex flex-col lg:border-r
    lg:border-gray-yuz h-full
    w-full py-6 lg:px-4
}

.profile-left-side-questions {
    @apply
    text-gray-yediyuz font-semibold
    lg:font-medium text-base
    lg:text-xs pb-5
}

.profile-left-side-answered {
    @apply
    flex items-center justify-between
    text-gray-besyuz w-11/12 lg:w-auto
    font-normal text-sm py-3 lg:py-0 lg:pb-5
    border-b border-gray-yuz
}

.profile-left-side-unanswered {
    @apply
    flex items-center justify-between
    text-gray-besyuz font-normal text-sm
    lg:pb-5 lg:mt-3 py-3 lg:py-0 w-11/12 lg:w-auto
}

.profile-left-side-settings {
    @apply
    text-gray-yediyuz font-semibold mt-10 lg:mt-0
    lg:font-medium text-base lg:text-xs pb-5
}

.profile-left-side-info {
    @apply
    flex items-center justify-between text-gray-besyuz
    font-normal text-sm py-3 lg:py-0 lg:pb-5
    border-b lg:border-none border-gray-yuz w-11/12 lg:w-auto
}

.profile-left-side-password {
    @apply
    flex items-center justify-between  text-gray-besyuz
    font-normal text-sm py-3 lg:py-0 lg:pb-5
    border-b lg:border-none border-gray-yuz w-11/12 lg:w-auto
}

.profile-left-side-exit {
    @apply
    flex items-center justify-between text-gray-besyuz
    font-normal text-sm py-3 lg:py-0 lg:pb-5
    w-11/12 lg:w-auto
}

.profile-left-side-items {
    filter: drop-shadow(0px 1px rgba(16, 24, 40, 0.05));
    @apply
    flex flex-col items-center lg:block
    border lg:border-none bg-white
    border-gray-ikiyuz rounded-2xl lg:p-0
}

.router-link-active {
    @apply
    text-primary
}
@media screen and (min-width: 1024px) {
    .profile-left-side-items {
        filter: none;
    }
}
</style>
