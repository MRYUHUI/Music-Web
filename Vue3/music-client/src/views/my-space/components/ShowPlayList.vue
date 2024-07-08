<script setup>
// 用于显示歌曲
const props = defineProps({
  musicList: {
    type: Array
  }
})
import { Icon } from '@/enums'
// import
import { useStore } from "vuex";
import mixin from '@/mixins/mixin'
import IconItem from "@/views/my-space/components/IconItem.vue"
import { ref, toRefs, getCurrentInstance, computed, watch, onMounted, inject } from 'vue'
import { HttpManager } from '@/api';
// data
const multipleSelection = ref([]) // 记录要删除的歌曲列表
const { musicList } = toRefs(props)
const { proxy } = getCurrentInstance()
const iconList = {
  dislike: Icon.Dislike,
  like: Icon.Like,
}

const {
  playMusic,
  checkStatus,
} = mixin()

const store = useStore()

// method
const handleClick = (row) => {
  playMusic({
    id: row.id,
    url: row.url,
    pic: row.pic,
    index: row.index,
    name: row.name,
    lyric: row.lyric,
    currentSongList: musicList.value
  })

}
const changeLike = async (row) => {
  const userId = store.getters.userId
  const type = '0' //这里要看看 不能直接写死
  const songId = row.id
  let result = row.user_like
  const res = result ? (await HttpManager.deleteUserLike(userId, songId)) : (await HttpManager.setUserLike({ userId, type, songId }))
  store
  // 更新状态
  row.user_like = !result
  proxy.$message({
    message: res.message,
    type: res.type
  })
  // 判断该歌曲是否正在播放
  if (store.getters.songId == songId) {
    store.commit('setcurLikeChange')
  }
}
// 点击复选框
const handleSelectionChange = (newSelection) => {
  multipleSelection.value = newSelection
  store.commit('setMultipleSelection', multipleSelection)
}
// computed
const isPlayAllMusic = computed(() => store.getters.isPlayAllMusic)
// 判断用户点击的是不是创建歌单
const userOpenSongListStyle = computed(() => store.getters.userOpenSongListStyle)
// watch
watch(isPlayAllMusic, () => {
  if (musicList.value.length <= 0) return
  const curMusic = musicList.value[0]
  playMusic({
    id: curMusic.id,
    url: curMusic.url,
    pic: curMusic.pic,
    index: curMusic.index,
    name: curMusic.name,
    lyric: curMusic.lyric,
    currentSongList: musicList.value
  })
})
</script>
<template>
  <div class="show-play-list">
    <!-- 歌曲列表 -->
    <!-- 用户创建歌单 -->
    <el-table
      v-if="userOpenSongListStyle === 2"
      :data="musicList"
      style="width: 100%; height: 90%"
      class="play-list-table"
      @row-click="handleClick"
      highlight-current-row
      @selection-change="handleSelectionChange"
      :header-cell-style="{
        color: '#848484',
        fontSize: '22px',
        backgroundColor: '#qua'
      }"
    >
      <el-table-column
        type="selection"
        width="40"
        align="center"
      ></el-table-column>
      <el-table-column prop="songName" label="歌曲名" width="300" />
      <el-table-column prop="singerName" label="作者" width="300" />
      <el-table-column prop="album" label="专辑" width="300" />
      <el-table-column label="喜欢" width="80" align="center">
        <template #default="{ row }">
          <icon-item
            :icon="row.user_like ? iconList.like : iconList.dislike"
            class="icon-style"
            @click.stop="changeLike(row)"
          />
        </template>
      </el-table-column>
    </el-table>
    <!-- 用户收藏歌单 -->
    <!-- 用户创建歌单 -->
    <el-table
      v-else
      :header-cell-style="{
        color: '#848484',
        fontSize: '22px',
        backgroundColor: '#qua'
      }"
      :data="musicList"
      style="width: 100%; height: 90%"
      class="play-list-table"
      @row-click="handleClick"
      highlight-current-row
    >
      <el-table-column prop="songName" label="歌曲名" width="300" />
      <el-table-column prop="singerName" label="作者" width="300" />
      <el-table-column prop="album" label="专辑" width="300" />
      <el-table-column label="喜欢" width="80" align="center">
        <template #default="{ row }">
          <icon-item
            :icon="row.user_like ? iconList.like : iconList.dislike"
            class="icon-style"
            @click.stop="changeLike(row)"
          />
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>


<style lang="scss" scoped>
.show-play-list {
  margin: 10px;
  padding: 10px;
  height: 650px;
  width: inherit;
  font-weight: bold;

  .play-list-table {
    padding: 10px;
    border-collapse: collapse; /* 移除表格边框 */
    .el-table__row {
      border-bottom: none; /* 移除行边框 */
    }
    overflow: scroll; // 超出内容加滚动条
  }
  // 去除滚动条显示
  .play-list-table::-webkit-scrollbar {
    display: none;
  }
}
::v-deep .el-table__body .cell {
  font-size: 20px;
}
.icon-style:hover {
  cursor: pointer;
}
</style>