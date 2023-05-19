<template>
    <div class="platform-detay-container relative">
        <!--        <img src="/img_5.png" class="image" alt="">-->
        <div class="blur absolute w-full"></div>
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
                    <custom-progress-bar-vote/>
                    <custom-button @click="showButton = !showButton" v-show="!showButton" class="puanla-button">
                        Puanla
                    </custom-button>
                    <custom-button v-show="showButton" @click="showButton = !showButton" class="tesekkürler-button"
                                   bg-color="bg-green-text-white">Teşekkürler
                    </custom-button>

            </div>
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
import Close from "~/components/common/Close.vue";
import CustomProgressBarVote from "~/components/base/CustomProgressBarVote.vue";

defineProps({
    merakEdilen: Object
})



const showModal = ref(false)
const showButton = ref(false)

const modalOpen = () => {
    const body = document.querySelector('body')
    const platformDetayContainer = document.querySelector('.platform-detay-container')
    platformDetayContainer.classList.add('!z-50')
    body.classList.add('overflow-hidden')
    showModal.value = !showModal.value
}

const modalClose = () => {
    const body = document.querySelector('body')
    const platformDetayContainer = document.querySelector('.platform-detay-container')
    platformDetayContainer.classList.remove('!z-50')
    body.classList.remove('overflow-hidden')
    showModal.value = !showModal.value
}


</script>
<style scoped>
.platform-detay-container {
    @apply
    flex flex-col items-center
    w-full mt-12 lg:mt-0 py-2 z-10
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
    w-full lg:w-7/12 h-4/6
}

.platform-detay-container-button {
    @apply
    w-full lg:w-4/12 h-[54%]
}

.platform-detay-modal {
    @apply
    fixed top-0 left-0 right-0
    bg-dark z-10  bg-opacity-70 h-screen
}

.platform-detay-modal-content {
    transform: translate(-50%, 30%);
    @apply
    flex justify-center fixed  right-0
    z-20  left-[50%] w-11/12 lg:w-1/4
}

.arama-baslik-container {
    filter: drop-shadow(0 1px #F2F4F7);
    @apply
    flex flex-col items-center justify-between
    bg-white lg:p-3 relative
    border border-gray-yuz rounded-2xl w-full
}
.arama-baslik{
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
    font-semibold
    text-lg w-11/12 lg:w-full
}

.arama-baslik-container-destek {
    @apply
    flex justify-start
    text-gray-besyuz
    font-normal
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


.blur {
    filter: blur(30px);
    background: linear-gradient(90deg, rgba(78, 75, 223, 1) 0%, rgba(255, 153, 74, 1), rgba(61, 212, 157, 1) 100%);
    @apply
    opacity-30 h-3/6 -top-[10px] -z-10
}

</style>
