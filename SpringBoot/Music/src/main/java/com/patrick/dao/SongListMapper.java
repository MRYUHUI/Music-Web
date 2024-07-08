package com.patrick.dao;

import com.patrick.domain.Song;
import com.patrick.domain.SongList;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface SongListMapper {
    @Insert("INSERT INTO song_list (title, pic, introduction, style) VALUES (#{title}, #{pic}, #{introduction}, #{style})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    public int insert(SongList songList);
//    只有提供不为空的属性才会被更新
    @Update({
            "<script>",
            "UPDATE song_list",
            "<set>",
            "<if test='pic != null'>pic = #{pic},</if>",
            "<if test='title != null'>title = #{title},</if>",
            "<if test='introduction != null'>introduction = #{introduction},</if>",
            "<if test='style != null'>style = #{style},</if>",
            "</set>",
            "WHERE id = #{id}",
            "</script>"
    })
    public int update(SongList songList);

    @Delete("DELETE FROM song_list WHERE id = #{id}")
    public int delete(Integer id);

    @Select("SELECT * FROM song_list WHERE id = #{id}")
    public SongList getSongListById(Integer id);

    @Select("SELECT * FROM song_list")
    public List<SongList> allSongList();

    @Select("SELECT * FROM song_list WHERE title = #{title}")
    public List<SongList> getSongListByTitle(String title);
    @Select("SELECT * FROM song_list WHERE title LIKE CONCAT('%', #{title}, '%')")
    public List<SongList> getSongListByFuzzyTitle(String title);
    @Select("SELECT * FROM song_list WHERE style = #{style}")
    public  List<SongList> getSongListByStyle(String style);
}
