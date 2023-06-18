<template>
    <div class="custom-cevaplanan-card" v-for="cevaplanan in cevaplananlar" :key="cevaplanan.id">
        <div class="custom-cevaplanan-card-detay">
            <img :src="cevaplanan.img" alt="">
            <div class="custom-cevaplanan-card-title">
                <nuxt-link :to="`/cevaplananlar/${cevaplanan.slug}`" class="custom-cevaplanan-card-title-baslik">
                    {{ cevaplanan.baslik }}
                </nuxt-link>
                <p class="custom-cevaplanan-card-title-icerik">{{ cevaplanan.icerik }}</p>
            </div>
        </div>
        <p class="custom-cevaplanan-card-soru">{{ cevaplanan.soru }}</p>
        <p class="custom-cevaplanan-card-soru-detay">{{ cevaplanan.soruDetay }} </p>
        <custom-vote-cevaplananlar class="flex mt-3" :cevaplanan="cevaplanan"/>
    </div>
</template>

<script setup>
import CustomVoteCevaplananlar from "~/components/base/CustomVoteCevaplananlar.vue";

defineProps({
    cevaplananlar: Array
})
</script>

<style scoped>
.custom-cevaplanan-card {
    @apply
    border border-gray-yuz w-full relative
    rounded-2xl p-2 lg:p-4 mt-2 shadow
}

.custom-cevaplanan-card-detay {
    @apply
    flex items-center
}

.custom-cevaplanan-card-detay > img {
    @apply
    w-10
}

.custom-cevaplanan-card-title {
    @apply
    flex flex-col ml-2
}

.custom-cevaplanan-card-title-baslik {
    @apply
    text-gray-yediyuz text-sm font-semibold
}

.custom-cevaplanan-card-title-baslik:before {
    content: "";
    @apply
    absolute top-0 left-0 right-0
    bottom-0 transition-all
}

.custom-cevaplanan-card-title-icerik {
    @apply
    text-gray-besyuz text-xs font-normal
}

.custom-cevaplanan-card-soru {
    @apply
    text-dark font-semibold text-base mt-2
}

.custom-cevaplanan-card-soru-detay {
    @apply
    text-gray-besyuz text-sm font-normal mt-2
}
</style>
