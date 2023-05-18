<template>
    <div class="son-cevaplananlar">
        <p>En Son cevaplananlar</p>
        <CustomCevaplananCard :cevaplananlar="cevaplananlar"/>
    </div>
</template>

<script setup>

import CustomCevaplananCard from "~/components/base/CustomCevaplananCard.vue";

const cevaplananlar = ref([
    {
        id:1,
        img:'/friday-game.png',
        slug: 'friday-the-13th-the-game',
        baslik: "Friday the 13th: The Game",
        icerik: "Oyun • 1 İçerik",
        soru: "Friday the 13th: The Game Çocuklar için bir tehdit oluşturuyor mu?",
        soruDetay: "Oyunu incelediğimizde özellikle 8 yaş altı çocuklarda epilepsi krizine sebep olduğu yap...",
        voteHisbe: 8,
        voteUser: 10,
        max: 10,
        hisbe: 'İyi',
        kullanicilar:'Normal'
    },
    {
        id:2,
        img:'/haribo.png',
        slug: 'haribo',
        baslik: "Haribo",
        icerik: "Yiyecek • 1 İçerik",
        soru: "Sağlığa zararlı mı?",
        soruDetay: "Hayır. Haribo’nun içeriğine baktığımızda herhangi bir katkı maddesine rastlanmamıştır...",
        voteHisbe: 2,
        voteUser: 1,
        max: 10,
        hisbe: 'Çok Kötü',
        kullanicilar:'Kötü'
    },
    {
        id:3,
        img:'/huggy-wuggy.png',
        slug: 'huggy-wuggy',
        baslik: "Huggy Wuggy",
        icerik: "Oyun • 1 İçerik",
        soru: "",
        soruDetay: "Bu oyuncak çocuklarda zeka geriliğine sebep olmakla birlikte, çocuklara çeşitli görevler ver...",
        voteHisbe: 9,
        voteUser: 7,
        max: 10,
        hisbe: 'Çok Kötü',
        kullanicilar:'Normal'
    },
    {
        id:4,
        img:'/friday-game.png',
        slug: 'friday-the-13th-the-game',
        baslik: "Friday the 13th: The Game",
        icerik: "Oyun • 1 İçerik",
        soru: "Friday the 13th: The Game Çocuklar için bir tehdit oluşturuyor mu?",
        soruDetay: "Oyunu incelediğimizde özellikle 8 yaş altı çocuklarda epilepsi krizine sebep olduğu yap...",
        voteHisbe: 8,
        voteUser: 10,
        max: 10,
        hisbe: 'İyi',
        kullanicilar:'Normal'
    },
    {
        id:5,
        img:'/haribo.png',
        slug: 'haribo',
        baslik: "Haribo",
        icerik: "Yiyecek • 1 İçerik",
        soru: "Sağlığa zararlı mı?",
        soruDetay: "Hayır. Haribo’nun içeriğine baktığımızda herhangi bir katkı maddesine rastlanmamıştır...",
        voteHisbe: 2,
        voteUser: 1,
        max: 10,
        hisbe: 'Çok Kötü',
        kullanicilar:'Kötü'
    },
    {
        id:6,
        img:'/huggy-wuggy.png',
        slug: 'huggy-wuggy',
        baslik: "Huggy Wuggy",
        icerik: "Oyun • 1 İçerik",
        soru: "",
        soruDetay: "Bu oyuncak çocuklarda zeka geriliğine sebep olmakla birlikte, çocuklara çeşitli görevler ver...",
        voteHisbe: 9,
        voteUser: 7,
        max: 10,
        hisbe: 'Çok Kötü',
        kullanicilar:'Normal'
    }
])


</script>
<style scoped>
.son-cevaplananlar{
    @apply
    mt-4 lg:mt-8
}
.son-cevaplananlar > p{
    @apply
    text-sm font-semibold
    text-gray-yediyuz mb-4
}
</style>
