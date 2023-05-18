<template>
    <div class="custom-food-game-container-summary">
        <div class="custom-food-game-container-summary-content">
            <img :src="cevaplanan.img" :alt="cevaplanan.img">
            <div class="custom-food-game-container-summary-content-headlines">
                <p class="custom-food-game-container-summary-content-headlines-baslik">{{cevaplanan.baslik}}</p>
                <p class="custom-food-game-container-summary-content-headlines-icerik">{{cevaplanan.icerik}}</p>
            </div>
        </div>
        <custom-vote-cevaplananlar gorunum="yan-yana" class="w-full lg:w-auto mt-6 lg:mt-0" :cevaplanan="cevaplanan"/>
    </div>
</template>

<script setup >
import CustomVoteCevaplananlar from "~/components/base/CustomVoteCevaplananlar.vue";

defineProps({
    cevaplanan: Object
})
</script>

<style scoped>
.custom-food-game-container-summary{
    @apply
    flex flex-col lg:flex-row justify-between lg:border-b
    lg:border-gray-yuz items-center pb-6
}

.custom-food-game-container-summary-content{
    @apply
    flex items-center
}

.custom-food-game-container-summary-content > img{
    @apply
    hidden lg:flex w-10
}

.custom-food-game-container-summary-content-headlines{
    @apply
    flex flex-col ml-2
}

.custom-food-game-container-summary-content-headlines-baslik{
    @apply
    text-gray-yediyuz font-semibold text-lg text-center lg:text-start
}

.custom-food-game-container-summary-content-headlines-icerik{
    @apply
    text-gray-besyuz font-normal text-sm text-center lg:text-start
}
</style>
