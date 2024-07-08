package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.Comment;
import com.patrick.domain.SongList;
import com.patrick.service.CommentService;
import com.patrick.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Map;

import static com.patrick.utils.Consts.DATA;
import static com.patrick.utils.Consts.getJson;

@RestController
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @GetMapping("/delete")
    public Object delete(@RequestParam int id) {
        boolean flag = commentService.delete(id);
        return getJson(flag, "删除");
    }

    @PostMapping("/add")
    public Object add(@RequestBody Comment comment) {
        boolean flag = commentService.insert(comment);
        return getJson(flag, "");
    }

    @PostMapping("/like")
    public Object setSupport(@RequestBody Map<String, Integer> requestMap) {
        int id = requestMap.get("id");
        int up = requestMap.get("up");
        boolean flag = commentService.setUp(id, up);
        JSONObject json = getJson(flag, "");
        return json;
    }

    @GetMapping("/songList/detail")
    public Object getCommentBySongListId(@RequestParam int songListId) {
        List<Comment> comments = commentService.getCommentBySongListId(songListId);
        JSONObject json = getJson(true, "");
        json.put(DATA, comments);
        return json;
    }

    @GetMapping("/song/detail")
    public Object getCommentBySongId(@RequestParam int songId) {
        List<Comment> comments = commentService.getCommentBySongId(songId);
        JSONObject json = getJson(true, "");
        json.put(DATA, comments);
        return json;
    }
}
