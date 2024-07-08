<script setup>
// import
import { onMounted, ref, getCurrentInstance, computed, watch } from "vue"
import IconItem from "@/views/my-space/components/IconItem.vue"
import { Icon } from '@/enums'
import { HttpManager } from '@/api'
import { useRoute, useRouter } from 'vue-router'
import { useStore } from "vuex";
import user from "@/store/user"
// data
const iconList = {
  Like: Icon.Like,
  PlayHistory: Icon.PlayHistory,
  MusicList: Icon.MusicList,
  userFavSongListIcon: Icon.userFavoriteSongList,
  createNewSongList: Icon.createNewSongList,
  deleteSongList: Icon.deleteSongList,
}
const { proxy } = getCurrentInstance();

const isCollapse = ref(false)

const playLists = ref([])

const userFavoriteSongLists = ref([])

const route = useRoute();

const router = useRouter()

const store = useStore()

const attachImageUrl = HttpManager.attachImageUrl

const dialogVisible = ref(false)

// 要删除的歌单ID
const delSongListId = ref(-1)

// 被激活的歌单
const defaultActiveItemInAside = store.getters.defaultActiveItemInAside
// method
const toggleCollapse = () => isCollapse.value = !isCollapse.value
// 获取所有用户创建的歌单
const getAllplayLists = async () => {

  const res = await HttpManager.getAllPlayListOfUserId(userId.value)
  // proxy.$message({
  //   message: res.message,
  //   type: res.type,
  // });
  playLists.value = res.data
}
// 获取所有用户收藏的歌单
const getAllUserFavoriteSongLists = async () => {
  const res = await HttpManager.getAllCollectedPlayListOfUserId(userId.value)
  userFavoriteSongLists.value = res.data
}

const requestResource = () => {
  getAllplayLists()
  getAllUserFavoriteSongLists()
}

// 最近播放
const goToPlayHistory = () => {
  const index = "2"
  // 用户“喜欢”歌曲对于的“打开歌单的类型”是0
  store.commit('setUserOpenSongListStyle', 1)
  store.commit('setCurSongListId', -1)
  router.push({ name: 'my-play-history', params: { id: userId.value } })
  store.commit('setDefaultActiveItemInAside', index)
}

// 用户喜欢
const goToUserLike = () => {
  const index = '1'
  // 用户“喜欢”歌曲对于的“打开歌单的类型”是0
  store.commit('setUserOpenSongListStyle', 0)
  store.commit('setCurSongListId', -1)
  store.commit('setDefaultActiveItemInAside', index)
  router.push({ name: 'my-space-like', params: { id: userId.value } })
}

// “创建歌单” & “收藏歌单”
const goToSongListDetail = (playList, songListStyle) => {
  const index = songListStyle === 2 ? "3-" + playList.id : "4-" + playList.id

  if (store.getters.curSongListId == playList.id) return
  // 把当前要展示的歌单信息放到store里
  const newCurSongList = {
    id: playList.id,
    title: playList.title,
    pic: playList.pic,
    introduction: playList.introduction,
    style: playList.style
  };


  // 更新歌单信息
  store.commit('setShowCurSongList', newCurSongList)
  console.log(store.getters.showCurSongList);
  // 更新当前歌单id
  store.commit('setCurSongListId', playList.id)
  // 更新打开的是收藏歌单还是创建歌单
  store.commit('setUserOpenSongListStyle', songListStyle)
  // 跳转路由
  router.push({ name: 'my-collect-song-list', params: { songListId: playList.id } })
  store.commit('setDefaultActiveItemInAside', index)

}
// 新增歌单
const showCreateSongListPage = () => {
  store.commit("setShowCreateSongListPage", !store.getters.showCreateSongListPage)
}

const showDelDialog = (songListId) => {
  delSongListId.value = songListId
  dialogVisible.value = !dialogVisible.value
}
const handleDelSongList = async () => {
  const songListId = delSongListId.value
  const userId = store.getters.userId
  // 先删除用户创建歌单表的内容
  const result = await HttpManager.delectCreatedSongList({ userId, songListId })
  if (!result.success) {
    proxy.$message({
      message: result.message,
      type: result.type
    })
    return
  }
  const res = await HttpManager.deleteSongList(songListId)
  proxy.$message({
    message: res.message,
    type: res.type
  })
  // 删除成功
  if (res.success) {
    // 关闭提示框
    dialogVisible.value = !dialogVisible.value
    // 刷新侧边栏
    requestResource()
  }
}

// computed
const userId = computed(() => store.getters.userId)
const isAsideFresh = computed(() => store.getters.isAsideFresh)
watch(isAsideFresh, () => requestResource())
// 钩子
onMounted(() => requestResource())
</script>


<template>
  <el-aside
    class="el-aside"
    :width="isCollapse ? '75px' : '240px'"
    style="background-color: #fff"
  >
    <!-- 菜单 -->
    <el-menu
      class="menu-list"
      :default-active="defaultActiveItemInAside"
      :collapse="isCollapse"
      style="height: 100%"
      :defaultOpeneds="['3', '4']"
    >
      <div class="toggle-button button-attr" @click="toggleCollapse">|||</div>
      <!-- 喜欢 -->
      <el-menu-item index="1" @click="goToUserLike">
        <div class="menu-item">
          <icon-item :icon="iconList.Like"></icon-item>
          <span class="menu-item-title" v-show="!isCollapse">我喜欢的音乐</span>
        </div>
      </el-menu-item>
      <!-- 最近播放 -->
      <el-menu-item index="2" @click="goToPlayHistory">
        <div class="menu-item">
          <icon-item :icon="iconList.PlayHistory"></icon-item>
          <span class="menu-item-title" v-show="!isCollapse">最近播放</span>
        </div>
      </el-menu-item>
      <!-- 创建的歌单 -->
      <el-sub-menu index="3">
        <template #title>
          <div class="setCollapseStyle">
            <icon-item :icon="iconList.MusicList"></icon-item>
            <span v-show="!isCollapse">我创建的歌单</span>
            <!-- 新建歌单按钮 -->
            <icon-item
              v-show="!isCollapse"
              class="create-new-song-list"
              :icon="iconList.createNewSongList"
              @click.stop="showCreateSongListPage"
            ></icon-item>
          </div>
        </template>
        <el-menu-item
          v-for="playList in playLists"
          :key="playList.id"
          :index="'3-' + playList.id"
          @click="goToSongListDetail(playList, 2)"
          ><div class="sub-menu-item">
            <!-- 歌单图片 -->
            <img v-show="!isCollapse" :src="attachImageUrl(playList.pic)" />
            <!-- 歌单名 -->
            <span>{{ playList.title }}</span>
            <!-- 删除歌单按钮 -->
            <icon-item
              @click.stop="showDelDialog(playList.id)"
              :icon="iconList.deleteSongList"
              class="del-song-list"
            ></icon-item></div
        ></el-menu-item>
      </el-sub-menu>
      <!-- 收藏的歌单 -->
      <el-sub-menu index="4">
        <template #title>
          <div class="setCollapseStyle">
            <icon-item :icon="iconList.userFavSongListIcon"></icon-item>
            <span v-show="!isCollapse">我收藏的歌单</span>
          </div>
        </template>
        <el-menu-item
          v-for="favoriteSongList in userFavoriteSongLists"
          :key="favoriteSongList.id"
          :index="'4-' + favoriteSongList.id"
          @click="goToSongListDetail(favoriteSongList, 3)"
          ><div class="sub-menu-item">
            <img
              v-show="!isCollapse"
              :src="attachImageUrl(favoriteSongList.pic)"
            />
            <span>{{ favoriteSongList.title }}</span>
          </div></el-menu-item
        >
      </el-sub-menu>
    </el-menu>
  </el-aside>
  <!-- 删除歌单提示框 -->
  <el-dialog v-model="dialogVisible" width="300" class="del-song-list-dia"
    ><span class="dia-font"> 确定删除该歌单？ </span>
    <template #footer>
      <div
        class="dialog-footer"
        style="display: flex; justify-content: space-between"
      >
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="handleDelSongList">确认</el-button>
      </div>
    </template>
  </el-dialog>
</template>


<style scoped lang="scss">
/* 侧边栏样式 */
/* 解决折叠时会出现滚动条的问题 */
.el-aside::-webkit-scrollbar {
  display: none;
}
.el-aside {
  box-shadow: 0 0 5px #0000003a;
  border-radius: 5px;
  height: 850px;
  transition: 1s;
  background-color: #333744;
  padding-left: 10px;
  .el-menu {
    padding: 0;
    width: 100%;
    border-right: none;
    .el-menu-item {
      min-width: 70px;
      width: 100%;
      font-weight: bold;
      text-align: center;
    }
    .menu-item {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .menu-item-title {
      font-weight: bold;
    }

    .el-sub-menu {
      .setCollapseStyle {
        display: flex;
        gap: 10px;
        align-items: center; // 如果需要的话，将子元素垂直居中
        font-weight: bold;
      }
      .el-menu-item {
        display: block;
        padding-left: 30px;
        width: 250px;
        font-weight: bold;
        text-align: left;

        .sub-menu-item {
          display: flex;
          align-items: center;
          gap: 10px;

          img {
            width: 30px;
            height: 30px;
            border-radius: 5px;
          }
        }
      }
    }
  }
  li {
    width: inherit;
    overflow: hidden;
  }
}

/* 折叠按钮样式 */
.toggle-button {
  background-color: #4a5064;
  font-size: 10px;
  line-height: 24px;
  color: #fff;
  text-align: center;
  letter-spacing: 0.2em;
  font-weight: bold;
  width: auto;
}
.button-attr {
  border-radius: 5px;
  box-shadow: 0 1px 5px rgba(10, 85, 85, 0.687);
  transition: all 1s;
}
.button-attr:hover {
  transition: all 1s;

  background: linear-gradient(to right, #3498db, #2ecc71);
  cursor: pointer;
  box-shadow: 0 0 20px rgb(5, 215, 215);
}

// 新增歌单按钮样式
.create-new-song-list {
  position: absolute;
  right: 50px;
  transition: all 0.2s;
}
.create-new-song-list:hover {
  transform: scale(2);
}
.create-new-song-list:active {
  transition: all 0.05s;
  transform: scale(1);
}
// 删除歌单按钮样式
.del-song-list {
  padding: 3px;
  border-radius: 50%;
  transition: all 0.2s;
  position: absolute;
  right: 30px;
  top: 50%;
  transform: translateY(-50%);
}
.del-song-list:hover {
  background-color: #00000044;
}

.dia-font {
  font-size: larger;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
}
</style>