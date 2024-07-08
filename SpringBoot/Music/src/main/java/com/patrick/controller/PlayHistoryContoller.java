package com.patrick.controller;


import com.alibaba.fastjson.JSONObject;
import com.patrick.domain.PlayHistory;
import com.patrick.service.PlayHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import static com.patrick.utils.Consts.DATA;
import static com.patrick.utils.Consts.getJson;

/**
 * @Author:
 * @Date: 2024-04-13-19:34
 * @Description:
 */
@RestController
@RequestMapping("/history")
public class PlayHistoryContoller {
    @Autowired
    private PlayHistoryService playHistoryService;

    @PostMapping("/add")
    public Object updateHistory(@RequestBody PlayHistory playHistory) {
        boolean isExist = playHistoryService.isExistByUserIdAndSongId(playHistory);
        boolean flag;
        if (!isExist) {
            flag = playHistoryService.insert(playHistory);
        } else {
            flag = playHistoryService.update(playHistory);
        }
        return getJson(flag, "添加");
    }

    @GetMapping("")
    public Object getAllHistoryByUserId(@RequestParam Integer id) {
        List<PlayHistory> playHistoryByUserId = playHistoryService.getPlayHistoryByUserId(id);
        Collections.sort(playHistoryByUserId, new Comparator<PlayHistory>() {
            @Override
            public int compare(PlayHistory play1, PlayHistory play2) {
                return play2.getPlayTime().compareTo(play1.getPlayTime());
            }
        });
        JSONObject json = getJson(true, "");
        json.put(DATA, playHistoryByUserId);
        return json;
    }
}
