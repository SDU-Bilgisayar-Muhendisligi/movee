<template>
    <base-card height-v-h="h-screen" padding-size="py-8 pb-40">
        <div class="forgot">
            <hisbe-logo class="flex mb-10"/>
            <custom-geri-tusu class="self-start !top-10 !left-5"/>
            <p class="forgot-text">Şifremi unuttum</p>
            <p class="login-incentive hidden lg:flex">Hatırladınız mı?
                <nuxt-link to="/login" class="text-primary ml-2">Giriş yapın</nuxt-link>
            </p>
            <div class="grow w-full flex flex-col items-center justify-end">
                <custom-form-input   v-model:value="inputForm.email" class="forgot-custom-form" placeholder="E-posta adresiniz" label="E-posta" type="email"/>
              <span v-for="error in rules.email.$errors" class="error">Geçerli bir e-posta girin.</span>
                <nuxt-link to="/new-password" @click="reset_password" class="w-full flex justify-center">
                    <custom-button class="forgot-custom-button">Şifremi sıfırla</custom-button>
                </nuxt-link>
            </div>
            <div class="login-incentive flex lg:hidden mx-auto">Hatırladınız mı?
                <nuxt-link to="/login" class="text-primary ml-2">Giriş yapın</nuxt-link>
            </div>
        </div>
    </base-card>
</template>

<script setup>
import BaseCard from "~/components/cards/BaseCard.vue";
import CustomButton from "~/components/base/CustomButton.vue";
import CustomGeriTusu from "~/components/base/CustomGeriTusu.vue";
import HisbeLogo from "~/components/common/HisbeLogo.vue";
import Swal from "sweetalert2";
import {email, required} from "@vuelidate/validators";
import useValidate from "@vuelidate/core";
import CustomFormInput from "~/components/base/CustomFormInput.vue";


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
definePageMeta({
    layout: "background"
})

const inputForm = reactive({
  email: '',
})

const formRules = computed(() => {
  return {
    email: { required, email }
  }
})

const rules = useValidate(formRules, inputForm)

const reset_password = async () => {
  const reset = await rules.value.$validate()
  console.log(reset)
}


const postForgot = async () => {
  await $fetch('/api/cevaplanmayanlar', {
    method: 'GET',
    body: inputForm,
    headers: {
      'Content-Type': 'application/json'
    }
  }).then(async res => {
    if (res.error.value) {
      Toast.fire("Hata!", "Tekrar Deneyiniz", "error");
      return
    }
  })
}

</script>

<style scoped>

.error{
  @apply
  text-error text-start flex w-full lg:w-10/12
}

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
