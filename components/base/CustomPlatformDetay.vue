<template>
  <div class="platform-detay-container">
<!--    <div class="blur"></div>-->
    <img :src="merakEdilen.img" :alt="merakEdilen.img">
    <p class="platform-detay-container-baslik">{{ merakEdilen.baslik }}</p>
    <p class="platform-detay-container-icerik">{{ merakEdilen.icerik }}</p>
    <p class="platform-detay-container-uzun-aciklama">{{ merakEdilen.uzunAciklama }}</p>
    <div class="platform-detay-container-vote">
      <custom-vote-merak-edilen gorunum="yan-yana" class="platform-detay-container-merak-edilen"
                                :merakEdilen="merakEdilen"/>
      <custom-button @click="modalOpen" class="platform-detay-container-button">Sizde Puan Verin</custom-button>
    </div>
    <div v-show="showModal"
         @click="modalClose"
         class="platform-detay-modal">
    </div>
    <div class="platform-detay-modal-content" v-show="showModal">
      <modals-modal-vote-merak-edilen :merak-edilen="merakEdilen"  @close="modalClose" @hidden="showModal = $event"/>
    </div>
    <custom-geri-tusu/>
    <custom-paylas-tusu/>
  </div>
</template>
<script setup>
import CustomButton from "~/components/base/CustomButton.vue";
import CustomVoteMerakEdilen from "~/components/base/CustomVoteMerakEdilen.vue";
import CustomGeriTusu from "~/components/base/CustomGeriTusu.vue";
import CustomPaylasTusu from "~/components/base/CustomPaylasTusu.vue";
import Swal from "sweetalert2";

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

defineProps({
  merakEdilen: Object
})

const showModal = ref(false)
let width = ref(0)


const modalOpen = () => {
  const body = document.querySelector('body')
  body.classList.add('overflow-hidden')
  showModal.value = !showModal.value
  console.log(showModal.value)
}

const modalClose = () => {
  const body = document.querySelector('body')
  body.classList.remove('overflow-hidden')
  showModal.value = !showModal.value
}


</script>
<!--Todo: blur classina bakilacak-->
<style scoped>

.platform-detay-container {
  z-index: 5;
  @apply
  flex flex-col items-center
  w-full mt-12 lg:mt-0 py-2
}

.blur {
  filter: blur(30px);
  background: linear-gradient(90deg, rgba(78, 75, 223, 1) 0%, rgba(255, 153, 74, 1), rgba(61, 212, 157, 1) 100%);
  @apply
  opacity-30  absolute h-2/6 top-0 -z-50   w-full
}

.platform-detay-container-baslik {
  @apply
  text-gray-yediyuz
  font-semibold text-lg mt-4
}

.platform-detay-container-icerik {
  @apply
  text-gray-besyuz
  font-normal text-sm mt-2
}

.platform-detay-container-uzun-aciklama {
  @apply
  text-gray-besyuz font-normal
  text-sm text-center mt-4
}

.platform-detay-container-vote {
  @apply
  flex flex-col lg:flex-row
  items-center justify-between
  w-full bg-gray-elli
  rounded-2xl lg:mt-6 p-2 mt-6
}

.platform-detay-container-merak-edilen {
  @apply
  w-full lg:w-7/12 h-[44px] rounded-xl
}

.platform-detay-container-button {
  @apply
  w-full lg:w-4/12 h-[54%]
}

.platform-detay-modal {
  @apply
  fixed top-0 left-0 right-0
  bg-dark z-10  bg-opacity-70 h-full
}

.platform-detay-modal-content {
  transform: translate(-50%, 30%);
  @apply
  flex justify-center absolute right-0
  z-30 left-[50%] w-11/12 sm:w-7/12 lg:w-1/3 xl:w-1/4
}

.puanla-button {
  @apply
  w-11/12 lg:w-full mt-16 mb-3
}

.tesekkürler-button {
  @apply
  w-11/12 lg:w-full mt-16 mb-3
}

.image {
  filter: blur(30px);
  @apply
  w-full absolute right-0
  -top-[40px] -z-10
  hidden lg:flex
  left-0 bg-contain
  bg-no-repeat sm:bg-cover
  rounded-full h-[10%]
}


</style>
