<template>
  <div class="sidebar">
    <div class="sidebar-sticky">
      <nuxt-link to="/" class="sidebar-item">
        <HomeFill class="sidebar-icon"/>
        Keşfet
      </nuxt-link>
      <nuxt-link to="/haberler" class="sidebar-item">
        <FlashLight class="sidebar-icon"/>
        Haberler
      </nuxt-link>
      <nuxt-link to="/profile" class="sidebar-item">
        <UserFill class="sidebar-icon"/>
        Profilim
      </nuxt-link>
      <nuxt-link to="/soru-sor" class="back-none">
        <custom-button class="sidebar-button">Soru Sor</custom-button>
      </nuxt-link>
    </div>
  </div>
</template>

<script setup>
import HomeFill from 'assets/home-fill.svg'
import FlashLight from 'assets/flash-light.svg'
import UserFill from 'assets/user-fill.svg'
import CustomButton from "~/components/base/CustomButton.vue";


</script>

<!--router link active class yüzünden soru sor butonu bg geliyodu o yüzden important kullandım-->
<style scoped>
.back-none {
  background: none !important;
  padding: 0 !important;
}

.sidebar {
  @apply
  hidden lg:flex flex-col  lg:w-1/5 xl:w-1/4
}

.sidebar-item {
  @apply
  flex items-center w-11/12
  text-gray-besyuz p-3 rounded-lg
}

.sidebar-sticky {
  @apply
  sticky top-[131px]
}

.sidebar-icon {
  @apply
  w-5 h-5 mr-2
}

.sidebar-button {
  @apply
  w-11/12 mt-4
}

.router-link-active {
  @apply
  flex items-center p-3
  text-primary bg-gray-yuz
}
</style>
