package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.Admin;
import com.patrick.service.AdminService;
import com.patrick.utils.Consts;
import com.patrick.utils.JWTUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
public class AdminController {
    @Autowired
    private AdminService adminService;

    /**
     * 在前端代码中，通过post方法将包含username和password属性的对象
     * 作为请求体发送到后端的admin/login/status接口。
     * 这意味着请求体中包含了一个JSON对象，其中username和password是作为键值对存在的。
     * 在后端的loginStatus方法中，通过使用@RequestBody注解，
     * Spring Boot能够将请求体中的JSON数据映射为一个Java对象。
     * 在这种情况下，我们使用Map<String, String>作为映射的目标类型。
     * Map<String, String>表示一个键值对的集合，其中键和值都是字符串类型。
     * 通过@RequestBody注解，Spring Boot会自动解析请求体中的JSON数据，并将其转换为一个Map<String, String>对象，
     * 其中键对应JSON中的属性名，值对应JSON中的属性值。
     *
     * @param request
     * @param session
     * @return
     */
    @PostMapping("/admin/login/status")
    public Object loginStatus(@RequestBody Map<String, String> request, HttpSession session) {
        String username = request.get("username");
        String password = request.get("password");
        JSONObject jsonObject = new JSONObject();
        boolean flag = adminService.verifyPassword(username, password);
        if (flag) {
            jsonObject.put(Consts.CODE, 1);
            jsonObject.put(Consts.MSG, "登錄成功");
            jsonObject.put(Consts.SUCCESS, "success");
            session.setAttribute(Consts.NAME, username);
            jsonObject.put("type", "success");
            Admin adminByUsernameAndPassword = adminService.getAdminByUsernameAndPassword(username, password);
            // jwt ---------
            Map<String, String> payload = new HashMap<>();
            payload.put("userId", adminByUsernameAndPassword.getId().toString());
            payload.put("username", adminByUsernameAndPassword.getName());
            // 生成jwt令牌
            String newToken = JWTUtils.getToken(payload);
            jsonObject.put("adminToken", newToken);
            // ------------
            return jsonObject;
        }
        jsonObject.put(Consts.CODE, 0);
        jsonObject.put(Consts.MSG, "用戶名或者密碼錯誤");
        jsonObject.put(Consts.SUCCESS, "");
        jsonObject.put("type", "error");
        return jsonObject;
    }
}
