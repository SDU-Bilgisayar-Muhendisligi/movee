<template>
    <div class="container-layout">
      <Header  class="!hidden lg:!flex"/>
        <main class="container-main">
            <SideBar/>
            <slot/>
        </main>
        <MobileFooter/>
    </div>
</template>
<script setup>
import SideBar from "~/components/app/Sidebar/SideBar.vue";
import Container from "~/components/common/Container.vue"
import MobileFooter from "~/components/app/MobileFooter.vue";
import MobileHeader from "~/components/app/Header/MobileHeader.vue";
import Header from "~/components/app/Header/Header.vue";
useHead({
  title: 'Movee',
})
</script>

<style scoped>
.hidden-header {
    @apply
    hidden lg:flex
}

.container-main {
    @apply
    lg:container lg:mx-auto grow lg:flex mt-0 lg:mt-10 mb-10  lg:mb-40
}

.container-layout {
    @apply
    flex flex-col justify-between lg:justify-start min-h-screen
}



</style>
