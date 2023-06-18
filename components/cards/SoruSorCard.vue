<template>
  <div @click="isLogin" class="soru-sor-container">
    <div class="soru-sor-container-icon">
      <Person/>
    </div>
    <textarea class="soru-sor-container-textarea" v-model="soru" @keydown.enter.prevent  autocomplete="off"
              placeholder="Sorunuz nedir?" @keydown.enter="handleEnterKey" @input="soru = $event.target.value"/>
  </div>
</template>

<script setup>
import Person from "~/assets/person.svg";

const soru = ref('');
const router = useRouter()
const {data: cevaplananlar} = await useFetch('https://run.mocky.io/v3/cd4be94b-93ae-42b6-b899-b98a755d0356')
//Todo: sweetalert eklenecek

const isLogin = () =>{
  if (localStorage.getItem('token')){
    return true
  }
  router.push('/login')
  return false
}
const handleEnterKey = async () => {
  await $fetch('https://run.mocky.io/v3/cd4be94b-93ae-42b6-b899-b98a755d0356', {
    method: 'POST',
    body: soru.value,
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
  }).then(res => {
    console.log(cevaplananlar.value)
    if (res.status == 200) {
      console.log('girdi')
      location.reload()
    }
  }).catch(err => console.log(err))
};


</script>

<style scoped>
.soru-sor-container {
  @apply
  hidden lg:flex border
  border-gray-ikiyuz p-3  rounded-lg
}

.soru-sor-container-icon {
  @apply
  rounded-full border border-gray-yuz overflow-hidden
  w-14 flex items-end justify-center
}

.soru-sor-container-textarea {
  @apply
  h-12 w-full p-3 border-2
  border-gray rounded-lg
  outline-none border-none resize-none
}

::placeholder {
  @apply
  text-base font-light
}
</style>
