<template>
    <div class="container-layout">
            <MobileHeader/>
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
useHead({
  title: 'Hisbe',
})
</script>

<style scoped>
.hidden-header {
    @apply
    hidden lg:flex
}

.container-main {
    @apply
    lg:container lg:mx-auto grow lg:flex mt-0 lg:mt-10
}

.container-layout {
    @apply
    flex flex-col justify-between lg:justify-start min-h-screen
}



</style>
