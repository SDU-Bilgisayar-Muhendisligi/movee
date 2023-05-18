<template>
    <base-card height-v-h="h-screen" padding-size="lg:py-8 pb-36" >
        <div class="new-password h-full">
            <hisbe-logo class="hidden lg:flex"/>
            <custom-geri-tusu class="self-start !top-10 !left-5"/>
            <p class="new-password-forgot-password">Yeni Şifre Oluştur</p>
            <p class="new-password-incentive">Hatırladınız mı?
                <nuxt-link to="/login" class="text-primary">Giriş yapın</nuxt-link>
            </p>
            <div class="grow w-full flex flex-col items-center justify-end">
                <custom-form class="new-password-custom-form" label="Yeni Şifreniz" placeholder="Şifreniz" password="true"
                             type="password"/>
                <custom-form class="new-password-custom-form" label="Yeni Şifreniz (tekrar)" placeholder="Şifreniz"
                             password="true" type="password"/>
                <custom-button class="new-password-custom-button">Şifremi sıfırla</custom-button>
            </div>
        </div>
    </base-card>
</template>

<script setup>
import BaseCard from "~/components/cards/BaseCard.vue";
import CustomForm from "~/components/base/CustomFormInput.vue";
import CustomButton from "~/components/base/CustomButton.vue";
import CustomGeriTusu from "~/components/base/CustomGeriTusu.vue";
import HisbeLogo from "~/components/common/HisbeLogo.vue";
import BackgrounImage from "~/components/common/BackgrounImage.vue";

definePageMeta({
    layout: "temiz"
})
</script>

<style scoped>
.new-password {
    @apply
    flex flex-col justify-between
    w-full lg:w-1/2 items-center
}

.new-password-custom-form {
    @apply
    w-full lg:w-10/12
}

.new-password-custom-button {
    @apply
    w-full lg:w-10/12 mt-6
}

.new-password-forgot-password{
    @apply
    text-gray-yediyuz font-normal text-base mt-8
}


.new-password-incentive {
    @apply
    text-gray-besyuz font-normal
    text-sm mt-2 hidden lg:flex
}
</style>
