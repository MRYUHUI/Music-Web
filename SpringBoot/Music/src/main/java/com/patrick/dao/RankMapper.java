package com.patrick.dao;

import org.apache.ibatis.annotations.Mapper;

import com.patrick.domain.Rank;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface RankMapper {

    @Insert("INSERT INTO `rank` (song_list_id, consumer_id, score) VALUES (#{songListId}, #{consumerId}, #{score})")
    public int insert(Rank rank);

    @Update("<script>" +
            "UPDATE `rank`" +
            "<set>" +
            "<if test='songListId != null'>song_list_id = #{songListId},</if>" +
            "<if test='consumerId != null'>consumer_id = #{consumerId},</if>" +
            "<if test='score != null'>score = #{score},</if>" +
            "</set>" +
            "WHERE id = #{id}" +
            "</script>")
    public int update(Rank rank);

    @Delete("DELETE FROM `rank` WHERE id = #{id}")
    public int delete(Integer id);

    @Select("SELECT COALESCE(SUM(score), 0) FROM `rank` WHERE song_list_id = #{songListId}")
    public Integer getSumScoreBySongListId(Integer songListId);

    @Select("SELECT * FROM `rank` WHERE consumer_id = #{consumerId}")
    public List<Rank> getRankByConsumerId(Integer consumerId);

    @Select("SELECT COUNT(*) FROM `rank` WHERE song_list_id = #{songListId}")
    public Integer getNumOfRatingsBySongListId(Integer songListId);

    @Select("SELECT score FROM `rank` WHERE song_list_id = #{songListId} AND consumer_id = #{consumerId}")
    public Integer getScoreBySongListIdAndConsumerId(@Param("songListId") Integer songListId, @Param("consumerId") Integer consumerId);
    @Select("SELECT COUNT(*) FROM `rank` WHERE song_list_id = #{songListId} AND consumer_id = #{consumerId}")
    public Integer checkRank(@Param("songListId") Integer songListId, @Param("consumerId") Integer consumerId);

}
