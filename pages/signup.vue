<template>
    <base-card flex-type="middle-row">
        <div class="signup">
          <img src="/mobile-movee.png" alt="">
            <p class="signup-kaydol">Kaydol</p>
            <p class="signup-soru">Zaten üye misiniz?
                <nuxt-link to="/login" class="text-primary"> Giriş yapın</nuxt-link>
            </p>
            <custom-form class="signup-custom-form" label="Adınız soyadınız" placeholder="Adınız soyadınız"/>
            <custom-form class="signup-custom-form"/>
            <custom-form class="signup-custom-form" label="Şifreniz" placeholder="Şifreniz" password="true"
                         type="password"/>
            <custom-button class="signup-custom-button">Kaydol</custom-button>
        </div>
    </base-card>
</template>

<script setup>
import BaseCard from "~/components/cards/BaseCard.vue";
import CustomForm from "~/components/base/CustomFormInput.vue";
import CustomButton from "~/components/base/CustomButton.vue";
definePageMeta({
    layout: "temiz"
})
</script>

<style scoped>
.signup {
    @apply
    flex flex-col items-center
    justify-center w-full lg:w-1/2
}

.signup-kaydol {
    @apply
    text-gray-yediyuz
    font-semibold text-xl mt-8
}

.signup-soru {
    @apply
    text-gray-besyuz font-normal text-sm mt-2
}

.signup-custom-form {
    @apply
    w-full lg:w-10/12
}
img{
  @apply
  w-[150px]
}
.signup-custom-button {
    @apply
    w-full lg:w-10/12 mt-6
}
</style>
