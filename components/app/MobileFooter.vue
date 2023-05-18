<template>
    <container class="mobile-footer">
        <nuxt-link class="mobile-footer-item" to="/kesfet">
            <Home/>
            Keşfet
        </nuxt-link>
        <nuxt-link to="/arama" class="mobile-footer-item">
            <Search/>
            Arama
        </nuxt-link>
        <nuxt-link to="/soru-sor">
            <more/>
        </nuxt-link>
        <nuxt-link class="mobile-footer-item" to="/haberler">
            <FlashLight class="w-5 h-5"/>
            Haberler
        </nuxt-link>
        <nuxt-link class="mobile-footer-item" to="/profile">
            <UserFill/>
            Profilim
        </nuxt-link>
    </container>
</template>

<script setup>
import Home from '~/assets/home-fill.svg'
import Search from '~/assets/search.svg'
import FlashLight from '~/assets/flash-light.svg'
import UserFill from '~/assets/user-fill.svg'
import More from '~/assets/more.svg'
import Container from "~/components/common/Container.vue"
</script>

<style scoped>
.mobile-footer {
    @apply
    flex lg:hidden justify-between
    sticky bottom-0 border-t items-center
    border-gray-yuz bg-white z-40
}

.mobile-footer-item {
    @apply
    flex flex-col items-center
    text-gray-besyuz p-2
}

.router-link-active {
    @apply
    flex items-center
    text-primary
}
</style>
