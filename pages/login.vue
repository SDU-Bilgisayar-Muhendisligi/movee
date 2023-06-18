<template>
  <base-card>
    <div class="login">
      <HisbeLogo/>
      <p class="login-welcome">Merhaba, tekrar hoş geldiniz</p>
      <p class="login-incentive">Üye değil misiniz?
        <nuxt-link to="/signup" class="login-sign-up">Kaydolun</nuxt-link>
      </p>
      <custom-form-input class="login-custom-form" v-model:value="inputForm.email" label="E-posta" type="email" placeholder="E-posta adresiniz"/>
      <span v-for="error in rules.email.$errors" class="error">{{error.$message}}</span>
      <custom-form-input class="login-custom-form" v-model:value="inputForm.password" label="Şifre" type="password" placeholder="Şifre Gir"/>
      <span v-for="error in rules.password.$errors" class="error">{{error.$message}}</span>
      <nuxt-link class="login-button" @click="login">
        <custom-button class="login-custom-button" @click="postLogin">Giriş Yap</custom-button>
      </nuxt-link>
      <p class="login-incentive">Şifrenizi mi unuttunuz?
        <nuxt-link to="/forgot"  class="login-reset-password">Şifremi sıfırla</nuxt-link>
      </p>
    </div>
  </base-card>
</template>

<script setup>
import Swal from "sweetalert2";
import BaseCard from "~/components/cards/BaseCard.vue";
import HisbeLogo from "~/components/common/HisbeLogo.vue"
import CustomButton from "~/components/base/CustomButton.vue";
import CustomFormInput from "~/components/base/CustomFormInput.vue";
import {email, minLength, required} from "@vuelidate/validators";
import useValidate from "@vuelidate/core";


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
  email: '',
  password: '',
})

const formRules = computed(() => {
  return {
    email: { required,email},
    password: { required, minLength: minLength(6)}
  }
})

const rules = useValidate(formRules, inputForm)

const login = async () => {
  const reset = await rules.value.$validate()
  console.log(reset)
}


definePageMeta({
  layout: "background",
})

const postLogin = async () => {
  await $fetch('https://6468bc7260c8cb9a2cb0b347.mockapi.io/hisbe/login', {
    method: 'POST',
    body: inputForm,
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
  }).then((res) => {
    console.log(res)
    if (res.status === 200) {
      // eğer basarili ise tokenleri kaydet. ve anasayfa a yönlendir.
      // router.push('/')
      res.status(200).json(info.value)
      // sessionStorage.setItem('token', 'your_token_value');
    }
  }).catch((err) => {
    console.log(err, "sa bizim err")
  })
}

</script>


<style scoped>

.error{
  @apply
  text-error text-start flex w-full lg:w-10/12
}

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

.login-sign-up {
  @apply
  text-primary
}

.login-custom-form {
  @apply
  w-full lg:w-10/12
}

.login-button {
  @apply
  w-full flex justify-center
}

.login-custom-button {
  @apply
  w-full lg:w-10/12 mt-6
}

.login-reset-password {
  @apply
  text-primary
}
</style>
