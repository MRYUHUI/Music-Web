package com.patrick.controller;

import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.Rank;
import com.patrick.service.RankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import static com.patrick.utils.Consts.DATA;
import static com.patrick.utils.Consts.getJson;

@RestController
@RequestMapping("/rankList")
public class RankController {
    @Autowired
    private RankService rankService;

    @PostMapping("/add")
    public Object add(@RequestBody Rank rank) {
        boolean flag = rankService.insert(rank);
        JSONObject jsonObject = getJson(flag, "评分");
        jsonObject.put(DATA, true);
        return jsonObject;
    }
    @GetMapping("")
    public Object getRankBySongListId(@RequestParam int songListId) {
        Integer averScore = rankService.getAverScoreBySongListId(songListId);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put(DATA, averScore);
        return jsonObject;
    }
    @GetMapping("/user")
    public Object getRankByUserIdAndSongListId(@RequestParam int consumerId, @RequestParam int songListId){
        Integer score = rankService.getScoreBySongListIdAndConsumerId(songListId, consumerId);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put(DATA, score);
        return jsonObject;
    }
    @GetMapping("/user/check")
    public Object isRank(@RequestParam int consumerId, @RequestParam int songListId){
        boolean flag = rankService.checkRank(songListId, consumerId);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put(DATA, flag);
        return jsonObject;
    }
}