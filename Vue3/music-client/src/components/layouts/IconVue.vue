<template>
  <svg class="icon" aria-hidden="true">
    <use :xlink:href="icon"></use>
  </svg>
</template>

<script setup lang="ts">
import { PropType } from 'vue'

const props = defineProps({
  icon: {
    type: String as PropType<string>,
    required: true
  }
})
</script>

<style scoped>
.icon {
  transform: scale(1.4);
  width: 1em;
  height: 1em;
  vertical-align: -0.15em;
  fill: currentColor;
  overflow: hidden;
  transition: all 0.1s;
}
.icon:hover {
  cursor: pointer;
  transform: scale(1.8);
}
.icon:active {
  transform: translateY(2px);
}
</style>