<template>
  <div class="arama-baslik-container">
    <div class="arama-baslik">
      <img :src="merakEdilen.img" :alt="merakEdilen.img" class="w-[40px]">
      <div class="arama-baslik-container-detay">
        <p class="arama-baslik-container-detay-baslik">{{ merakEdilen.baslik }}</p>
        <p class="arama-baslik-container-detay-icerik">{{ merakEdilen.icerik }}</p>
      </div>
      <close @click="modalClose" class="cursor-pointer"/>
    </div>
    <custom-vote-merak-edilen :merak-edilen="merakEdilen" gorunum="yan-yana" class="w-11/12 lg:w-full mt-2"/>
    <p class="arama-baslik-container-puan-ver">Sizde puan verin</p>
    <p class="arama-baslik-container-destek">Bu başlığı kendi deneyim veya fikirlerinize göre
      puanlayıp diğer kullanıcılara yardımcı olun.</p>
    <custom-progress-bar-vote @hidden="width = $event"/>
    <custom-button @click="postVote" v-show="!showButton" class="puanla-button">
      Puanla
    </custom-button>
    <custom-button v-show="showButton" @click="showButton = !showButton" class="tesekkürler-button"
                   bg-color="bg-green-text-white">Teşekkürler
    </custom-button>
  </div>
</template>

<script setup>
import CustomButton from "~/components/base/CustomButton.vue";
import CustomVoteMerakEdilen from "~/components/base/CustomVoteMerakEdilen.vue";
import Close from "~/components/common/Close.vue";
import CustomProgressBarVote from "~/components/base/CustomProgressBarVote.vue";
defineProps({
  merakEdilen: Object
})

const showModal = ref(false)
const showButton = ref(false)
let width = ref(0)
const emit = defineEmits(['hidden'])
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
.arama-baslik-container {
  filter: drop-shadow(0 1px #F2F4F7);
  @apply
  flex flex-col items-center
  bg-white lg:p-3 relative
  border border-gray-yuz
  rounded-2xl w-full
  justify-between
}

.arama-baslik {
  @apply
  flex items-center justify-between w-full pt-4 px-4
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

.arama-baslik-container-puan-ver {
  @apply
  flex justify-start
  text-gray-yediyuz
  font-semibold px-2
  text-lg w-11/12 lg:w-full
}

.arama-baslik-container-destek {
  @apply
  flex justify-start
  text-gray-besyuz
  font-normal px-2
  text-sm w-11/12 lg:w-full mt-2
}

.puanla-button {
  @apply
  w-11/12 lg:w-full mt-16 mb-3
}

.tesekkürler-button {
  @apply
  w-11/12 lg:w-full mt-16 mb-3
}
</style>
