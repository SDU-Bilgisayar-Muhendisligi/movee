<template>
  <div class="arama-baslik-container">
    <div class="flex items-center justify-between w-full pt-4 px-4">
      <img :src="cevaplanan.img" :alt="cevaplanan.img" class="w-[40px]">
      <div class="arama-baslik-container-detay">
        <p class="arama-baslik-container-detay-baslik">{{ cevaplanan.baslik }}</p>
        <p class="arama-baslik-container-detay-icerik">{{ cevaplanan.icerik }}</p>
      </div>
      <close @click="modalClose" class="cursor-pointer"/>
    </div>
    <custom-vote-cevaplananlar :cevaplanan="cevaplanan" gorunum="yan-yana" class="w-11/12 lg:w-full mt-2"/>
    <p class="flex justify-start text-gray-yediyuz font-semibold text-lg w-11/12 lg:w-full  mt-2">Sizde puan
      verin</p>
    <p class="flex justify-start text-gray-besyuz font-normal text-sm w-11/12 lg:w-full mt-2">Bu başlığı kendi
      deneyim veya fikirlerinize göre puanlayıp diğer kullanıcılara yardımcı olun.</p>
    <custom-progress-bar-vote @hidden="width = $event"/>
    <custom-button @click="postVote" v-show="!showButton" class="w-11/12 lg:w-full mt-16 mb-3">Puanla</custom-button>
    <custom-button v-show="showButton" @click="showButton = !showButton" class="w-11/12 lg:w-full mt-16 mb-3"
                   bg-color="bg-green-text-white">Teşekkürler
    </custom-button>
  </div>
</template>

<script setup>
import CustomVoteCevaplananlar from "~/components/base/CustomVoteCevaplananlar.vue";
import CustomProgressBarVote from "~/components/base/CustomProgressBarVote.vue";
import Close from "~/components/common/Close.vue";
import CustomButton from "~/components/base/CustomButton.vue";


defineProps({
  cevaplanan: {
    type: Object,
  }
})

const emit = defineEmits(['hidden'])
const showModal = ref(false)
const showButton = ref(false)
let width = ref(0)

async function postVote() {
  await $fetch('https://jsonplaceholder.typicode.com/todos', {
    method: 'POST',
    body: width.value,
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
  }).then(async res => {
    if (res.error.value) {
      Toast.fire("Hata!", "Tekrar Deneyiniz", "error");
      return
    }
    showButton.value = !showButton.value
    width.value = 0
  }).finally(() => {
    modalClose()
  })
}

const modalClose = () => {
  const body = document.querySelector('body')
  body.classList.remove('overflow-hidden')
  emit('hidden', showModal.value)
  showModal.value = false
  width.value = 0
}
</script>


<style scoped>

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
