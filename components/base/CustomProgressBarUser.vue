<template>
    <CircleProgressBar class="custom-vote-progress"
                       :class="dynmcClass"
                       :value="voteUser"
                       :max="max"
                       :strokeWidth="'10'"
                       :colorUnfilled="`${colorUnfilled}`"
                       color-filled="#4E4BDF"
                       rounded>
        {{ voteUser }}
    </CircleProgressBar>
</template>

<script setup>
import {CircleProgressBar} from "vue3-m-circle-progress-bar";

const props = defineProps({
    voteUser: Number,
    max: Number,
})

const colorUnfilled = props.voteUser > 0 && props.voteUser < 5 ? '#D64545' : props.voteUser >= 5 && props.voteUser < 6 ? '#334053' : props.voteUser < 10 ? '#FF994A' : ''
const dynmcClass = props.voteUser > 0 && props.voteUser < 5 ? 'text-red' : props.voteUser >= 5 && props.voteUser < 6 ? 'text-gray-yediyuz' : props.voteUser < 10 ? 'text-orange' : props.voteUser == 10 ? 'text-primary' : ''

</script>

<style>
.custom-vote-progress {
    width: 24px !important;
    height: 24px !important;
    @apply
    text-xs
}

.circle-progress__svg {
    width: 24px !important;
    height: 24px !important;
}

.circle-progress {
    width: 24px !important;
    height: 24px !important;

}

.circle-progress__content {
    width: 24px !important;
    height: 24px !important;
}


::-webkit-scrollbar {
    width: 0;
    background: transparent;
}
</style>
