package com.patrick.interceptor;

/**
 * @Author:
 * @Date: 2024-04-16-18:40
 * @Description:
 */

import com.alibaba.fastjson.JSONObject;
import com.auth0.jwt.exceptions.AlgorithmMismatchException;
import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.patrick.utils.JWTUtils;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

import static com.patrick.utils.Consts.*;

/**
 * JWT验证拦截器
 */
public class JWTInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //如果请求为 OPTIONS 请求，则返回 true,否则需要通过jwt验证
        if (HttpMethod.OPTIONS.toString().equals(request.getMethod())){
            System.out.println("OPTIONS请求，放行");
            return true;
        }

        JSONObject map = new JSONObject();
        //令牌建议是放在请求头中，获取请求头中令牌
        String token = request.getHeader("Authorization");
        System.out.println("=====================");
        System.out.println(token);
        try{
            JWTUtils.verify(token);//验证令牌
            return true;//放行请求
        } catch (SignatureVerificationException e) {
            e.printStackTrace();
            map.put(MSG,"无效签名");
        } catch (TokenExpiredException e) {
            e.printStackTrace();
            map.put(MSG,"token过期");
        } catch (AlgorithmMismatchException e) {
            e.printStackTrace();
            map.put(MSG,"token算法不一致");
        } catch (Exception e) {
            e.printStackTrace();
            map.put(MSG,"token失效");
        }
        map.put(STATUS ,false);//设置状态
        map.put(TYPE, WARNING);
        //将map转化成json，response使用的是Jackson
        String json = new ObjectMapper().writeValueAsString(map);
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().print(json);
        return false;
    }
}
