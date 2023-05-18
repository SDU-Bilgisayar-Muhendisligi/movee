<template>
    <div class="base-card" :class="[heightType,flexType,paddingSize,heightVH]">
        <slot/>
    </div>
</template>

<script setup>

defineProps({
    heightType: {
        type: String,
        default: "height-fit"
    },
    flexType: {
        type: String,
        default: "middle-col"
    },
    paddingSize: {
        type: String,
        default: "padding-y-20"
    },
    heightVH: {
        type: String,
        default: ""
    }
})

</script>



<style scoped>
.base-card {
    @apply
    lg:border border-gray-yuz lg:bg-white
    w-full lg:w-9/12 rounded-2xl

}

.height-fit {
    @apply lg:h-fit
}

.height-VH{
    @apply h-screen
}

.height-auto {
    @apply h-auto
}

.middle-col{
    @apply
    flex flex-col items-center justify-center
}

.middle-row{
    @apply
    flex justify-center
}

.between-row{
    @apply
    flex justify-between
}

.padding-y-20{
    @apply
    py-20
}


</style>
