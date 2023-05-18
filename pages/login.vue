<template>
    <base-card>
        <div class="login">
          <img src="/mobile-movee.png" alt="">
            <p class="login-welcome">Merhaba, tekrar hoş geldiniz</p>
            <p class="login-incentive">Üye değil misiniz?
                <nuxt-link to="/signup" class="text-primary">Kaydolun</nuxt-link>
            </p>
            <custom-form class="login-custom-form"/>
            <custom-form class="login-custom-form" label="Şifre" type="password" placeholder="Şifre Gir"
                         password="true"/>
            <nuxt-link to="/profile" class="w-full flex justify-center">
                <custom-button class="login-custom-button">Giriş Yap</custom-button>
            </nuxt-link>
            <p class="login-incentive">Şifrenizi mi unuttunuz?
                <nuxt-link to="/forgot" class="text-primary">Şifremi sıfırla</nuxt-link>
            </p>
        </div>
    </base-card>
</template>

<script setup>
import CustomForm from "~/components/base/CustomFormInput.vue";
import BaseCard from "~/components/cards/BaseCard.vue";
import CustomButton from "~/components/base/CustomButton.vue";


definePageMeta({
    layout:"temiz",
})

</script>


<style scoped>

.login {
    @apply
    flex flex-col items-center justify-center w-full lg:w-1/2
}

.login-welcome {
    @apply
    text-gray-yediyuz font-semibold
    text-xl mt-8 w-full text-center
}

.login-incentive {
    @apply
    text-gray-besyuz font-normal text-sm mt-2
}

.login-custom-form {
    @apply
    w-full lg:w-10/12
}

img{
  @apply
  w-[150px]
}

.login-custom-button {
    @apply
    w-full lg:w-10/12 mt-6
}
</style>
