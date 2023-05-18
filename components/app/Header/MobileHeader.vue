<template>
  <header class="header">
    <container class="header-container">
      <nuxt-link to="/" class="w-1/5">
        <Hisbe class="hidden lg:flex"/>
      </nuxt-link>
      <div class="header-container-searchbar">
        <search @click="focus" class="header-container-searchbar-search-icon"/>
        <input id="input-text" @click="focus" type="text" @keyup.enter="handleEnter" v-model="searchText" class="header-container-searchbar-input"
               placeholder="Marka, ürün, servis ara...">
        <cross v-show="showModalSuggestion" @click="ignore"  class="header-container-cross-icon"/>
        <header-suggestion v-show="showModalSuggestion"/>
      </div>
    </container>
    <div v-show="showModalSuggestion" class="kutu" @click="ignore"></div>
  </header>
</template>

<script setup>
import Hisbe from '~/assets/hisbe.svg'
import Search from '~/assets/search.svg'
import Container from "~/components/common/Container.vue";
import HeaderSuggestion from "~/components/app/Header/HeaderSuggestion.vue";
import Cross from "~/components/common/Cross.vue";

const route = useRoute()
const showModalSuggestion = ref(false)

const router = useRouter();

let searchText = ref('');

const handleEnter = () => {
  router.push(`/arama/${searchText.value}`);
};

watch(() => route.path,
    () => {
      const element = document.querySelector('body')
      element.classList.remove('overflow-hidden')
    })


const focus = () => {
  const input = document.querySelector(".header-container-searchbar-input")
  const element = document.querySelector('body')
  element.classList.add('overflow-hidden')
  showModalSuggestion.value = true
  input.focus()
}

const ignore = () => {
  showModalSuggestion.value = false
  const element = document.querySelector('body')
  const input = document.getElementById("input-text")
  searchText.value = input.value
  searchText.value = ''
  element.classList.remove('overflow-hidden')
}
</script>

<style scoped>
.header {
  @apply
  py-6 hidden lg:flex bg-white
  sticky top-0 z-40
  border-b border-gray-ikiyuz
}

.header-container {
  @apply
  lg:flex items-center justify-between
}

.header-container-searchbar {
  z-index: 9999;
  @apply
  flex justify-between border-gray-ikiyuz
  border rounded-lg
  w-full lg:w-[84%]
  xl:w-3/4 py-2 px-2
  items-center relative
}

.header-container-searchbar-search-icon {
  @apply
  text-gray-dark
}

.header-container-searchbar-input {
  @apply
  rounded-lg ml-3
  outline-none grow
}

.header-container-cross-icon {
  @apply
  flex self-center text-gray-ucyuz
}

input::placeholder {
  @apply
  text-sm font-normal
  text-gray-dark
}

.kutu {
  @apply
  fixed w-full top-0 right-0
  left-0 bottom-0 bg-none z-50
}
</style>
