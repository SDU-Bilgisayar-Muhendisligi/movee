<template>
    <div class="haber-detay-container">
        <img :src="haber.img" :alt="haber.img">
       <div class="px-4">
           <p class="haber-detay-container-tarih">{{ haber.tarih }}</p>
           <p class="haber-detay-container-baslik">{{ haber.baslik }}</p>
           <p class="haber-container-detay-icerik-uzun-aciklama">{{ haber.uzunAciklama }}</p>
           <custom-geri-tusu color="color-white" class="!top-10 !left-5"/>
           <custom-paylas-tusu color="color-white" class="!top-10 !right-5" />
       </div>
    </div>
</template>

<script setup>
import CustomGeriTusu from "~/components/base/CustomGeriTusu.vue";
import CustomPaylasTusu from "~/components/base/CustomPaylasTusu.vue";

defineProps({
    haber: Object
})


</script>

<style scoped>
.haber-detay-container {
    @apply
    w-full
}

.haber-detay-container > img {
    z-index: 40;
    @apply
    top-0 lg:static h-[500px]
    left-0 right-0 w-full lg:px-4
    lg:rounded-2xl object-cover
}

.haber-detay-container-tarih {
    @apply
    text-gray-besyuz
    font-medium
    text-xs p-0 mt-8
}

.haber-detay-container-baslik {
    @apply
    text-dark font-semibold
    text-xl mt-4
}

.haber-container-detay-icerik-uzun-aciklama {
    @apply
    text-gray-besyuz
    font-normal text-sm mt-4
}

</style>
