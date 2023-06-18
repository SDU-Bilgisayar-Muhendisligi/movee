<template>
  <base-card flex-type="middle-row">
    <div class="signup">
      <HisbeLogo/>
      <p class="signup-kaydol">Kaydol</p>
      <p class="signup-soru">Zaten üye misiniz?
        <nuxt-link to="/login" class="text-primary"> Giriş yapın</nuxt-link>
      </p>
      <custom-form-input class="signup-custom-form" v-model:value="inputForm.name" label="Adınız soyadınız" type="text"
                         placeholder="Adınız soyadınız"/>
      <span v-for="error in rules.name.$errors" class="error">{{ error.$message }}</span>
      <custom-form-input class="signup-custom-form" v-model:value="inputForm.email" label="E-mail"
                         placeholder="E-posta adresiniz" type="email"/>
      <span v-for="error in rules.email.$errors" class="error">{{ error.$message }}</span>
      <custom-form-input class="signup-custom-form" v-model:value="inputForm.password" label="Şifreniz"
                         placeholder="Şifreniz"/>
      <span v-for="error in rules.password.$errors" class="error">{{ error.$message }}</span>
      <custom-button @click="signup" class="signup-custom-button">Kaydol</custom-button>
    </div>
  </base-card>
</template>

<script setup>
import Swal from "sweetalert2";
import HisbeLogo from "~/components/common/HisbeLogo.vue"
import BaseCard from "~/components/cards/BaseCard.vue";
import CustomButton from "~/components/base/CustomButton.vue";
import CustomFormInput from "~/components/base/CustomFormInput.vue";
import {email, minLength, required, sameAs} from "@vuelidate/validators";
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


definePageMeta({
  layout: "background"
})
const inputForm = ref({
  name: '',
  email: '',
  password: '',
})

const formRules = computed(() => {
  return {
    name: {required, minLength: minLength(3)},
    email: {required,email},
    password: {required, minLength: minLength(6)},
  }
})

const rules = useValidate(formRules, inputForm)

const signup = async () => {
  const reset = await rules.value.$validate()
  console.log(reset)
}

const postSignUp = async (data) => {
  await $fetch('/api/cevaplanmayanlar', {
    method: 'POST',
    body: inputForm,
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

.signup-custom-button {
  @apply
  w-full lg:w-10/12 mt-6
}
.error {
  @apply
  text-error w-full lg:w-10/12 flex text-start
}
</style>
