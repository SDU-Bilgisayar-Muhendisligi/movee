<template>
    <div class="custom-profile-answered">
        <div class="custom-profile-answered-card" v-for="cevaplanan in cevaplananlar" :key="cevaplanan.id">
            <div class="custom-profile-answered-card-container"
                 style="filter: drop-shadow(0 1px rgba(16, 24, 40, 0.05));">
                <nuxt-link :to="`/cevaplananlar/${cevaplanan.slug}`" class="custom-profile-answered-card-baslik">
                    {{ cevaplanan.baslik }}
                </nuxt-link>
                <p class="custom-profile-answered-card-tarih">{{ cevaplanan.tarih }} • <span>Cevaplandı</span>
                </p>
                <p class="custom-profile-answered-card-soru">{{ cevaplanan.soru }}</p>
                <custom-button bg-color="bg-gray-text-dark" class="mt-4">Cevap Verilen İçeriği Göster</custom-button>
            </div>
        </div>
    </div>
</template>

<script setup>
import CustomButton from "~/components/base/CustomButton.vue";

defineProps({
    cevaplananlar: Object
})


</script>

<style scoped>
.custom-profile-answered {
    @apply
    flex flex-col w-full
}

.custom-profile-answered-card {
    @apply
    flex flex-col items-center w-full py-3 lg:py-8
}

.custom-profile-answered-card-container {
    @apply
    flex flex-col border border-gray-ikiyuz w-full lg:w-10/12 p-4 rounded-2xl bg-white relative
}

.custom-profile-answered-card-baslik {
    @apply
    text-gray-yediyuz font-semibold text-sm
}

.custom-profile-answered-card-baslik:before {
    content: "";
    @apply
    absolute top-0 left-0 right-0
    bottom-0 transition-all
}
.custom-profile-answered-card-baslik:hover{
    @apply
    bg-white
}
.custom-profile-answered-card-tarih {
    @apply
    text-gray-besyuz font-normal text-xs mt-2
}

.custom-profile-answered-card-soru {
    @apply
    text-gray-besyuz font-normal text-sm mt-4
}

span{
    @apply
    text-primary
}
</style>
