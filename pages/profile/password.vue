<template>
  <base-card height-type="height-auto" flex-type="between-row" padding-size="p-0">
    <div class="profile-container">
      <profile-side-bar class="wow"/>
      <div class="w-full">
        <div class="lg:px-4">
          <div class="flex lg:hidden">
            <custom-geri-tusu class="!top-10 !left-5"/>
            <p class="profile-change-password">Şifremi değiştir</p>
          </div>
          <custom-form-input label="Mevcut şifreniz" placeholder="" type="password"/>
          <custom-form-input v-model:value="inputForm.password" label="Yeni şifreniz" placeholder="Şifreniz" type="password"/>
           <span v-for="error in rules.password.$errors" class="text-error">{{error.$message}}</span>
          <custom-form-input v-model:value="inputForm.password_confirmation" label="Yeni şifreniz (tekrar)" placeholder="Şifreniz" type="password"/>
          <span v-for="error in rules.password_confirmation.$error" class="text-error">{{error.$message}}</span>
          <custom-button @click="change_password"  bg-color="bg-purple-text-white" class="custom-button">Güncelle</custom-button>
        </div>
      </div>
    </div>
  </base-card>
</template>

<script setup>
import BaseCard from "~/components/cards/BaseCard.vue";
import ProfileSideBar from "~/components/app/Sidebar/ProfileSideBar.vue";
import CustomFormInput from "~/components/base/CustomFormInput.vue";
import CustomGeriTusu from "~/components/base/CustomGeriTusu.vue";
import Swal from "sweetalert2";
import {minLength, required, sameAs} from "@vuelidate/validators";
import useValidate from "@vuelidate/core";
import CustomButton from "~/components/base/CustomButton.vue";

definePageMeta({
  layout: "background"
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

const change_password = async () => {
  const reset = await rules.value.$validate()
  console.log(reset)
}

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


const postPassword = async () => {
  await $fetch('localhost:3000', {
    method: 'POST',
    body: JSON.stringify({
      password: 'enesaktas',
      newPassword: '',
      newPasswordAgain: ''
    }),
    headers: {
      'Content-Type': 'application/json'
    }
  }).then(async res => {
    if (res.error.value) {
      Toast.fire("Hata!", "Tekrar Deneyiniz", "error");
      return
    }
    //Todo: password kontrolu yapilacak
  })
}

</script>

<style scoped>
.profile-container {
  @apply
  flex justify-between w-full
}

.profile-change-password {
  @apply
  mt-9 flex w-full justify-center
  text-gray-yediyuz font-normal text-base
}

.custom-button {
  @apply
  w-full mt-6
}


input[type="password"] {
  content: '✦ ✦ ✦ ✦ ✦ ✦ ✦ ✦ ✦ ✦';
  width: 200px;
  height: 30px;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.wow {
  display: none !important
}

@media (min-width: 1024px) {
  .wow {
    display: block !important
  }
}

</style>
