<template>
    <div class="arama-baslik-container" v-for="merakEdilen in merakEdilenler" :key="merakEdilen.id">
        <div class="flex items-center">
            <img :src="merakEdilen.img" :alt="merakEdilen.img" class="w-[40px]">
            <div class="arama-baslik-container-detay">
                <nuxt-link :to="`/platform/${merakEdilen.slug}`" class="arama-baslik-container-detay-baslik">{{ merakEdilen.baslik }}</nuxt-link>
                <p class="arama-baslik-container-detay-icerik">{{ merakEdilen.icerik }}</p>
            </div>
        </div>
        <custom-vote-merak-edilen :merak-edilen="merakEdilen" gorunum="yan-yana"/>
    </div>
    <mobile-slider class="flex lg:hidden" :items="merakEdilenler"/>
</template>

<script setup>
import CustomVoteMerakEdilen from "~/components/base/CustomVoteMerakEdilen.vue";
import MobileSlider from "~/components/base/MobileSlider.vue";

const merakEdilenler = ref([
    {
        id: 1,
        img: '/img.png',
        slug: 'netflix',
        baslik: "Netflix",
        icerik: "Site • 2 İçerik",
        uzunAciklama:"YouTube Kids, Google'ın bir yan kuruluşu olan YouTube tarafından geliştirilen bir çocuk video uygulamasıdır. Uygulama, çocuklara yönelik hizmetin bir sürümünü sunar.",
        voteHisbe: 2,
        voteUser: 1,
        max: 10,
        hisbe: 'Çok Kötü',
        kullanicilar: 'Kötü'
    },
    {
        id: 2,
        img: '/youtube-kids.png',
        slug: 'youtube-kids',
        baslik: "Youtube Kids",
        icerik: "Marka • 2 İçerik",
        uzunAciklama:"YouTube Kids, Google'ın bir yan kuruluşu olan YouTube tarafından geliştirilen bir çocuk video uygulamasıdır. Uygulama, çocuklara yönelik hizmetin bir sürümünü sunar.",
        voteHisbe: 2,
        voteUser: 1,
        max: 10,
        hisbe: 'Çok Kötü',
        kullanicilar: 'Kötü'
    },
])
</script>

<style scoped>
.arama-baslik-container {
    @apply
    hidden lg:flex items-center justify-between border
    border-gray-yuz rounded-2xl bg-white px-2 py-1 mb-2 relative
}

.arama-baslik-container-detay {
    @apply
    flex flex-col ml-2
}

.arama-baslik-container-detay-baslik {
    @apply
    text-gray-yediyuz font-semibold text-sm
}

.arama-baslik-container-detay-baslik:before{
    content: "";
    @apply
    absolute top-0 left-0 right-0 bottom-0 transition-all
}

.arama-baslik-container-detay-icerik {
    @apply
    text-gray-yediyuz font-normal text-xs
}
</style>
