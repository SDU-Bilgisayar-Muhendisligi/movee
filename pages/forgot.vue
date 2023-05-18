<template>
    <base-card height-v-h="h-screen" padding-size="py-8 pb-40">
        <div class="forgot">
            <hisbe-logo class="hidden lg:flex"/>
            <custom-geri-tusu class="self-start !top-10 !left-5"/>
            <p class="forgot-text">Şifremi unuttum</p>
            <p class="login-incentive hidden lg:flex">Hatırladınız mı?
                <nuxt-link to="/login" class="text-primary ml-2">Giriş yapın</nuxt-link>
            </p>
            <div class="grow w-full flex flex-col items-center justify-end">
                <custom-form class="forgot-custom-form" type="email"/>
                <nuxt-link to="/new-password" class="w-full flex justify-center">
                    <custom-button class="forgot-custom-button">Şifremi sıfırla</custom-button>
                </nuxt-link>
            </div>
            <p class="login-incentive flex lg:hidden mx-auto">Hatırladınız mı?
                <nuxt-link to="/login" class="text-primary ml-2">Giriş yapın</nuxt-link>
            </p>
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
.forgot {
    @apply
    flex flex-col justify-between
    w-full lg:w-1/2 items-center
}

.forgot-text {
    @apply
    text-gray-yediyuz font-normal text-base lg:mt-8
}

.signup-kaydol {
    @apply
    text-gray-yediyuz
    font-semibold text-xl lg:mt-8
}

.signup-soru {
    @apply
    text-gray-besyuz font-normal text-sm
}

.forgot-custom-form {
    @apply
    w-full lg:w-10/12
}

.forgot-custom-button {
    @apply
    w-full lg:w-10/12 mt-6
}


.login-incentive {
    @apply
    text-gray-besyuz font-normal text-sm mt-2

}
</style>
