package com.patrick.service;

import com.patrick.domain.Rank;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface RankService {
    public boolean insert(Rank rank);


    public boolean update(Rank rank);

    public boolean delete(Integer id);

    public Integer getSumScoreBySongListId(Integer songListId);

    public List<Rank> getRankByConsumerId(Integer consumerId);

    public Integer getScoreBySongListIdAndConsumerId(@Param("songListId") Integer songListId, @Param("consumerId") Integer consumerId);

    public Integer getAverScoreBySongListId(Integer songListId);

    public Integer getNumOfRatingsBySongListId(Integer songListId);

    public boolean checkRank(@Param("songListId") Integer songListId, @Param("consumerId") Integer consumerId);



}
