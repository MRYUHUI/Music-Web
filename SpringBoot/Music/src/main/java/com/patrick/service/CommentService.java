package com.patrick.service;

import com.patrick.domain.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentService {
    public boolean insert(Comment comment);

    public boolean update(Comment comment);

    public boolean delete(int id);
    public List<Comment> getAllComment();

    public List<Comment> getCommentBySongId(@Param("songId") Integer songId);

    public List<Comment> getCommentBySongListId(@Param("songListId") Integer songListId);

    public boolean setUp(Integer id, Integer up);


}
