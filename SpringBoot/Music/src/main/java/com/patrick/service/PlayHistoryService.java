package com.patrick.service;

import com.patrick.domain.PlayHistory;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @Author:
 * @Date: 2024-04-13-19:08
 * @Description:
 */
public interface PlayHistoryService {
    public boolean insert(PlayHistory playHistory);

    boolean update(PlayHistory playHistory);


    boolean delete(int id);

    List<PlayHistory> getAllPlayHistory();

    List<PlayHistory> getPlayHistoryByUserId(Integer userId);

    List<PlayHistory> getPlayHistoryBySongId(Integer songId);

    public boolean isExistByUserIdAndSongId(PlayHistory playHistory);
}
