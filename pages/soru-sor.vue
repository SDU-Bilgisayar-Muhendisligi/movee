<template>
  <base-card height-v-h="h-screen" flex-type="middle-col" height-type="height-fit" padding-size="py-20 lg:px-16">
    <div class="soru-sor-container" v-show="!show">
      <p class="soru-sor-question">Soru Sorun</p>
      <p class="soru-soru-description">En hızlı şekilde sorduğunuz soruları yanıtlamaya çalışacağız.</p>
      <custom-form-input v-model:value="inputForm.question" label="Soru Başlığı" class="w-full" placeholder="Soru Başlığı"/>
      <custom-form-text-area label="Sorunuz" class="w-full"/>
      <p class="text-gray-yediyuz font-semibold text-sm mt-6">Kategori</p>
      <!--           Todo: select tagi component yapilacak-->
      <select name="cars" id="cars"
              class="bg-white border border-gray-ikiyuz outline-none w-full mt-2 h-12 rounded-lg px-3">
        <option value="volvo" class="text-gray-besyuz font-normal text-sm">Ürün / Hizmet</option>
        <option value="saab">Saab</option>
        <option value="mercedes">Mercedes</option>
        <option value="audi">Audi</option>
      </select>
      <custom-button class="soru-sor-button" @click="showCheck">Gönder</custom-button>
    </div>
    <check v-show="show"/>
  </base-card>
</template>


<script setup>
import BaseCard from "~/components/cards/BaseCard.vue";

import CustomFormInput from "~/components/base/CustomFormInput.vue";
import CustomFormTextArea from "~/components/base/CustomFormTextArea.vue";
import CustomButton from "~/components/base/CustomButton.vue";
import Check from "~/components/base/Check.vue";
import BackgrounImage from "~/components/common/BackgrounImage.vue";
import Swal from "sweetalert2";
import {minLength, required} from "@vuelidate/validators";
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
  question: '',
})

const formRules = computed(() => {
  return {
    question: {required,},
  }
})

const rules = useValidate(formRules, inputForm)

definePageMeta({
  layout: "background",
})

const show = ref(false)

const showCheck = async () => {
  const reset = await rules.value.$validate()
  console.log(reset)
  show.value = !show.value
  window.scrollTo(0, 0);
}

const postSoru = async (data) => {
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
.soru-sor-container {
  @apply
  flex flex-col items-start justify-center
}

.soru-sor-question {
  @apply
  text-gray-yediyuz font-semibold text-lg
}

.soru-soru-description {
  @apply
  text-gray-besyuz font-normal text-sm mt-2
}

.soru-sor-button {
  @apply
  w-full mt-6 cursor-pointer
}

::-webkit-scrollbar {
  width: 0;
  background: transparent;
}
</style>
