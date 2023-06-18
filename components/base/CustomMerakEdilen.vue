<template>
    <div class="custom-merak-edilen-container" v-for="merakEdilen in merakEdilenler" :key="merakEdilen.id">
        <div class="custom-merak-edilen">
            <img :src="merakEdilen.img" alt="">
            <div class="custom-merak-edilen-icerik">
                <nuxt-link :to="`/cevaplananlar/${merakEdilen.slug}`" class="custom-merak-edilen-icerik-title">{{ merakEdilen.baslik }}</nuxt-link>
                <p class="custom-merak-edilen-icerik-detay">{{ merakEdilen.icerik }}</p>
            </div>
        </div>
        <custom-vote-merak-edilen gorunum="yan-yana" :merakEdilen="merakEdilen"/>
    </div>
</template>

<script setup>

import CustomVoteMerakEdilen from "~/components/base/CustomVoteMerakEdilen.vue";

defineProps({
    merakEdilenler: Array
})
</script>

<style scoped>
.custom-merak-edilen-container {
    @apply
    flex flex-col justify-around relative
    border-b border-gray-yuz mt-4
}

.custom-merak-edilen {
    @apply
    flex items-center
}

.custom-merak-edilen > img {
    @apply
    w-10 h-[45px]
}

.custom-merak-edilen-icerik {
    @apply
    flex flex-col ml-1
}

.custom-merak-edilen-icerik-title {
    @apply
    text-gray-yediyuz font-semibold text-sm
}

.custom-merak-edilen-icerik-title:before{
    content: "";
    @apply
    absolute top-0 left-0 right-0
    bottom-0 transition-all
}

.custom-merak-edilen-icerik-detay {
    @apply
    text-gray-besyuz font-normal text-xs
}
</style>
