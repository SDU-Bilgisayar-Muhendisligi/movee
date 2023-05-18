<template>
    <base-card height-type="height-auto" flex-type="lg:between-row" padding-size="p-0">
        <custom-bar/>
        <custom-cevap/>
        <div class="profile-container">
            <profile-side-bar class="wow"/>
            <custom-profile-un-answered class="" :cevaplanmayanlar="cevaplanmayanlar"/>
        </div>
    </base-card>
</template>

<script setup>
import BaseCard from "~/components/cards/BaseCard.vue";
import ProfileSideBar from "~/components/app/Sidebar/ProfileSideBar.vue";
import CustomBar from "~/components/base/CustomBar.vue";
import CustomCevap from "~/components/base/CustomCevap.vue";
import CustomProfileUnAnswered from "~/components/base/CustomProfileUnAnswered.vue";
import BackgrounImage from "~/components/common/BackgrounImage.vue";

definePageMeta({
    layout: "temiz"
})
const cevaplanmayanlar = ref([
    {
        id: 1,
        img: '/friday-game.png',
        slug: 'friday-the-13th-the-game',
        baslik: "Friday the 13th: The Game",
        icerik: "Oyun • 1 İçerik",
        soru: "Friday the 13th: The Game Çocuklar için bir tehdit oluşturuyor mu?",
        soruDetay: "Oyunu incelediğimizde özellikle 8 yaş altı çocuklarda epilepsi krizine sebep olduğu yap...",
        tarih: "15 Mart 2023",
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
        tarih: "15 Mart 2023",
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
        tarih: "15 Mart 2023",
        soruDetay: "Bu oyuncak çocuklarda zeka geriliğine sebep olmakla birlikte, çocuklara çeşitli görevler ver...",
        voteHisbe: 9,
        voteUser: 7,
        max: 10,
        hisbe: 'Çok Kötü',
        kullanicilar: 'Normal'
    },
])
const cevaplanmayan = ref()
const route = useRoute()

for (let i = 0; i < cevaplanmayanlar.value.length; i++) {
    if (cevaplanmayanlar.value[i].slug == route.params.slug) {
        cevaplanmayan.value = cevaplanmayanlar.value[i]
    }
}


</script>

<style scoped>
.profile-container {
    @apply
    flex flex-col-reverse lg:flex-row justify-between w-full
}

.wow {
    display: none !important
}

@media (min-width: 1024px) {
    .wow {
        display: block !important
    }
}


</style>
