<template>
    <div class="check-container">
        <check-fill/>
        <p class="check-text-bir">Başarıyla gönderildi!</p>
        <p class="check-text-iki">En hızlı şekilde sorduğunuz soruyu yanıtlamaya çalışacağız,
            tüm sorularına profilinden ulaşabilirsin.</p>
        <custom-button class="check-show-question-button">
            <nuxt-link to="/profile/cevaplananlar">Sorularımı Görüntüle</nuxt-link>
        </custom-button>
        <custom-button bg-color="bg-gray-text-dark" class="check-new-question-button" @click="reloadPage">Yeni soru sor
        </custom-button>
    </div>
</template>

<script setup>
import CustomButton from "~/components/base/CustomButton.vue";
import CheckFill from "~/components/common/CheckFill.vue";


const reloadPage = () => {
    window.location.reload()
}
</script>

<style scoped>
.check-container {
    @apply
    flex flex-col justify-center items-center
    lg:w-8/12
}

.check-text-bir {
    @apply
    text-gray-yediyuz font-semibold text-lg mt-8
}

.check-text-iki {
    @apply
    text-gray-besyuz font-normal text-sm mt-2 text-center
}

.check-show-question-button{
    @apply
    mt-8 cursor-pointer w-full
}

.check-new-question-button{
    @apply
    mt-4 cursor-pointer w-full
}
</style>
