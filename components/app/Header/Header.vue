<template>
  <header class="header">
    <container class="header-container">
      <nuxt-link to="/" class="w-1/5">
      </nuxt-link>
      <div class="header-container-searchbar" >
        <search @click="focus" class="header-container-searchbar-search-icon"/>
        <input @click="focus" id="input-text" type="text" v-model="searchText" @keyup.enter="handleEnter" class="header-container-searchbar-input" placeholder="Marka, ürün, servis ara...">
        <cross v-show="showModalSuggestion" @click="ignore"  class="text-gray-ucyuz"/>
        <header-suggestion v-show="showModalSuggestion"/>
      </div>
    </container>
  <div v-show="showModalSuggestion" class="kutu" @click="ignore"></div>
  </header>
</template>

<script setup>
import Hisbe from 'assets/hisbe.svg'
import Search from 'assets/search.svg'
import Container from "~/components/common/Container.vue";
import HeaderSuggestion from "~/components/app/Header/HeaderSuggestion.vue";
import Cross from "~/components/common/Cross.vue";

const route = useRoute()
const router = useRouter();
const showModalSuggestion = ref(false)

let searchText = ref('');

const handleEnter = () => {
  router.push(`/arama/${searchText.value}`);
};

watch(() => route.path,
    () => {
      const element = document.querySelector('body')
      element.classList.remove('overflow-hidden')
      if (route.path =='/arama') {
        showModalSuggestion.value = true
      } else {
        showModalSuggestion.value = false
      }
    })


const focus = () => {
  const element = document.querySelector('body')
  element.classList.add('overflow-hidden')
  element.classList.add('lg:overflow-auto')

  showModalSuggestion.value = true
}

const ignore = () => {
  showModalSuggestion.value = false
  const element = document.querySelector('body')
  const input = document.getElementById("input-text")
  searchText.value = input.value
  searchText.value = ''
  element.classList.remove('overflow-hidden')
  element.classList.remove('lg:overflow-auto')
}


</script>

<style scoped>
.header {
  @apply
  pt-6 lg:py-6 flex
  bg-white sticky top-0 z-40
  lg:border-b border-gray-ikiyuz
}

.header-container {
  @apply
  lg:flex items-center justify-between
}

.header-container-searchbar {
  z-index: 9999;
  @apply
  flex border-gray-ikiyuz
  border rounded-lg lg:relative
  w-full lg:w-[84%] xl:w-3/4
  py-2 px-2 items-center
}

.header-container-searchbar-search-icon {
  @apply
  text-gray-dark
}

.header-container-searchbar-input {
  @apply
  rounded-lg ml-3 outline-none grow
}


input::placeholder {
  @apply
  text-sm font-normal
  text-gray-dark
}

.kutu {
  @apply
  absolute lg:fixed w-full lg:top-0 right-0
  left-0 bottom-0 bg-none z-50
}
</style>
