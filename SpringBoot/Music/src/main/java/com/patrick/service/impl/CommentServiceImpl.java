package com.patrick.service.impl;

import com.patrick.dao.CommentMapper;
import com.patrick.domain.Comment;
import com.patrick.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {


    @Autowired
    private CommentMapper commentMapper;

    @Override
    public boolean insert(Comment comment) {
        return commentMapper.insert(comment) > 0;
    }

    @Override
    public boolean setUp(Integer id, Integer up) {
        return commentMapper.setUp(id, up) > 0;
    }

    @Override
    public boolean update(Comment comment) {
        return commentMapper.update(comment) > 0;
    }

    @Override
    public boolean delete(int id) {
        return commentMapper.delete(id) > 0;
    }

    @Override
    public List<Comment> getAllComment() {
        return commentMapper.getAllComment();
    }

    @Override
    public List<Comment> getCommentBySongId(Integer songId) {
        return commentMapper.getCommentBySongId(songId);
    }

    @Override
    public List<Comment> getCommentBySongListId(Integer songListId) {
        return commentMapper.getCommentBySongListId(songListId);
    }
}
