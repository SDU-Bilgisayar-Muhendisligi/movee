<template>
    <div class="kesfet">
        <div class="kesfet-main">
            <soru-sor-card/>
            <son-cevaplananlar class="mb-4 lg:mb-0"/>
        </div>
        <custom-merak-edilenler class="kesfet-merak-edilen"/>
        <mobile-slider />
        <p class="kesfet-main-text">En Çok Merak Edilenler</p>
    </div>
</template>

<script setup>

import SoruSorCard from "~/components/cards/SoruSorCard.vue";
import SonCevaplananlar from "~/components/pages/SonCevaplananlar.vue";
import CustomMerakEdilenler from "~/components/base/CustomMerakEdilenler.vue";
import MobileSlider from "~/components/base/MobileSlider.vue";
import AramaBaslik from "~/components/pages/AramaBaslik.vue";
import AramaIcerik from "~/components/pages/AramaIcerik.vue";
</script>
<style scoped>

.kesfet {
    scrollbar-width: none;
    -ms-overflow-style: none;  /* IE and Edge */
}
.body::-webkit-scrollbar{

    display: none;
}

.kesfet {
    @apply
    flex flex-col-reverse
    lg:flex-row justify-between
    lg:w-10/12 xl:w-3/4
}

.kesfet-main {
    @apply
    lg:w-[55%] xl:w-[57%]
    px-4 lg:px-0
}

.kesfet-merak-edilen {
    @apply
    lg:w-[42%] xl:w-[40%]
}

.kesfet-main-text {
    @apply
    text-gray-yediyuz font-semibold text-base mb-4 lg:hidden
    ml-4
}


</style>
