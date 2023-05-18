<template>
    <div class="custom-food-game-container">
        <custom-food-game-summary class="custom-food-game-container-summary-parent" :cevaplanan="cevaplanan"/>
        <custom-geri-tusu/>
        <custom-paylas-tusu/>
        <p class="custom-food-game-container-date">{{ cevaplanan.date }}</p>
        <p class="custom-food-game-container-question">{{ cevaplanan.soru }}</p>
        <p class="custom-food-game-container-damage">{{ cevaplanan.zarar }}</p>
        <custom-button class="custom-food-game-container-view-button" bg-color="bg-gray-text-dark">Kaynağı
            Görüntüleyin
        </custom-button>
        <p class="custom-food-game-container-expression-one">{{ cevaplanan.anlatimBir }}</p>
        <p class="custom-food-game-container-item">Sizin için bir video hazırladık.</p>
        <div class="custom-food-game-container-video">
            <img src="/video.png" alt="">
            <Play class="play text-white"/>
        </div>
        <p class="custom-food-game-container-expression-two">{{ cevaplanan.anlatimİki }}</p>
        <p class="custom-food-game-container-item">Kaynaklarda şöyle sesler var:</p>
        <div class="custom-food-game-container-sound">
            <Play id="play-icon" class="text-primary"/>
            <audio controls controlsList="noplaybackrate" type="audio/mp3">
            </audio>
        </div>
        <p class="custom-food-game-container-item">Sizde puanlayın</p>
        <custom-button @click="modalOpen" class="custom-food-game-container-vote-button">Sizde puan verin</custom-button>
        <div v-show="showModal" @click="modalClose" class="platform-detay-modal"></div>
        <div v-show="showModal" class="platform-detay-modal-content">
            <div class="arama-baslik-container">
                <div class="flex items-center justify-between w-full pt-4 px-4">
                    <img :src="cevaplanan.img" :alt="cevaplanan.img" class="w-[40px]">
                    <div class="arama-baslik-container-detay">
                        <p class="arama-baslik-container-detay-baslik">{{ cevaplanan.baslik }}</p>
                        <p class="arama-baslik-container-detay-icerik">{{ cevaplanan.icerik }}</p>
                    </div>
                    <close @click="modalClose" class="cursor-pointer"/>
                </div>
                <div class="pb-4 px-4">
                    <custom-vote-cevaplananlar :cevaplanan="cevaplanan" gorunum="yan-yana" class="w-full mt-2"/>
                    <p class="flex justify-start text-gray-yediyuz font-semibold text-lg w-full mt-2">Sizde puan
                        verin</p>
                    <p class="flex justify-start text-gray-besyuz font-normal text-sm w-full mt-2">Bu başlığı kendi
                        deneyim veya fikirlerinize göre puanlayıp diğer kullanıcılara yardımcı olun.</p>
                    <custom-progress-bar-vote/>
                    <custom-button @click="showButton = !showButton"  v-show="!showButton" class="w-full mt-16">Puanla</custom-button>
                    <custom-button v-show="showButton" @click="showButton = !showButton"  class="w-full mt-16" bg-color="bg-green-text-white">Teşekkürler</custom-button>
                </div>
            </div>
        </div>
    </div>

</template>

<script setup>

import CustomFoodGameSummary from "~/components/base/CustomFoodGameSummary.vue";
import CustomButton from "~/components/base/CustomButton.vue";
import Play from "~/assets/play.svg";
import CustomGeriTusu from "~/components/base/CustomGeriTusu.vue";
import CustomPaylasTusu from "~/components/base/CustomPaylasTusu.vue";
import Close from "~/components/common/Close.vue";
import CustomProgressBarVote from "~/components/base/CustomProgressBarVote.vue";
import CustomVoteMerakEdilen from "~/components/base/CustomVoteMerakEdilen.vue";
import CustomVoteCevaplananlar from "~/components/base/CustomVoteCevaplananlar.vue";

const props = defineProps({
    cevaplanan: Object
})

const showModal = ref(false)
const showButton = ref(false)

const modalOpen = () => {
    const body = document.querySelector('body')
    const customFoodGameContainer = document.querySelector('.custom-food-game-container')
    customFoodGameContainer.classList.add('!z-50')
    body.classList.add('overflow-hidden')
    showModal.value = !showModal.value
}

const modalClose = () => {
    const body = document.querySelector('body')
    const customFoodGameContainer = document.querySelector('.custom-food-game-container')
    customFoodGameContainer.classList.remove('!z-50')
    body.classList.remove('overflow-hidden')
    showModal.value = !showModal.value
}


</script>


<style scoped>

.custom-food-game-container{
    @apply
    relative
}


.custom-food-game-container-summary-parent {
    @apply
    mt-6 lg:mt-0
}

.custom-food-game-container-date {
    @apply
    text-gray-besyuz font-medium text-xs lg:mt-6
}

.custom-food-game-container-question {
    @apply
    text-dark font-semibold text-xl mt-2 lg:mt-4
}

.custom-food-game-container-damage {
    @apply
    text-gray-besyuz font-normal text-sm mt-6 lg:mt-4
}

.custom-food-game-container-view-button {
    @apply
    w-1/2 lg:w-3/12 font-semibold text-sm mt-4
}

.custom-food-game-container-expression-one {
    @apply
    text-gray-besyuz font-normal text-sm mt-6 lg:mt-4
}

.custom-food-game-container-expression-two {
    @apply
    text-gray-besyuz font-normal text-sm mt-6
}

.custom-food-game-container-item {
    @apply
    text-dark font-semibold text-sm mt-6
}

.custom-food-game-container-video {
    @apply
    relative mt-4
}

.custom-food-game-container-sound {
    @apply
    flex items-center bg-white border border-gray-yuz rounded-2xl px-2 mt-4
}

.custom-food-game-container-vote-button {
    @apply
    mt-4 mb-4
}

.image {
    @apply
    flex lg:hidden bg-contain bg-no-repeat sm:bg-cover
    absolute w-full top-0 right-0 left-0
    -z-50 lg:rounded-2xl lg:h-2/6
}

.play {
    transform: translate(-50%, 0);
    @apply
    absolute top-[50%] left-[50%]
}

input[type="range" i]::part(-webkit-slider-container) {
    @apply
    bg-primary
}

audio {
    @apply
    w-11/12
}

audio::-webkit-media-controls-current-time-display {
    @apply
    text-gray-besyuz
}

audio::-webkit-media-controls-time-remaining-display {
    order: 3;
    @apply
    text-gray-besyuz
}

audio::-webkit-media-controls-timeline > #shadow-root {
    @apply
    bg-primary
}

audio::-webkit-media-controls-panel {
    color: #a0276e;
    @apply
    bg-white
}


audio::-webkit-media-controls-play-button {
    @apply
    hidden
}

audio::-webkit-media-controls-volume-control-container {
    @apply
    hidden
}

audio {
    @apply
    bg-white
}



.platform-detay-modal {
    @apply
    fixed top-0 left-0 right-0
    bg-dark z-10 bg-opacity-70 h-screen
}

.platform-detay-modal-content {
    transform: translate(-50%, 50%);
    @apply
    flex justify-center fixed  right-0
    z-20  left-[50%] w-11/12 lg:w-1/4 top-0
}

.arama-baslik-container {
    filter: drop-shadow(0 1px #F2F4F7);
    @apply
    flex flex-col items-center justify-between
    bg-white lg:p-3 relative
    border border-gray-yuz rounded-2xl w-full
}

.arama-baslik-container-detay {
    @apply
    flex flex-col ml-2 grow
}

.arama-baslik-container-detay-baslik {
    @apply
    text-gray-yediyuz font-semibold text-sm
}

.arama-baslik-container-detay-icerik {
    @apply
    text-gray-yediyuz font-normal text-xs
}


</style>
