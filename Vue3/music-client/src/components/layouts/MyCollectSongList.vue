<script setup>
// import
import { HttpManager } from '@/api';
import { computed, onMounted, ref, watch, getCurrentInstance } from 'vue';
import { useRoute, useRouter } from 'vue-router'
import { useStore } from "vuex";
import IconItem from "@/views/my-space/components/IconItem.vue"
import { Icon } from '@/enums';
// data
const store = useStore()
const { proxy } = getCurrentInstance()
const iconList = {
  Close: Icon.CLOSE
}
// 歌单信息
const songLists = ref([])

// method
const attachImageUrl = HttpManager.attachImageUrl
// 获取歌单
const getSongLists = async () => {
  if (!store.getters.token) return
  const { data: res } = await HttpManager.getAllPlayListOfUserId(store.getters.userId)
  songLists.value = res
}
// 将歌曲插入歌单
const collectToSongList = async (songListId) => {
  const songId = store.getters.songId
  console.log(songListId);

  // 判断歌曲是否已经在歌单里了
  const result = await HttpManager.isSongExistInSongList({ songId, songListId })
  console.log(result.data);
  // 如果存在
  if (result.data) {
    proxy.$message({
      message: '歌曲重复',
      type: "error",
    });
  }
  // 如果不存在
  else {
    // 加入歌单
    const res = await HttpManager.addSongToSongList({ songId, songListId })
    proxy.$message({
      message: res.message,
      type: res.type,
    });
    // 关闭收藏界面
    store.commit("setIsCollectionUnfold")
  }

}

const closeMyCollection = () => {
  store.commit("setIsCollectionUnfold")
}

const requestAllResource = async () => {
  if (!store.getters.token) return
  await getSongLists()
}
// computed
const userId = computed(() => store.getters.userId)
const isCollectionUnfold = computed(() => store.getters.isCollectionUnfold)
watch(isCollectionUnfold, (newVal) => {
  // 如果不显示，就返回
  if (!newVal) return
  requestAllResource()
})
// hook
onMounted(() => requestAllResource())
</script>
<template>
  <div class="my-collect-song-list" v-if="isCollectionUnfold">
    <div class="collect-title">
      <icon-item
        class="my-collection-close"
        :icon="iconList.Close"
        @click="closeMyCollection"
      ></icon-item>
      <span>收藏到歌单</span>
    </div>
    <div class="collect-song-list">
      <ul>
        <li
          class="sub-menu-item"
          v-for="(item, index) in songLists"
          :key="index"
          @click="collectToSongList(item.id)"
        >
          <img :src="attachImageUrl(item.pic)" />
          <span>{{ item.title }}</span>
        </li>
      </ul>
    </div>
  </div>
</template>



<style lang="scss" scoped>
.my-collect-song-list {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 420px;
  height: 400px;
  border-radius: 10px;
  box-shadow: 0 0 20px #00000058;
  background-color: aliceblue;
  z-index: 999;
  .collect-title {
    height: 50px;
    color: #343a40;
    font-weight: bolder;
    font-size: 24px;
    display: flex;
    align-items: end;
    justify-content: center;
    border-bottom: 1px solid #343a4042;
    padding: 10px;
  }
  .collect-song-list {
    max-height: 330px; /* 设置最大高度，超出部分将显示滚动条 */
    overflow-y: auto; /* 显示垂直滚动条 */
    overflow-x: hidden;
    width: 100%;
    ul {
      width: 100%;
    }
  }
  .collect-song-list::-webkit-scrollbar {
    display: none;
  }

  .sub-menu-item {
    border-radius: 10px;
    transition: all 0.2s;
    // margin-left: 10px;
    padding: 10px 20px 10px;
    display: flex;
    align-items: center;
    gap: 20px;
    width: 90%;
    font-weight: 600;
    img {
      width: 50px;
      height: 50px;
      border-radius: 5px;
    }
  }
  .sub-menu-item:hover {
    cursor: pointer;
    background-color: rgba(57, 56, 56, 0.114);
  }
  .sub-menu-item:hover img {
    transition: all 0.2s;

    transform: scale(1.2);
  }
  .sub-menu-item:hover span {
    transition: all 0.2s;
    transform: scale(1.2) translateX(10px);
  }
  .sub-menu-item:active {
    transform: translateY(5px);
  }
}
.my-collection-close {
  padding: 10px;
  position: absolute;
  right: 0;
  top: 0;
  transform: translate(-10px, 10px);
  border-radius: 50%;
  width: 20px;
  height: 20px;
  transition: all 0.1s;
}
.my-collection-close:hover {
  background-color: #0000001d;
  transform: scale(1.05);
  width: 24px;
  height: 24px;
  transform: translate(-7px, 7px);
}
</style>
