<template>
    <div class="custom-cevap">
        <nuxt-link to="/profile/cevaplananlar" class="custom-cevap-link rounded-l-lg" >
            <p>Cevaplananlar (3)</p>
        </nuxt-link>

        <nuxt-link class="custom-cevap-link rounded-r-lg" to="/profile/cevaplanmayanlar">
            <p>Cevaplanmamış (3)</p>
        </nuxt-link>
    </div>
</template>

<script setup>

const route = useRoute()


</script>


<style scoped>
.custom-cevap{
    @apply
    flex lg:hidden justify-between items-center border
    border-gray-ikiyuz rounded-lg mt-8 bg-white
}

.custom-cevap-link{
    @apply
    text-gray-besyuz font-medium p-2
    text-sm w-full text-center bg-white
}

.router-link-active{
    @apply
    text-primary bg-gray-elli
}
</style>
