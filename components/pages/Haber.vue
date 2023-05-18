<template>
    <div class="px-4 lg:px-4 lg:container lg:mx-auto mb-8 lg:mb-0">

    <div class="haber-container" v-for="haber in haberler" :key="haber.id">
           <div class="haber-container-detay">
               <img :src="haber.img" alt="">
               <div class="haber-container-detay-icerik">
                   <p class="haber-container-detay-icerik-tarih">{{haber.tarih}}</p>
                   <nuxt-link :to="`/haberler/${haber.slug}`" class="haber-container-detay-icerik-baslik" @click="toUp">{{haber.baslik}}</nuxt-link>
                   <p class="haber-container-detay-icerik-aciklama">{{haber.aciklama}}</p>
               </div>
           </div>
       </div>
    </div>

</template>

<script setup>
defineProps({
    haberler:Array
})

const toUp = ( ) => {
    window.scrollTo({
        top:0,
    })
}
</script>


<style scoped>
.haber-container {
    @apply
    border border-gray-yuz rounded-2xl p-2 relative mt-2
}

.haber-container-detay {
    @apply
    flex flex-col md:flex-row  md:items-center
}

.haber-container-detay > img {
    @apply
    w-full md:w-1/5
}

.haber-container-detay-icerik {
    @apply
    flex flex-col md:w-3/4 md:ml-4 mt-7 md:mt-0 mb-7 md:mb-0
}

.haber-container-detay-icerik-tarih {
    @apply
    text-gray-besyuz font-medium text-xs lg:mt-2
}

.haber-container-detay-icerik-baslik {
    @apply
    text-dark font-semibold text-base md:text-lg lg:mt-2
}

.haber-container-detay-icerik-aciklama {
    @apply
    text-gray-besyuz font-normal text-base
}

.haber-container-detay-icerik-baslik:before{
    content: "";
    @apply
    absolute
    top-0 left-0
    right-0 bottom-0
    transition-all
}
</style>
