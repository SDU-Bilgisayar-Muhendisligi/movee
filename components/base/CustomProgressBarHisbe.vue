<template>
  <CircleProgressBar class="custom-vote-progress"
                     :class="dynmcClass"
                     :value="voteHisbe"
                     :max="max"
                     :strokeWidth="'10'"
                     :colorUnfilled="`${ colorUnfilled}`"
                     color-filled="#4E4BDF"
                     rounded>
    {{ voteHisbe }}
  </CircleProgressBar>
</template>

<script setup>
import {CircleProgressBar} from "vue3-m-circle-progress-bar";

const props = defineProps({
  voteHisbe: Number,
  max: Number,
})

const colorUnfilled = props.voteHisbe > 0 && props.voteHisbe < 5 ? '#D64545' : props.voteHisbe >= 5 && props.voteHisbe < 6  ? '#334053'  :  props.voteHisbe < 10 ? '#FF994A' :''
const dynmcClass = props.voteHisbe > 0 && props.voteHisbe < 5 ? 'text-red' : props.voteHisbe >= 5 && props.voteHisbe < 6  ? 'text-gray-yediyuz'  :  props.voteHisbe < 10 ? 'text-orange' : props.voteHisbe == 10  ? 'text-primary' :''

</script>

<style scoped>
.custom-vote-progress {
  @apply
  text-xs w-full
}
.circle-progress__svg {
  @apply
  w-6 h-6
}

</style>
