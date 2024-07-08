<script setup>
import { HttpManager } from '@/api'
import { computed, ref, getCurrentInstance } from 'vue'
import { useStore } from 'vuex'
import TheAside from './components/TheAside.vue'
// data
const store = useStore()
const { proxy } = getCurrentInstance()
const songListForm = ref({
  title: "",
  introduction: "",
  style: "",
})


const options = [
  {
    value: '华语',
    label: '华语',
  },
  {
    value: '粤语',
    label: '粤语',
  },
  {
    value: '欧美',
    label: '欧美',
  },
  {
    value: '日韩',
    label: '日韩',
  },
  {
    value: 'BGM',
    label: 'BGM',
  },
  {
    value: '轻音乐',
    label: '轻音乐',
  },
  {
    value: '重金属',
    label: '重金属',
  },
]

const CreateSongListRules = ref({
  title: [
    { required: true, message: '歌单名不能为空', trigger: 'blur' },
    { min: 1, max: 12, message: '歌单名不长于12个字', trigger: 'blur' }
  ],
  style: [
    { required: true, message: '风格不能为空', trigger: 'change' }
  ],
  introduction: [
    { required: false, max: 100, trigger: 'blur', message: '歌单简介不能超过100个字' }
  ]
})

// method
const closeNewSongListPage = () => {
  store.commit('setShowCreateSongListPage', false)
}
const saveNewSongListMsg = () => {
  proxy.$refs['CreateNewSongListRef'].validate(async (valid) => {
    if (valid) {
      const title = songListForm.value.title
      const introduction = songListForm.value.introduction
      const style = songListForm.value.style
      // 将歌单信息更新到歌单表里
      const res = await HttpManager.createNewSongList({ title, introduction, style })
      // 如果失败直接返回
      if (!res.success) {
        proxy.$message({
          message: res.message,
          type: res.type
        })
        return
      }
      const userId = store.getters.userId
      const songListId = res.data
      // 将歌单和用户的关联起来，放入user_create_songlist
      const result = await HttpManager.userCreateSongList({ userId, songListId })
      proxy.$message({
        message: result.message,
        type: result.type
      })
      // 创建成功
      if (res.success) {
        // 更新侧边栏
        store.commit("setIsAsideFresh", !store.getters.isAsideFresh)
        resetForm()
        closeNewSongListPage()
      }
    } else {
      // 表单验证失败
      console.log('表单验证失败');
    }
  });

}
const resetForm = () => {
  songListForm.value.title = ''
  songListForm.value.introduction = ''
  songListForm.value.style = ''
}
// computed
const dialogVisible = computed(() => store.getters.showCreateSongListPage)
</script>

<template>
  <div class="my-space">
    <!-- 侧边栏 -->
    <the-aside></the-aside>
    <!-- 主题内容 -->
    <router-view></router-view>
    <!-- 新增歌单 -->
    <el-dialog
      v-model="dialogVisible"
      title="新建歌单"
      width="700"
      :show-close="false"
    >
      <el-form
        :model="songListForm"
        ref="CreateNewSongListRef"
        :rules="CreateSongListRules"
      >
        <el-form-item label="歌单名" prop="title">
          <el-input v-model="songListForm.title"></el-input>
        </el-form-item>
        <el-form-item label="简介" prop="introduction">
          <el-input
            type="textarea"
            v-model="songListForm.introduction"
          ></el-input>
        </el-form-item>
        <el-form-item label="风格" prop="style">
          <el-select
            v-model="songListForm.style"
            placeholder="请选择风格"
            size="large"
            style="width: 240px"
          >
            <el-option
              style="width: 240px"
              v-for="option in options"
              :key="option.value"
              :label="option.label"
              :value="option.value"
            ></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="closeNewSongListPage">取消</el-button>
          <el-button type="primary" @click="saveNewSongListMsg">
            确定
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>


<style scoped lang="scss">
.my-space {
  height: 100vh;
  display: flex;
  gap: 100px;
}
.create-new-song-list {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
</style>
