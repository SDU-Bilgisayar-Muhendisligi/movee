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
    <!--    <div class="custom-food-game-container-video">-->
    <!--      <img src="/video.png" alt="">-->
    <!--      <Play class="play text-white"/>-->
    <!--    </div>-->
    <iframe src="https://www.youtube.com/embed/L_ZFhPYJkhA" title="YouTube video player" frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            allowfullscreen></iframe>
    <p class="custom-food-game-container-expression-two">{{ cevaplanan.anlatimİki }}</p>
    <p class="custom-food-game-container-item">Kaynaklarda şöyle sesler var:</p>
<!--    <div class="custom-food-game-container-sound">-->
<!--      <Play id="play-icon" class="text-primary"/>-->
<!--      <audio controls controlsList="noplaybackrate" type="audio/mp3"></audio>-->
<!--    </div>-->
    <custom-audio/>
    <p class="custom-food-game-container-item">Sizde puanlayın</p>
    <custom-button @click="modalOpen" class="custom-food-game-container-vote-button">Sizde puan verin</custom-button>
    <div v-show="showModal" @click="modalClose" class="platform-detay-modal"></div>
    <div v-show="showModal" class="platform-detay-modal-content">
      <modal-vote :cevaplanan="cevaplanan"  @close="modalClose" @hidden="showModal = $event"/>
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
import Swal from 'sweetalert2'
import CustomVoteCevaplananlar from "~/components/base/CustomVoteCevaplananlar.vue";
import ModalVote from "~/components/modals/ModalVoteCevaplanan.vue";
import CustomAudio from "~/components/base/CustomAudio.vue";

const Toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,
  didOpen: (toast) => {
    toast.addEventListener('mouseenter', Swal.stopTimer)
    toast.addEventListener('mouseleave', Swal.resumeTimer)
  }
})

const props = defineProps({
  cevaplanan: Object
})


const showModal = ref(false)
const showButton = ref(false)
let width = ref(10)



const modalOpen = () => {
  const body = document.querySelector('body')
  body.classList.add('overflow-hidden')
  const customFoodGameContainer = document.querySelector('.custom-food-game-container')
  body.classList.add('overflow-hidden')
  showModal.value = !showModal.value
}

const modalClose = () => {
  const body = document.querySelector('body')
  body.classList.remove('overflow-hidden')
  showModal.value = !showModal.value
  width.value = 0
}


</script>


<style scoped>

::-webkit-scrollbar {
  width: 0;
  background: transparent;
}
.custom-food-game-container {
  @apply
  relative
}

.custom-food-game-container-summary-parent {
  @apply
  mt-6 lg:mt-0
}

.custom-food-game-container-date {
  @apply
  text-gray-besyuz font-medium
  text-xs lg:mt-6
}

.custom-food-game-container-question {
  @apply
  text-dark font-semibold
  text-xl mt-2 lg:mt-4
}

.custom-food-game-container-damage {
  @apply
  text-gray-besyuz font-normal
  text-sm mt-6 lg:mt-4
}

.custom-food-game-container-view-button {
  @apply
  w-1/2 lg:w-3/12
  font-semibold text-sm mt-4
}

.custom-food-game-container-expression-one {
  @apply
  text-gray-besyuz font-normal
  text-sm mt-6 lg:mt-4
}

.custom-food-game-container-expression-two {
  @apply
  text-gray-besyuz
  font-normal text-sm mt-6
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
  flex items-center bg-white border
  border-gray-yuz rounded-2xl px-2 mt-4
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
  bg-dark z-10 bg-opacity-70 h-full
}

.platform-detay-modal-content {
  transform: translate(-50%, 50%);
  @apply
  flex justify-center fixed  right-0
  z-20  left-[50%] w-11/12 lg:w-1/4 top-0
}

iframe {
  @apply
  w-full h-[200px] lg:h-[400px] mt-4
}

</style>
