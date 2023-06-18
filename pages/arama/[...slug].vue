<template>
  <div>
    <div v-show="route.path == `/arama/${slugString}`" class="flex p-4 lg:pt-0">
      <p>{{ slugg }} araması için 16 sonuç bulundu</p>
    </div>
    <p class="text-gray-yediyuz font-semibold text-sm px-3 my-4">Başlıklar (2)</p>
    <arama-baslik/>
    <div class="px-3 lg:px-0">
      <p class="text-gray-yediyuz font-semibold text-sm mt-6">İçerikler (14)</p>
      <arama-icerik/>
    </div>
  </div>
</template>

<script setup>
import AramaBaslik from "~/components/pages/AramaBaslik.vue";
import AramaIcerik from "~/components/pages/AramaIcerik.vue";

const route = useRoute()
let slug = route.params.slug



let slugString = ref('')

let slugg = ref()

if (route.path == `/arama/${slug}`) {

  slugString.value = slug.find((item) => {
    slugg.value = item.replace(/-/g, ' ')
    return slugg.value
  })
}


</script>

<style scoped>
::-webkit-scrollbar {
  width: 0;
  background: transparent;
}

</style>
