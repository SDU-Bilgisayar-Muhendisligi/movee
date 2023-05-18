<template>
  <div class="header-container-suggestion">
    <p class="text-gray-yediyuz font-semibold test-base mt-4 lg:mt-0">En Çok Aranılanlar</p>
    <p class="header-container-suggestion-item">Disney Plus <span class="header-container-suggestion-arrow"><arrow/></span>
    </p>
    <p class="header-container-suggestion-item">
      Call of Duty Warzone <span class="header-container-suggestion-arrow"><arrow/></span></p>
    <p class="header-container-suggestion-item">
      Kafalar <span class="header-container-suggestion-arrow"><arrow/></span></p>
    <p class="header-container-suggestion-item">
      Disney Plus <span class="header-container-suggestion-arrow"><arrow/></span></p>
    <p class="header-container-suggestion-item">
      Orkun Işıtmak <span class="header-container-suggestion-arrow"><arrow/></span></p>
    <p class="flex items-center w-full text-gray-dark font-normal text-sm py-2 cursor-pointer">Tumblr<span
        class="header-container-suggestion-arrow "><arrow/></span></p>
  </div>
</template>
<script setup>
import Arrow from "~/components/common/Arrow.vue";
</script>
<style scoped>
.header-container-suggestion {
  @apply
  absolute h-screen lg:h-fit w-full bg-white
  top-[100%] lg:top-[180%] p-2 px-4 lg:border right-0
  border-gray-ucyuz lg:rounded-lg left-0
}

.header-container-suggestion-item {
  @apply
  flex items-center w-full
  text-gray-dark font-normal
  text-sm py-2 border-b
  border-gray-yuz cursor-pointer
}

.header-container-suggestion-arrow {
  @apply
  flex grow justify-end
}

</style>
