package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.UserLike;
import com.patrick.service.UserLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

import static com.patrick.utils.Consts.DATA;
import static com.patrick.utils.Consts.getJson;

@RestController
@RequestMapping("/user_like")
public class UserLikeController {
    @Autowired
    private UserLikeService userLikeService;

    @PostMapping("/add")
    public Object addCollect(@RequestBody UserLike userLike) {
        boolean flag = userLikeService.insert(userLike);
        JSONObject jsonObject = getJson(flag, "收藏");
        jsonObject.put(DATA, true);
        return jsonObject;
    }

    @PostMapping("/update")
    public Object update(@RequestBody UserLike userLike) {
        boolean flag = userLikeService.update(userLike);
        return getJson(flag, "");
    }

    @DeleteMapping("/delete")
    public Object delete(HttpServletRequest request) {
        String userId = request.getParameter("userId").trim();
        String songId = request.getParameter("songId").trim();
        UserLike userLike = new UserLike();
        userLike.setSongId(Integer.parseInt(songId));
        userLike.setUserId(Integer.parseInt(userId));
        boolean flag = !userLikeService.isExist(userLike);
        if(!flag) flag = userLikeService.delete(userId, songId);
        JSONObject json = getJson(flag, "取消");
        json.put(DATA, false);
        return  json;
    }

    @GetMapping("/detail")
    public Object getCollectByUserId(@RequestParam int userId) {
        List<UserLike> userLikes = userLikeService.getLikeByUserId(userId);
        JSONObject json = getJson(true, "");
        json.put(DATA, userLikes);
        return json;
    }

    @PostMapping("/status")
    public Object isUserLike(@RequestBody  UserLike userLike) {
//        System.out.println(userLike);
        JSONObject jsonObject = new JSONObject();
        boolean flag = userLikeService.isExist(userLike);
//        System.out.println(flag);
        jsonObject.put(DATA, flag);
        return jsonObject;
    }
}
