<template>
  <router-view />
</template>
<script setup>
import { HttpManager } from './api';
import { useStore } from 'vuex';
import { onMounted } from 'vue';
const store = useStore()
const getUserByToken = async () => {
  const token = localStorage.getItem('accessToken')
  const res = await HttpManager.getUserByToken(String(token))

  if (res.code == 0) return
  const user = res.data
  // console.log(user);

  store.commit('setUserId', user.id)
  store.commit('setUsername', user.username)
  store.commit('setUserPic', user.avatar)
  store.commit('setToken', true)
}

onMounted(() => getUserByToken())
</script>

