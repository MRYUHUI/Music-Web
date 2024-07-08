package com.patrick.dao;

import com.patrick.domain.PlayHistory;
import org.apache.ibatis.annotations.*;

import java.util.Date;
import java.util.List;

@Mapper
public interface PlayHistoryMapper {

    @Insert("INSERT INTO user_play_history (user_id, song_id, play_time) VALUES (#{userId}, #{songId}, NOW())")
    public int insert(PlayHistory playHistory);


    @Update("UPDATE user_play_history SET play_time = NOW() WHERE user_id = #{userId} AND song_id = #{songId}")
    public int update(PlayHistory playHistory);



    @Delete("DELETE FROM user_play_history WHERE id = #{id}")
    public int delete(int id);

    @Select("SELECT * FROM user_play_history")
    @Results({
            // Mapping of result set columns to object properties
    })
    public List<PlayHistory> getAllPlayHistory();

    @Select("SELECT * FROM user_play_history WHERE user_id = #{userId}")
    public List<PlayHistory> getPlayHistoryByUserId(Integer userId);

    @Select("SELECT * FROM user_play_history WHERE song_id = #{songId}")
    public List<PlayHistory> getPlayHistoryBySongId(Integer songId);

    @Select("SELECT COUNT(*) FROM user_play_history WHERE user_id = #{userId} AND song_id = #{songId}")
    public int isExistByUserIdAndSongId(PlayHistory playHistory);


}
