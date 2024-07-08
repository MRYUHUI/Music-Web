package com.patrick.service.impl;

import com.patrick.dao.RankMapper;
import com.patrick.domain.Rank;
import com.patrick.service.RankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RankServiceImpl implements RankService {
    @Autowired
    private RankMapper rankMapper;

    @Override
    public boolean insert(Rank rank) {
        return rankMapper.insert(rank) > 0;
    }

    @Override
    public boolean update(Rank rank) {
        return rankMapper.update(rank) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return rankMapper.delete(id) > 0;
    }

    @Override
    public Integer getNumOfRatingsBySongListId(Integer songListId) {
        return rankMapper.getNumOfRatingsBySongListId(songListId);
    }

    @Override
    public Integer getAverScoreBySongListId(Integer songListId) {
        int num = rankMapper.getNumOfRatingsBySongListId(songListId);
        if(num == 0) return 5;
        return getSumScoreBySongListId(songListId) / num;
    }

    @Override
    public Integer getSumScoreBySongListId(Integer songListId) {
        return rankMapper.getSumScoreBySongListId(songListId);
    }

    @Override
    public boolean checkRank(Integer songListId, Integer consumerId) {
        return rankMapper.checkRank(songListId,consumerId) > 0;
    }

    @Override
    public List<Rank> getRankByConsumerId(Integer consumerId) {
        return rankMapper.getRankByConsumerId(consumerId);
    }

    @Override
    public Integer getScoreBySongListIdAndConsumerId(Integer songListId, Integer consumerId) {
        return rankMapper.getScoreBySongListIdAndConsumerId(songListId, consumerId);
    }
}
