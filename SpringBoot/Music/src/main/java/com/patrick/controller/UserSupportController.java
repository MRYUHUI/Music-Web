package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.UserSupport;
import com.patrick.service.UserSupportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

import static com.patrick.utils.Consts.DATA;
import static com.patrick.utils.Consts.getJson;

@RestController
@RequestMapping("/userSupport")
public class UserSupportController {
    @Autowired
    private UserSupportService userSupportService;

    @PostMapping("/insert")
    public Object add(@RequestBody UserSupport userSupport) {
        boolean flag = userSupportService.insert(userSupport);
        JSONObject jsonObject = getJson(flag, "");
        return jsonObject;
    }

    @PostMapping("/delete")
    public Object delete(@RequestBody UserSupport userSupport) {
        boolean flag = userSupportService.delete(userSupport);
        JSONObject json = getJson(flag, "");
        return json;
    }

    @PostMapping("/test")
    public Object isUserSupportExist(@RequestBody Map<String, Integer> requestMap) {
        int commentId = requestMap.get("commentId");
        int userId = requestMap.get("userId");
        UserSupport userSupport = new UserSupport();
        userSupport.setUserId(userId);
        userSupport.setCommentId(commentId);
        boolean flag = userSupportService.isUserSupportExist(userSupport);
        System.out.println("commentId: " + commentId);
        System.out.println("userId: " + userId);
        JSONObject json = getJson(true, "");
        json.put(DATA, flag);
        return json;
    }

}
