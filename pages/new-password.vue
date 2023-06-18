<template>
  <base-card height-v-h="h-screen" padding-size="lg:py-8 pb-36">
    <div class="new-password h-full">
      <hisbe-logo class="hidden lg:flex"/>
      <custom-geri-tusu class="self-start !top-10 !left-5"/>
      <p class="new-password-forgot-password">Yeni Şifre Oluştur</p>
      <p class="new-password-incentive">Hatırladınız mı?
        <nuxt-link to="/login" class="text-primary">Giriş yapın</nuxt-link>
      </p>
      <div class="grow w-full flex flex-col items-center justify-end">
        <custom-form-input type="password" class="new-password-custom-form" label="Yeni Şifreniz" placeholder="Şifreniz"
                           v-model:value="inputForm.password"/>
        <span v-for="error in rules.password.$errors" class="text-error">{{error.$message}}</span>
        <custom-form-input class="new-password-custom-form" label="Yeni Şifreniz (tekrar)" placeholder="Şifreniz"
                           type="password" v-model:value="inputForm.password_confirmation"/>
        <span v-for="error in rules.password_confirmation.$errors" class="text-error">{{error.$message}}</span>
        <custom-button @click="new_password" class="new-password-custom-button">Şifremi sıfırla</custom-button>
      </div>
    </div>
  </base-card>
</template>

<script setup>
import Swal from "sweetalert2";
import useValidate from '@vuelidate/core'
import BaseCard from "~/components/cards/BaseCard.vue";
import HisbeLogo from "~/components/common/HisbeLogo.vue";
import CustomButton from "~/components/base/CustomButton.vue";
import CustomGeriTusu from "~/components/base/CustomGeriTusu.vue";
import CustomFormInput from "~/components/base/CustomFormInput.vue";
import { minLength, required, sameAs} from "@vuelidate/validators";

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
const inputForm = ref({
  password: '',
  password_confirmation: '',
})

const formRules = computed(() => {
  return {
    password: {required, minLength: minLength(6)},
    password_confirmation: {required, sameAs: sameAs(inputForm.value.password)}
  }
})

const rules = useValidate(formRules, inputForm)

const new_password = async () => {
  const reset = await rules.value.$validate()
  if (!reset) {
    return
  }
}


definePageMeta({
  layout: "background"
})

const postNewPassword = async (data) => {
  await $fetch('/api/cevaplanmayanlar', {
    method: 'POST',
    body: data,
    headers: {
      'Content-Type': 'application/json'
    }
  }).then(async res => {
    if (res.error.value) {
      Toast.fire("Hata!", "Tekrar Deneyiniz", "error");
      return
    }
    data = res.data.value
  })
}
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

.new-password-forgot-password {
  @apply
  text-gray-yediyuz font-normal text-base mt-8
}


.new-password-incentive {
  @apply
  text-gray-besyuz font-normal
  text-sm mt-2 hidden lg:flex
}
</style>
