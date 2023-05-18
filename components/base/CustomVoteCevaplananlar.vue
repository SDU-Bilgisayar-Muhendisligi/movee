<template>
    <div class="custom-vote" :class="gorunum">
        <div class="custom-vote-hisbe">
            <custom-progress-bar-hisbe class="circle-progress__svg" :voteHisbe="cevaplanan.voteHisbe" :max="cevaplanan.max"/>
            <div class="custom-vote-hisbe-detay">
                <p class="custom-vote-hisbe-detay-title">Hisbe:</p>
                <p class="custom-vote-hisbe-detay-status">{{cevaplanan.hisbe}}</p>
            </div>
        </div>
        <div class="custom-vote-kullanici">
            <custom-progress-bar-user class="circle-progress__svg" :voteUser="cevaplanan.voteUser" :max="cevaplanan.max"/>
            <div class="custom-vote-kullanici-detay">
                <p class="custom-vote-kullanici-detay-title">Kullanıcılar</p>
                <p class="custom-vote-kullanici-detay-status">{{cevaplanan.kullanicilar}}</p>
            </div>
        </div>

    </div>
</template>

<script setup>

import CustomProgressBarHisbe from "~/components/base/CustomProgressBarHisbe.vue";
import CustomProgressBarUser from "~/components/base/CustomProgressBarUser.vue";

defineProps({
    cevaplanan: Object,
    gorunum: String
})

</script>


<style scoped>
.custom-vote {
    @apply  justify-between
    border border-gray-yuz
    rounded-lg bg-white h-10 shadow
}

.custom-vote-hisbe {
    @apply
    flex items-center p-2
    border-r border-r-gray-yuz w-full
}

.custom-vote-kullanici {
    @apply
    flex items-center
    w-full p-2
}


.circle-progress__svg{
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
