<template>
    <div class="arama-icerik-container" v-for="cevaplanan in cevaplananlar" :key="cevaplananlar.id">
        <div class="wow">
            <img :src="cevaplanan.img" :alt="cevaplanan.img" class="w-[40px]">
            <div class="arama-icerik-container-detay">
                <nuxt-link :to="`/platform/${cevaplanan.slug}`" class="arama-icerik-container-detay-baslik">
                    {{ cevaplanan.baslik }}
                </nuxt-link>
                <p class="arama-icerik-container-detay-icerik">{{ cevaplanan.icerik }}</p>
            </div>
            <custom-vote-cevaplananlar :cevaplanan="cevaplanan"  class="hidden mt-6 lg:flex mb-4"/>
        </div>
        <p class="arama-icerik-container-soru">{{ cevaplanan.soru }}</p>
        <p class="arama-icerik-container-soru-detay">{{ cevaplanan.soruDetay }}</p>
        <custom-vote-cevaplananlar :cevaplanan="cevaplanan"  class="flex mb-2 lg:hidden"/>
    </div>
</template>

<script setup>

import CustomVoteCevaplananlar from "~/components/base/CustomVoteCevaplananlar.vue";

const cevaplananlar = ref([
    {
        id: 1,
        img: '/friday-game.png',
        slug: 'friday-the-13th-the-game',
        baslik: "Friday the 13th: The Game",
        icerik: "Oyun • 1 İçerik",
        soru: "Friday the 13th: The Game Çocuklar için bir tehdit oluşturuyor mu?",
        soruDetay: "Oyunu incelediğimizde özellikle 8 yaş altı çocuklarda epilepsi krizine sebep olduğu yap...",
        voteHisbe: 8,
        voteUser: 10,
        max: 10,
        hisbe: 'İyi',
        kullanicilar: 'Normal'
    },
    {
        id: 2,
        img: '/haribo.png',
        slug: 'haribo',
        baslik: "Haribo",
        icerik: "Yiyecek • 1 İçerik",
        soru: "Sağlığa zararlı mı?",
        soruDetay: "Hayır. Haribo’nun içeriğine baktığımızda herhangi bir katkı maddesine rastlanmamıştır...",
        voteHisbe: 2,
        voteUser: 1,
        max: 10,
        hisbe: 'Çok Kötü',
        kullanicilar: 'Kötü'
    },
    {
        id: 3,
        img: '/huggy-wuggy.png',
        slug: 'huggy-wuggy',
        baslik: "Huggy Wuggy",
        icerik: "Oyun • 1 İçerik",
        soru: "",
        soruDetay: "Bu oyuncak çocuklarda zeka geriliğine sebep olmakla birlikte, çocuklara çeşitli görevler ver...",
        voteHisbe: 9,
        voteUser: 7,
        max: 10,
        hisbe: 'Çok Kötü',
        kullanicilar: 'Normal'
    },
])
</script>

<style scoped>
.arama-icerik-container {
    @apply
    block border border-gray-yuz rounded-2xl
    bg-white px-2  mb-2 mt-4 relative
}

.arama-icerik-container-detay {
    @apply
    flex flex-col ml-2 grow
}

.arama-icerik-container-detay-baslik {
    @apply
    text-gray-yediyuz font-semibold text-sm
}

.arama-icerik-container-detay-baslik:before {
    content: "";
    @apply
    absolute top-0 left-0 right-0
    bottom-0 transition-all
}

.arama-icerik-container-detay-icerik {
    @apply
    text-gray-yediyuz font-normal text-xs
}

.arama-icerik-container-soru {
    @apply
    text-dark font-semibold text-lg
}

.arama-icerik-container-soru-detay {
    @apply
    text-gray-besyuz font-normal text-sm mt-2 pb-4
}

.wow {
    @apply
    flex justify-between items-center w-full py-2 lg:py-0
}
</style>
