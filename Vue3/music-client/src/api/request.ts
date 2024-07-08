import axios from "axios";
import router from "@/router";

const BASE_URL = process.env.NODE_HOST;
// const BASE_URL = 'http://localhost:8081'; // 设置包含端口号的基础URL
axios.defaults.timeout = 5000; // 超时时间设置
axios.defaults.withCredentials = true; // true允许跨域
axios.defaults.baseURL = BASE_URL;

// Content-Type 响应头
axios.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded;charset=UTF-8";

// 添加请求拦截器
axios.interceptors.request.use(config => {
  // 在请求头中添加accessToken字段
  config.headers.Authorization = localStorage.getItem('accessToken');
	// console.log(config.headers['token'])
  return config;
}, error => {
  // 处理请求错误
  return Promise.reject(error);
});



// 响应拦截器
axios.interceptors.response.use(
  (response) => {
    // 如果返回的状态码为200，说明接口请求成功，可以正常拿到数据
    // 否则的话抛出错误
    if (response.status === 200) {
      return Promise.resolve(response);
    } else {
      return Promise.reject(response);
    }
  },
  // 服务器状态码不是2开头的的情况
  (error) => {
    if (error.response.status) {
      switch (error.response.status) {
        // 401: 未登录
        case 401:
          router.replace({
            path: "/",
            query: {
              // redirect: router.currentRoute.fullPath
            },
          });
          break;
        case 403:
          // console.log('管理员权限已修改请重新登录')
          // 跳转登录页面，并将要浏览的页面fullPath传过去，登录成功后跳转需要访问的页面
          setTimeout(() => {
            router.replace({
              path: "/",
              query: {
                // redirect: router.currentRoute.fullPath
              },
            });
          }, 1000);
          break;

        // 404请求不存在
        case 404:
          // console.log('请求页面飞到火星去了')
          break;
      }
      return Promise.reject(error.response);
    }
  }
);

export function getBaseURL() {
  return BASE_URL;
}

/**
 * 封装get方法
 * @param url
 * @param data
 * @returns {Promise}
 */
export function get(url, params?: object) {
  return new Promise((resolve, reject) => {
    axios.get(url, params).then(
      (response) => resolve(response.data),
      (error) => reject(error)
    );
  });
}

/**
 * 封装post请求
 * @param url
 * @param data
 * @returns {Promise}
 */
export function post(url, data = {}) {
  return new Promise((resolve, reject) => {
    axios.post(url, data).then(
      (response) => resolve(response.data),
      (error) => reject(error)
    );
  });
}

/**
 * 封装delete请求
 * @param url
 * @param data
 * @returns {Promise}
 */
export function deletes(url, data = {}) {
  return new Promise((resolve, reject) => {
    axios.delete(url, data).then(
      (response) => resolve(response.data),
      (error) => reject(error)
    );
  });
}

/**
 * 封装put请求
 * @param url
 * @param data
 * @returns {Promise}
 */
export function put(url, data = {}) {
  return new Promise((resolve, reject) => {
    axios.put(url, data).then(
      (response) => resolve(response.data),
      (error) => reject(error)
    );
  });
}
