<template>
    <footer class="mobile-footer">
        <nuxt-link class="mobile-footer-item" to="/">
            <Home class="mobile-footer-icon"/>
            Keşfet
        </nuxt-link>
        <nuxt-link to="/arama" class="mobile-footer-item">
            <Search class="mobile-footer-icon"/>
            Arama
        </nuxt-link>
        <nuxt-link to="/soru-sor">
            <more class="w-16 sm:w-20"/>
        </nuxt-link>
        <nuxt-link class="mobile-footer-item" to="/haberler">
            <FlashLight class="mobile-footer-icon"/>
            Haberler
        </nuxt-link>
        <nuxt-link class="mobile-footer-item" to="/profile">
            <UserFill class="mobile-footer-icon"/>
            Profilim
        </nuxt-link>
    </footer>
</template>

<script setup>
import Home from '~/assets/home-fill.svg'
import Search from '~/assets/search.svg'
import FlashLight from '~/assets/flash-light.svg'
import UserFill from '~/assets/user-fill.svg'
// import More from '~/assets/more.svg'
import Container from "~/components/common/Container.vue"
import More from "~/components/common/More.vue";
import {useRoute} from "#app";

</script>

<style scoped>
.mobile-footer {
  z-index: 9;
    @apply
    flex lg:hidden justify-between
    sticky bottom-0 border-t items-center
    border-gray-yuz bg-white p-2 font-light
}

.mobile-footer-item {
    @apply
    flex flex-col justify-center items-center
    text-gray-dortyuz sm:p-2 self-center
}

.mobile-footer-icon{
    @apply
    w-5 h-5
}

@media screen and (max-width: 320px) {
  .mobile-footer{
    @apply
    p-1
  }
  .mobile-footer-icon {
    @apply
    w-4 h-4
  }
}

.router-link-active {
    @apply
    flex items-center
    text-primary
}
</style>
