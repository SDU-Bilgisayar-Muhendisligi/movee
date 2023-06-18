<template>
  <header class="header">
    <container class="header-container">
      <nuxt-link to="/" class="w-1/5">
        <Hisbe class="hidden lg:flex"/>
      </nuxt-link>
      <div class="header-container-searchbar">
        <search @click="focus" class="header-container-searchbar-search-icon"/>
        <input @click="focus" id="input-text" type="text" v-model="slugg" @keyup.enter="handleEnter" autocomplete="off"
               class="header-container-searchbar-input" placeholder="Marka, ürün, servis ara...">
        <cross v-show="showModalSuggestion" @click="ignore" class="text-gray-ucyuz"/>
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
import Swal from "sweetalert2";

let route = useRoute()
let router = useRouter();
const showModalSuggestion = ref(false)
let slug = route.params.slug
let searchText = ref('');
const slugg = ref()

const handleEnter = () => {
  if (searchText.value == null) return
  router.push(`/arama/${slugg.value}`);
}
if(!slugg.value) {
  slugg.value = slug
}


watch(() => route.path,
    () => {
      const element = document.querySelector('body')
      element.classList.remove('overflow-hidden')

      if (route.path == '/arama')
        return showModalSuggestion.value = true
      showModalSuggestion.value = false

      console.log('route.path', route.path)
    })

watch(() => route.params.slug,
    () => {
      if (route.path == `/`) return

      if (route.path.includes(`/profile`)) return

      slug = route.params.slug
      if (!slug) return
      searchText.value = slug.find((item) => {
        if (route.path == `/`)
          return slugg.value = ''
        slugg.value = item.replace(/-/g, ' ')
      })
        return slugg.value
    })




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


const focus = () => {
  const element = document.querySelector('body')
  const input = document.querySelector(".header-container-searchbar-input")
  element.classList.add('overflow-hidden')
  element.classList.add('lg:overflow-auto')
  showModalSuggestion.value = true
  input.focus()
}

const ignore = () => {
  if (route.path == '/arama') {
    showModalSuggestion.value = true
  } else {
    showModalSuggestion.value = false
  }
  const element = document.querySelector('body')
  element.classList.remove('overflow-hidden')
  element.classList.remove('lg:overflow-auto')
}


</script>

<style scoped>
.header {
  @apply
  pt-6 lg:py-6 flex
  bg-white sticky top-0 z-10
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
  text-gray-dark w-5 h-5
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
