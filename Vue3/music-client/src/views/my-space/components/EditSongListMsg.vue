<script setup>
import { HttpManager } from '@/api';
import { ref, reactive, getCurrentInstance, computed, watch } from 'vue';
import { useStore } from 'vuex'
// data
const store = useStore()
const songListId = computed(() => store.getters.showCurSongList.id)
const songListTitle = computed(() => store.getters.showCurSongList.title)
const songListPic = computed(() => store.getters.showCurSongList.pic)
const songListIntro = computed(() => store.getters.showCurSongList.introduction)
const songListStyle = computed(() => store.getters.showCurSongList.style)
const form = ref({
  id: songListId.value,
  title: songListTitle.value,
  pic: songListPic.value,
  introduction: songListIntro.value,
  style: songListStyle.value
});
const { proxy } = getCurrentInstance()

const editRules = ref({
  title: [
    { required: true, message: '歌单名不能为空', trigger: 'blur' },
    { min: 1, max: 12, message: '歌单名不长于12个字', trigger: 'blur' }
  ],
  introduction: [
    { required: false, max: 100, trigger: 'blur', message: '歌单简介不能超过100个字' }
  ]
})
const uploadTypes = ref(["jpg", "jpeg", "png", "gif"]);
// method
const closeEditPannel = () => {
  store.commit("setShowEditSongListMsg", false)
}
const saveChanges = () => {
  proxy.$refs['editSongListMsgRef'].validate(async (valid) => {
    if (valid) {
      // 表单验证通过，可以执行保存操作
      const id = songListId.value
      const title = songListTitle.value
      const introduction = songListIntro.value
      const style = songListStyle.value
      const res = await HttpManager.updateSongListMsg({ id, title, introduction, style })

      proxy.$message({
        message: res.message,
        type: res.type
      })
      if (res.success) {
        store.commit("setShowCurSongList", form)
        store.commit("setIsAsideFresh", !store.getters.isAsideFresh)
        closeEditPannel()
      }
    } else {
      // 表单验证失败
      console.log('表单验证失败');
    }
  });
}

function resetForm () {
  form.value.name = '';
  form.value.description = '';
}
// 上传图片
function uploadUrl (songListId) {
  return HttpManager.attachImageUrl(`/songList/img/update?id=${songListId}`);
}
function beforeImgUpload (file) {

  const ltCode = 10;
  const isLt2M = file.size / 1024 / 1024 < ltCode;
  const isExistFileType = uploadTypes.value.includes(file.type.replace(/image\//, ""));

  if (!isExistFileType) {
    proxy.$message.error(`图片只支持 ${uploadTypes.value.join("、")} 格式!`);
  }
  if (!isLt2M) {
    proxy.$message.error(`上传头像图片大小不能超过 ${ltCode}MB!`);
  }

  return isExistFileType && isLt2M;
}
// 更新图片
function handleImgSuccess (res) {
  proxy.$message({
    message: res.message,
    type: res.type,
  })
  if (res.success) {
    form.value.pic = res.pic
  }
}
const showEditSongListMsg = computed(() => store.getters.showEditSongListMsg)

</script>

<template>
  <el-dialog
    v-model="showEditSongListMsg"
    class="edit-songlist-msg"
    width="700"
    :show-close="false"
    title="修改歌单"
  >
    <el-form
      :model="form"
      label-width="80px"
      ref="editSongListMsgRef"
      :rules="editRules"
    >
      <!-- prop要和form里的值一样 -->
      <el-form-item label="歌单名" prop="name">
        <el-input
          v-model="songListTitle"
          placeholder="请输入新歌单名"
        ></el-input>
      </el-form-item>
      <el-form-item label="歌单介绍">
        <el-input
          v-model="songListIntro"
          type="textarea"
          placeholder="请输入新歌单介绍"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <div class="change-img">
          <img
            :src="HttpManager.attachImageUrl(songListPic)"
            style="width: 80px"
          />
          <el-upload
            :action="uploadUrl(songListId)"
            :show-file-list="false"
            :on-success="handleImgSuccess"
            :before-upload="beforeImgUpload"
          >
            <el-button>更新图片</el-button>
          </el-upload>
        </div>
      </el-form-item>
      <el-form-item>
        <div class="btns">
          <el-button type="primary" @click="saveChanges">保存</el-button>
          <el-button @click="resetForm">重置</el-button>
          <el-button @click="closeEditPannel">取消</el-button>
        </div>
      </el-form-item>
    </el-form>
  </el-dialog>
</template>


<style scoped>
.edit-songlist-msg {
  transition: all 0.2s;
}

.btns {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: right;
  gap: 10px;
}
.change-img {
  display: flex;
  gap: 20px;
  align-items: center;
}
</style>
