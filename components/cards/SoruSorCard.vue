<template>
    <div class="soru-sor-container">
        <div class="soru-sor-container-icon">
            <Person/>
        </div>
        <textarea class="soru-sor-container-textarea"
                  placeholder="Sorunuz nedir?"/>
    </div>
</template>

<script setup>
import Person from "~/assets/person.svg";
</script>

<style scoped>
.soru-sor-container {
    @apply
    hidden lg:flex border
    border-gray-ikiyuz p-3  rounded-lg
}

.soru-sor-container-icon {
    @apply
    rounded-full border border-gray-yuz overflow-hidden
    w-14 flex items-end justify-center
}

.soru-sor-container-textarea {
    @apply
    h-12 w-full p-3 border-2
    border-gray rounded-lg
    outline-none border-none resize-none
}

::placeholder {
    @apply
    text-base font-light
}
</style>
