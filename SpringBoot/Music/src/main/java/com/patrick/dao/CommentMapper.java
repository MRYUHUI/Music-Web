package com.patrick.dao;

import com.patrick.domain.Comment;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface CommentMapper {

    @Insert("INSERT INTO comment (user_id, type, song_id, song_list_id, content, create_time, up) " +
            "VALUES (#{userId}, #{type}, #{songId}, #{songListId}, #{content}, NOW(), #{up})")
    public int insert(Comment comment);

    @Update("<script>" +
            "UPDATE comment " +
            "<set>" +
            "<if test='userId != null'>user_id = #{userId},</if>" +
            "<if test='type != null'>type = #{type},</if>" +
            "<if test='songId != null'>song_id = #{songId},</if>" +
            "<if test='songListId != null'>song_list_id = #{songListId},</if>" +
            "<if test='content != null'>content = #{content},</if>" +
            "<if test='up != null'>up = #{up},</if>" +
            "</set>" +
            "WHERE id = #{id}" +
            "</script>")
    public int update(Comment comment);

    @Delete("DELETE FROM comment WHERE id = #{id}")
    public int delete(int id);

    @Select("SELECT * FROM comment")
    @Results({
            // Mapping of result set columns to object properties
    })
    public List<Comment> getAllComment();

    @Select("SELECT * FROM comment WHERE song_id = #{songId}")
    public List<Comment> getCommentBySongId(Integer songId);

    @Select("SELECT * FROM comment WHERE song_list_id = #{songListId}")
    public List<Comment> getCommentBySongListId(Integer songListId);
    @Update("UPDATE comment SET up = #{up} WHERE id = #{id}")
    public int setUp(Integer id, Integer up);
}
