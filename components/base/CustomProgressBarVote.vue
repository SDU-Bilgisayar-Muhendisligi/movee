<template>
    <div class="progress-bar">
        <div class="progress-input" :class="dynmcClass" :style="{ width: progressWidth }">
            <input type="range" class="absolute" v-model="progress" :max="max"/>
        </div>
        <div class="progress-bar-detay" >
            <div class="progress-bar-bottom-bar" v-for="i in arr" :key="i">
                <p class="w-[1px] h-[10px] bg-gray-yuz"></p>
                <p class="progress-bottom-bar-index">{{ i }}</p>
            </div>
        </div>
    </div>
</template>

<script setup>
import svgCode from '~/assets/dragSvg'

const progress = ref(0)
const max = ref(10)
const progressWidth = ref('0%')
const dynmcClass = ref()
const arr = ref([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

watch(progress, () => {
    progressWidth.value = `${(progress.value / max.value) * 100}%`
    switch (true) {
        case progress.value < 5:
            dynmcClass.value = 'bg-red';
            break;
        case progress.value >= 5 && progress.value <= 7:
            dynmcClass.value = 'bg-orange';
            break;
        case progress.value <= 10:
            dynmcClass.value = 'bg-primary';
            break;
        default:
            dynmcClass.value = '';
            break;
    }
    const p = document.querySelectorAll('.progress-bottom-bar-index')
    const text = []
    text.push(p)
    text.map((item) => {
            item.forEach((i) => {
                if (progress.value == i.innerText) {
                    i.classList.add('!text-primary')
                } else {
                    i.classList.remove('!text-primary')
                }
            })
        }
    )
})


const base64Svg = btoa(svgCode);
// const dataUrl = `data:image/svg+xml;base64,${base64Svg}`;


</script>

<style scoped>
.progress-bar {
    @apply
    bg-gray-yuz w-full h-3 rounded-lg
    outline-none mt-8 relative
}

.progress-input {
    @apply
    h-full rounded-lg flex items-center
}

.progress-bar-detay{
    @apply
    flex px-[10%] gap-[9%] lg:gap-[10%]
}

input[type="range"] {
    -webkit-appearance: none;
    appearance: none;
    background: transparent;
    cursor: pointer;
    width: 100%;
}


input[type="range"]::-webkit-slider-thumb {
    background: url("data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIHZpZXdCb3g9IjAgMCAxOCAxOCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbHRlcj0idXJsKCNmaWx0ZXIwX2RfNTExXzE1OTQpIj4KICAgICAgICA8cmVjdCB4PSIxIiB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHJ4PSI4IiBmaWxsPSIjNEU0QkRGIi8+CiAgICAgICAgPHJlY3QgeD0iMS41IiB5PSIwLjUiIHdpZHRoPSIxNSIgaGVpZ2h0PSIxNSIgcng9IjcuNSIgc3Ryb2tlPSJ3aGl0ZSIvPgogICAgPC9nPgogICAgPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik02LjUgNUg3LjVWMTFINi41VjVaTTguNSA1SDkuNVYxMUg4LjVWNVpNMTEuNSA1SDEwLjVWMTFIMTEuNVY1WiIgZmlsbD0iI0YyRjRGNyIvPgogICAgPGRlZnM+CiAgICAgICAgPGZpbHRlciBpZD0iZmlsdGVyMF9kXzUxMV8xNTk0IiB4PSIwIiB5PSIwIiB3aWR0aD0iMTgiIGhlaWdodD0iMTgiIGZpbHRlclVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgY29sb3ItaW50ZXJwb2xhdGlvbi1maWx0ZXJzPSJzUkdCIj4KICAgICAgICAgICAgPGZlRmxvb2QgZmxvb2Qtb3BhY2l0eT0iMCIgcmVzdWx0PSJCYWNrZ3JvdW5kSW1hZ2VGaXgiLz4KICAgICAgICAgICAgPGZlQ29sb3JNYXRyaXggaW49IlNvdXJjZUFscGhhIiB0eXBlPSJtYXRyaXgiIHZhbHVlcz0iMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMTI3IDAiIHJlc3VsdD0iaGFyZEFscGhhIi8+CiAgICAgICAgICAgIDxmZU9mZnNldCBkeT0iMSIvPgogICAgICAgICAgICA8ZmVHYXVzc2lhbkJsdXIgc3RkRGV2aWF0aW9uPSIwLjUiLz4KICAgICAgICAgICAgPGZlQ29tcG9zaXRlIGluMj0iaGFyZEFscGhhIiBvcGVyYXRvcj0ib3V0Ii8+CiAgICAgICAgICAgIDxmZUNvbG9yTWF0cml4IHR5cGU9Im1hdHJpeCIgdmFsdWVzPSIwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwIDAgMCAwLjI0IDAiLz4KICAgICAgICAgICAgPGZlQmxlbmQgbW9kZT0ibm9ybWFsIiBpbjI9IkJhY2tncm91bmRJbWFnZUZpeCIgcmVzdWx0PSJlZmZlY3QxX2Ryb3BTaGFkb3dfNTExXzE1OTQiLz4KICAgICAgICAgICAgPGZlQmxlbmQgbW9kZT0ibm9ybWFsIiBpbj0iU291cmNlR3JhcGhpYyIgaW4yPSJlZmZlY3QxX2Ryb3BTaGFkb3dfNTExXzE1OTQiIHJlc3VsdD0ic2hhcGUiLz4KICAgICAgICA8L2ZpbHRlcj4KICAgIDwvZGVmcz4KPC9zdmc+");
    width: 18px;
    -webkit-appearance: none;
    height: 18px;
    @apply
    rounded-lg
}

.progress-bar-bottom-bar {
    @apply
    flex flex-col items-center mt-2
}

.progress-bottom-bar-index {
    @apply
    text-gray-dortyuz font-normal text-xs
}

</style>
