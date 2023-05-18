<template>
    <div class="custom-vote">
        <div class="custom-vote-hisbe">
            <custom-progress-bar-hisbe class="circle-progress__svg" :voteHisbe="merakEdilen.voteHisbe"
                                       :max="merakEdilen.max"/>
            <div class="custom-vote-hisbe-detay">
                <p class="custom-vote-hisbe-detay-title">Movee:</p>
                <p class="custom-vote-hisbe-detay-status">{{ merakEdilen.hisbe }}</p>
            </div>
        </div>
        <div class="custom-vote-kullanici">
            <custom-progress-bar-user class="circle-progress__svg" :voteUser="merakEdilen.voteUser"
                                      :max="merakEdilen.max"/>
            <div class="custom-vote-kullanici-detay">
                <p class="custom-vote-kullanici-detay-title">Kullanıcılar</p>
                <p class="custom-vote-kullanici-detay-status">{{ merakEdilen.kullanicilar }}</p>
            </div>
        </div>

    </div>
</template>

<script setup>

import CustomProgressBarHisbe from "~/components/base/CustomProgressBarHisbe.vue";
import CustomProgressBarUser from "~/components/base/CustomProgressBarUser.vue";

const props = defineProps({
    merakEdilen: Object,
})


</script>


<style scoped>
.custom-vote {
    @apply flex flex-col justify-between
    border border-gray-yuz
    rounded-lg mt-4 mb-2
    bg-white shadow w-11/12 lg:w-auto
}

.custom-vote-hisbe {
    @apply
    flex items-center w-full p-1
    border-b border-b-gray-yuz
}

.custom-vote-kullanici {
    @apply
    flex items-center
    w-full p-1
}


.circle-progress__svg {
    @apply
    w-6 h-6
}

.custom-vote-hisbe-detay {
    @apply
    flex flex-col justify-center ml-2
}

.custom-vote-hisbe-detay-title {
    @apply
    text-gray-dortyuz text-xs font-normal
}

.custom-vote-hisbe-detay-status {
    @apply
    text-gray-besyuz text-xs font-normal
}

.custom-vote-kullanici-detay {
    @apply
    flex flex-col justify-center ml-2
}

.custom-vote-kullanici-detay-title {
    @apply
    text-gray-dortyuz text-xs font-normal
}

.custom-vote-kullanici-detay-status {
    @apply
    text-gray-besyuz text-xs font-normal
}

.yan-yana{
    @apply
    flex
}

.ust-uste{
    @apply
    flex flex-col
}

</style>
