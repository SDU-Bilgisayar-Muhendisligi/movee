<template>
  <swiper
      :breakpoints="{300:{slidesPerView:1.5},350:{slidesPerView:2.6}, 480:{ slidesPerView:3.5 }, 600:{ slidesPerView:4.4 }, 780:{ slidesPerView:5.5 } }"
      :spaceBetween="10"
      :initial-slide="2"
      :autoplay="{delay: 2500,disableOnInteraction: false,}"
      :pagination="{ clickable: true }"
      :loop="true"
  >
    <img v-lazy="{src: lazyOptions.src, lifecycle: lazyOptions.lifecycle}" width="100">

    <swiper-slide v-for="merakEdilen in merakEdilenler" :key="merakEdilen.id">
      <div class="swiper-slide-content">
        <img class="image" src="/bg-slider.png" alt="">
        <img :src="merakEdilen.img" :alt="merakEdilen.img">
        <nuxt-link :to="`/cevaplananlar/${merakEdilen.slug}`" class="icerik-mobile-slider-title">{{
            merakEdilen.baslik
          }}
        </nuxt-link>
        <p class="text-gray-besyuz font-normal text-xs">{{ merakEdilen.icerik }}</p>
        <slider-vote-merak-edilen :merakEdilen="merakEdilen" gorunum="ust-uste"/>
      </div>
    </swiper-slide>
  </swiper>
</template>

<script setup>
import {Swiper, SwiperSlide} from 'swiper/vue';
import {Pagination} from 'swiper';
import 'swiper/css';
import 'swiper/css/pagination';
import SliderVoteMerakEdilen from "~/components/base/SliderVoteMerakEdilen.vue";
import VueLazyLoad from 'vue3-lazyload'
const modules = [Pagination]
const lazyOptions = reactive({
  src: '/img.png',
  lifecycle: {
    loading: (el) => {
      console.log('image loading', el)
    },
    error: (el) => {
      console.log('image error', el)
    },
    loaded: (el) => {
      console.log('image loaded', el)
    }
  }
})
const merakEdilenler = ref([
  {
    id: 1,
    img: '/snapchat.png',
    slug: 'snapchat',
    baslik: "Snapchat",
    icerik: "Marka • 2 İçerik",
    voteHisbe: 8,
    voteUser: 10,
    max: 10,
    hisbe: 'İyi',
    kullanicilar: 'Normal'
  },
  {
    id: 2,
    img: '/img.png',
    slug: 'netflix',
    baslik: "Netflix",
    icerik: "Site • 2 İçerik",
    voteHisbe: 2,
    voteUser: 1,
    max: 10,
    hisbe: 'Çok Kötü',
    kullanicilar: 'Kötü'
  },
  {
    id: 3,
    img: '/enes-batur.png',
    slug: 'enes-batur',
    baslik: "Enes Batur",
    icerik: "Kişi • 2 İçerik",
    voteHisbe: 9,
    voteUser: 7,
    max: 10,
    hisbe: 'Çok Kötü',
    kullanicilar: 'Normal'
  },

  {
    id: 4,
    img: '/huggy-wuggy.png',
    slug: 'huggy-wuggy',
    baslik: "Huggy Wuggy",
    icerik: "Oyuncak • 1 İçerik",
    voteHisbe: 1,
    voteUser: 2,
    max: 10,
    hisbe: 'Çok Kötü',
    kullanicilar: 'Çok Kötü'
  },
  {
    id: 5,
    img: '/youtube-kids.png',
    slug: 'youtube-kids',
    baslik: "Youtube Kids",
    icerik: "Site • 2 İçerik",
    voteHisbe: 2,
    voteUser: 1,
    max: 10,
    hisbe: 'Çok Kötü',
    kullanicilar: 'Kötü'
  },
  {
    id: 6,
    img: '/twitch-kids.png',
    slug: 'twitch-kids',
    baslik: "Twitch Kids",
    icerik: "Marka • 2 İçerik",
    voteHisbe: 5,
    voteUser: 7,
    max: 10,
    hisbe: 'Normal',
    kullanicilar: 'İyi'
  }
])


</script>

<style scoped>
.image {
  @apply
  bg-contain bg-no-repeat sm:bg-cover w-full
  absolute right-0 left-0 -z-50 rounded-2xl
}

.swiper {
  width: 100%;
  @apply
  flex lg:hidden
}

.swiper-slide {
  flex-shrink: 0;
  display: flex;
  padding-left: 12px;
}


.swiper-slide-content {
  @apply
  flex flex-col items-center
  border border-gray-yuz rounded-2xl
  relative px-1 w-full
}

.icerik-mobile-slider-title {
  @apply
  text-gray-yediyuz font-semibold text-sm
}

.icerik-mobile-slider-title:before {
  content: "";
  @apply
  absolute top-0 left-0
  right-0 bottom-0 transition-all
}


</style>
