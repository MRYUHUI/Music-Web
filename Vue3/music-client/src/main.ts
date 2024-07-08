import { createApp } from "vue";
import ElementPlus from "element-plus";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import "element-plus/dist/index.css";
import "./assets/css/index.scss";
import "./assets/icons/index.js";
import '@/assets/icon-font/iconfont'
import "@/assets/css/globalVar.css"

import { ComponentCustomProperties } from "vue";
import { Store } from "vuex";
declare module "@vue/runtime-core" {
  interface State {
    count: number;
  }

  interface ComponentCustomProperties {
    $store: Store<State>;
  }
}

// 引入懒加载指令插件并且注册
import { lazyPlugin } from '@/directives/index'
const app = createApp(App)
app.use(store)
app.use(router)
app.use(ElementPlus)
app.use(lazyPlugin)
app.mount("#app");
