<template>
  <base-card height-type="height-auto" flex-type="between-row" padding-size="p-0">
    <div class="profile-container">
      <profile-side-bar class="wow"/>
      <div class="w-full">
        <div class="lg:px-4">
          <custom-geri-tusu class="!top-10 !left-5"/>
          <p class="mt-9 flex lg:hidden w-full justify-center text-gray-yediyuz font-normal text-base">Profil
            Bilgilerim</p>
          <custom-form-input v-model:value="inputForm.name" label="Adınız soyadınız" placeholder="Enes Aktaş"/>
          <span v-for="error in rules.name.$errors" class="text-error">{{error.$message}}</span>
          <custom-form-input v-model:value="inputForm.email"  label="E-posta" placeholder="hi@enes.one" type="email"/>
          <span v-for="error in rules.email.$errors" class="text-error">Geçerli bir e-posta girin</span>
          <custom-button @click="change_info" bg-color="bg-purple-text-white" class="custom-button">Güncelle</custom-button>
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
import BackgrounImage from "~/components/common/BackgrounImage.vue";
import Swal from "sweetalert2";
import CustomButton from "~/components/base/CustomButton.vue";
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

const inputForm = ref({
  name: '',
  email: '',
})

const formRules = computed(() => {
  return {
    name: {required, minLength: minLength(3)},
    email: {required,email},
  }
})

const rules = useValidate(formRules, inputForm)

const change_info = async () => {
  const reset = await rules.value.$validate()
  console.log(reset)
}



definePageMeta({
  layout: "background"
})

const getInfo = async () => {
  await $fetch('/localhost:3000', {
    method: 'GET',
    body: JSON.stringify({
      name: 'enes',
      surname: 'aktas',
      email: 'hi@enes.info'
    }),
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
.profile-container {
  @apply
  flex justify-between w-full
}

.custom-button {
  @apply
  w-full mt-6
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
