<template>
  <div class="container-layout">
    <Header />
    <main class="container-main">
      <SideBar/>
      <slot/>
    </main>
    <MobileFooter/>
  </div>
</template>
<script setup>
import Header from '~/components/app/Header/Header.vue'
import SideBar from "~/components/app/Sidebar/SideBar.vue";
import Container from "~/components/common/Container.vue"
import MobileFooter from "~/components/app/MobileFooter.vue";


useHead({
  title: 'Movee',
})

</script>

<style scoped>
.container-main {
  @apply
  lg:container lg:mx-auto grow lg:flex mt-4 lg:mt-10 mb-10  lg:mb-40
}

.container-layout::-webkit-scrollbar {
  @apply
  hidden
}

.container-layout {
  @apply bg-white
  flex flex-col justify-between
  lg:justify-start min-h-screen
}
</style>
