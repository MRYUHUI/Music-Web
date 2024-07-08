package com.patrick.dao;

import com.patrick.domain.Song;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface SongMapper {
    @Insert("INSERT INTO song (singer_id, name, introduction, create_time, update_time, pic, lyric, url) " +
            "VALUES (#{singerId}, #{name}, #{introduction}, #{createTime}, #{updateTime}, #{pic}, #{lyric}, #{url})")
    public int insert(Song song);

    @Update("UPDATE song SET singer_id = #{singerId}, name = #{name}, introduction = #{introduction}, " +
            "update_time = #{updateTime}, lyric = #{lyric}" +
            "WHERE id = #{id}")
    public int update(Song song);

    @Delete("DELETE FROM song WHERE id = #{id}")
    public int delete(Integer id);

    @Select("SELECT * FROM song WHERE id = #{id}")
    public Song getSongById(Integer id);

    @Select("SELECT * FROM song")
    public List<Song> allSongs();

    @Select("SELECT * FROM song WHERE name = #{name}")
    public List<Song> getSongByName(String name);

    @Select("SELECT * FROM song WHERE singer_id = #{id}")
    public List<Song> getSongBySingerId(Integer id);

    @Select("select url from song where id = #{id}")
    public String getUrlById(Integer id);

    @Select("select pic from song where id = #{id}")
    public String getPicById(Integer id);

    @Update("update song set pic = #{pic} where id = #{id}")
    public int updateSongPic(Song song);

    @Update("update song set url = #{url} where id = #{id}")
    public int updateSongUrl(Song song);
    @Select("SELECT * FROM song WHERE name LIKE CONCAT('%', #{name}, '%')")
    public List<Song> getSongByFuzzyName(String name);



}
