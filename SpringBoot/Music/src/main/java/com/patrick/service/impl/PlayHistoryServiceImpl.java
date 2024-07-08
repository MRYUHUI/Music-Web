package com.patrick.service.impl;

import com.patrick.dao.PlayHistoryMapper;
import com.patrick.domain.PlayHistory;
import com.patrick.service.PlayHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @Author:
 * @Date: 2024-04-13-19:22
 * @Description:
 */
@Service
public class PlayHistoryServiceImpl implements PlayHistoryService {
    @Autowired
    PlayHistoryMapper playHistoryMapper;
    @Override
    public boolean insert(PlayHistory playHistory) {
        return playHistoryMapper.insert(playHistory) > 0;
    }

    @Override
    public boolean update(PlayHistory playHistory) {
        return playHistoryMapper.update(playHistory) > 0;
    }


    @Override
    public boolean delete(int id) {
        return playHistoryMapper.delete(id) > 0;
    }

    @Override
    public List<PlayHistory> getAllPlayHistory() {
        return playHistoryMapper.getAllPlayHistory();
    }

    @Override
    public List<PlayHistory> getPlayHistoryByUserId(Integer userId) {
        return playHistoryMapper.getPlayHistoryByUserId(userId);
    }

    @Override
    public List<PlayHistory> getPlayHistoryBySongId(Integer songId) {
        return playHistoryMapper.getPlayHistoryBySongId(songId);
    }

    @Override
    public boolean isExistByUserIdAndSongId(PlayHistory playHistory) {
        return playHistoryMapper.isExistByUserIdAndSongId(playHistory) > 0;
    }
}
