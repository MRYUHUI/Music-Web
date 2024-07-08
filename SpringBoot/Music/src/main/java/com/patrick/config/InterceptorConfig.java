package com.patrick.config;

/**
 * @Author:
 * @Date: 2024-04-16-18:49
 * @Description:
 */

import com.patrick.interceptor.JWTInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new JWTInterceptor())
//               对 所有 进行拦截
                .addPathPatterns("/**")
//               这里将"/user/"排除在外，即不对以"/user/"开头的请求进行拦截
                .excludePathPatterns("/user/add")
                .excludePathPatterns("/user/login/status")
                .excludePathPatterns("/admin/**")
                .excludePathPatterns("/banner/**")
                .excludePathPatterns("/comment/**")
                .excludePathPatterns("/listSong/detail")
                .excludePathPatterns("/rankList/**")
                .excludePathPatterns("/singer/**")
                .excludePathPatterns("/song/**")
                .excludePathPatterns("/songList/**")
                .excludePathPatterns("/userSupport/test")
                .excludePathPatterns("/user/get_user_by_token")
                .excludePathPatterns("/admin/**")
                .excludePathPatterns("/img/**")
                .excludePathPatterns("/avatorImages/**")
                .excludePathPatterns("/song/**");
        ;
    }
}
