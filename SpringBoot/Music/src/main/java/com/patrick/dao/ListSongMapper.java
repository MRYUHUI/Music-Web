package com.patrick.dao;

import com.patrick.domain.ListSong;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ListSongMapper {
    @Insert("INSERT INTO list_song (song_id, song_list_id) VALUES (#{songId}, #{songListId})")
    public int insert(ListSong listSong);

    @Delete("DELETE FROM list_song WHERE song_id = #{id}")
    public int delete(Integer id);

    @Delete("DELETE FROM list_song WHERE song_id = #{songId} AND song_list_id = #{songListId}")
    public  int deleteBySongIdAndSongListId(ListSong listSong);

    @Select("SELECT * FROM list_song WHERE id = #{id}")
    public ListSong getListSongById(Integer id);

    @Select("SELECT * FROM list_song")
    public List<ListSong> allListSong();

    @Select("SELECT * FROM list_song WHERE song_list_id = #{songListId}")
    public List<ListSong> getListSongBySongListId(Integer songListId);

    @Select("SELECT COUNT(*) FROM list_song WHERE song_id = #{songId} AND song_list_id = #{songListId}")
    public int isExist(ListSong listSong);
}