<template>
  <div class="detay-container">
    <div v-if="merakEdilen" class="">
      <custom-platform-detay :merak-edilen="merakEdilen"/>
      <div>
        <p class="detay-container-banner">İçerikler (3)</p>
        <arama-icerik/>
      </div>
    </div>
    <div v-if="cevaplanan">
      <custom-oyun-platform :cevaplanan="cevaplanan"/>
    </div>
  </div>
</template>

<script setup>
import CustomPlatformDetay from "~/components/base/CustomPlatformDetay.vue";
import AramaIcerik from "~/components/pages/AramaIcerik.vue";
import CustomOyunPlatform from "~/components/base/CustomFoodGame.vue";

definePageMeta({
  layout: "temiz",
});





const cevaplananlar = ref([
  {
    id: 1,
    img: '/friday-game.png',
    slug: 'friday-the-13th-the-game',
    baslik: "Friday the 13th: The Game",
    icerik: "Oyun • 1 İçerik",
    soru: "Friday the 13th: The Game Çocuklar için bir tehdit oluşturuyor mu?",
    soruDetay: "Oyunu incelediğimizde özellikle 8 yaş altı çocuklarda epilepsi krizine sebep olduğu yap...",
    zarar:"Oyunu incelediğimizde özellikle 8 yaş altı çocuklarda epilepsi krizine sebep olduğu yapılan araştırmalarca doğrulanmıştır. ",
    anlatimBir:"Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır.\n" + "\n" + "1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
    anlatimİki:"Yaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır.\n" + "Virginia'daki Hampden-Sydney College'dan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan 'consectetur' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır.",
    voteHisbe: 8,
    voteUser: 10,
    date:"15 Mart 2023",
    max: 10,
    hisbe: 'İyi',
    kullanicilar: 'Normal'
  },
  {
    id: 2,
    img: '/haribo.png',
    slug: 'haribo',
    baslik: "Haribo",
    icerik: "Yiyecek • 1 İçerik",
    soru: "Sağlığa zararlı mı?",
    soruDetay: "Hayır. Haribo’nun içeriğine baktığımızda herhangi bir katkı maddesine rastlanmamıştır...",
    zarar:"Hayır. Haribo’nun içeriğine baktığımızda herhangi bir katkı maddesine rastlanmamıştır. ",
    anlatimBir:"Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır.\n" + "\n" + "1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
    anlatimİki:"Yaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır.\n" + "Virginia'daki Hampden-Sydney College'dan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan 'consectetur' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır.",
    voteHisbe: 2,
    voteUser: 1,
    date:"15 Mart 2023",
    max: 10,
    hisbe: 'Çok Kötü',
    kullanicilar: 'Kötü'
  },
  {
    id: 3,
    img: '/huggy-wuggy.png',
    slug: 'huggy-wuggy',
    baslik: "Huggy Wuggy",
    icerik: "Oyun • 1 İçerik",
    soru: "",
    soruDetay: "Bu oyuncak çocuklarda zeka geriliğine sebep olmakla birlikte, çocuklara çeşitli görevler ver...",
    zarar:"Bu oyuncak çocuklarda zeka geriliğine sebep olmakla birlikte, çocuklara çeşitli görevler vererek onları kötü yola sürüklemektedir. ",
    anlatimBir:"Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır.\n" + "\n" + "1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
    anlatimİki:"Yaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır.\n" + "Virginia'daki Hampden-Sydney College'dan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan 'consectetur' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır.",
    voteHisbe: 9,
    voteUser: 7,
    date:"15 Mart 2023",
    max: 10,
    hisbe: 'Çok Kötü',
    kullanicilar: 'Normal'
  },
])
const merakEdilenler = ref([
  {
    id: 1,
    img: '/img.png',
    slug: 'netflix',
    baslik: "Netflix",
    icerik: "Site • 2 İçerik",
    uzunAciklama: "YouTube Kids, Google'ın bir yan kuruluşu olan YouTube tarafından geliştirilen bir çocuk video uygulamasıdır. Uygulama, çocuklara yönelik hizmetin bir sürümünü sunar.",
    voteHisbe: 2,
    voteUser: 1,
    max: 10,
    hisbe: 'Çok Kötü',
    kullanicilar: 'Kötü'
  },
  {
    id: 2,
    img: '/youtube-kids.png',
    slug: 'youtube-kids',
    baslik: "Youtube Kids",
    icerik: "Marka • 2 İçerik",
    uzunAciklama: "YouTube Kids, Google'ın bir yan kuruluşu olan YouTube tarafından geliştirilen bir çocuk video uygulamasıdır. Uygulama, çocuklara yönelik hizmetin bir sürümünü sunar.",
    voteHisbe: 2,
    voteUser: 1,
    max: 10,
    hisbe: 'Çok Kötü',
    kullanicilar: 'Kötü'
  },

])
const merakEdilen = ref()
const cevaplanan = ref()
const route = useRoute()


for (let i = 0; i < cevaplananlar.value.length; i++) {
  if (cevaplananlar.value[i].slug == route.params.slug) {
    cevaplanan.value = cevaplananlar.value[i]
  }
}


for (let i = 0; i < merakEdilenler.value.length; i++) {
  if (merakEdilenler.value[i].slug == route.params.slug) {
    merakEdilen.value = merakEdilenler.value[i]
  }
}




</script>

<style scoped>

.detay-container {
  @apply
  flex flex-col lg:w-10/12 xl:w-3/4
}

.detay-container-banner {
  @apply
  text-gray-yediyuz font-semibold text-sm mt-8
}


</style>
