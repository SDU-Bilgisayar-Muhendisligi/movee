<template>
    <div class="container-layout">
        <!--        <img src="/bg-slider.png" class="image" alt="">-->
        <div class="blur absolute w-full"></div>
        <MobileHeader/>
        <container class="container-main">
            <SideBar/>
            <slot/>
        </container>
        <MobileFooter/>
    </div>
</template>
<script setup>
import SideBar from "~/components/app/Sidebar/SideBar.vue";
import Container from "~/components/common/Container.vue"
import MobileFooter from "~/components/app/MobileFooter.vue";
import MobileHeader from "~/components/app/Header/MobileHeader.vue";
import BackgrounImage from "~/components/common/BackgrounImage.vue";
useHead({
  title: 'Movee',
})
</script>

<style scoped>



::-webkit-scrollbar {
    width: 0;
    background: transparent;
}

.container-main {
    @apply
    lg:grow lg:flex mt-4 lg:mt-10
}

.container-layout {
    @apply
    flex flex-col justify-between
    lg:justify-start min-h-screen
    bg-none lg:bg-gray-elli
}

.circle-progress__svg {
    @apply
    w-6 h-6
}

.image {
    @apply
    w-full absolute right-0 top-0 -z-10 lg:hidden
}

.blur {
    filter: blur(30px);
    background: linear-gradient(90deg, rgba(78, 75, 223, 1) 0%, rgba(255, 153, 74, 1), rgba(61, 212, 157, 1) 100%);
    @apply
    opacity-30 h-2/6 -top-[10px] -z-10 lg:hidden
}

</style>
