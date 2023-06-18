<template>
    <div class="custom-merak-edilenler">
        <p>En Çok Merak Edilenler</p>
        <custom-merak-edilen :merakEdilenler="merakEdilenler"/>
    </div>
</template>
<script setup>
import CustomMerakEdilen from "~/components/base/CustomMerakEdilen.vue";

const {data:merakEdilenler} = await useFetch('https://run.mocky.io/v3/a67dcf08-ac47-4b5e-a2b2-b444cae51d8b')

// const merakEdilenler = ref([
//     {
//         id: 1,
//         img: '/snapchat.png',
//         slug: 'snapchat',
//         baslik: "Snapchat",
//         icerik: "Marka • 2 İçerik",
//         voteHisbe: 2,
//         voteUser: 1,
//         max: 10,
//         hisbe: 'İyi',
//         kullanicilar: 'Normal'
//     },
//     {
//         id: 2,
//         img: '/img.png',
//         slug: 'netflix',
//         baslik: "Netflix",
//         icerik: "Site • 2 İçerik",
//         voteHisbe: 2,
//         voteUser: 1,
//         max: 10,
//         hisbe: 'Çok Kötü',
//         kullanicilar: 'Kötü'
//     },
//     {
//         id: 3,
//         img: '/enes-batur.png',
//         slug: 'enes-batur',
//         baslik: "Enes Batur",
//         icerik: "Kişi • 2 İçerik",
//         voteHisbe: 9,
//         voteUser: 7,
//         max: 10,
//         hisbe: 'Çok Kötü',
//         kullanicilar: 'Normal'
//     }
// ])

</script>

<style scoped>
.custom-merak-edilenler {
    @apply
    bg-gray-elli rounded-2xl
    p-4 hidden lg:flex
    flex-col h-fit
    overflow-hidden
}

.custom-merak-edilenler > p {
    @apply
    font-semibold text-gray-yediyuz text-sm
}
</style>
