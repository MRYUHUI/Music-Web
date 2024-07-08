<script setup>
import { HttpManager } from '@/api';
import { ref, reactive, getCurrentInstance, computed } from 'vue';
import { useStore } from 'vuex'
// data
const store = useStore()


// method

// computed
const dialogVisible = computed(() => store.getters.showCreateSongListPage)
</script>

<template>
  <div class="create-new-song-list">
    <el-dialog
      v-model="dialogVisible"
      title="Tips"
      width="500"
      :before-close="handleClose"
    >
      <span>This is a message</span>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogVisible = false">Cancel</el-button>
          <el-button type="primary" @click="dialogVisible = false">
            Confirm
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>


<style scoped>
.create-new-song-list {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
</style>
