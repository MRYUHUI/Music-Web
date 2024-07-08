package com.patrick.dao;

import com.patrick.domain.UserSupport;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserSupportMapper {

    @Select("SELECT COUNT(*) FROM user_support WHERE comment_id = #{commentId} AND user_id = #{userId}")
    public int isUserSupportExist(UserSupport userSupport);

    @Delete("DELETE FROM user_support WHERE comment_id = #{commentId} AND user_id = #{userId}")
    public int delete(UserSupport userSupport);

    @Insert("INSERT INTO user_support (comment_id, user_id) VALUES (#{commentId}, #{userId})")
    public int insert(UserSupport userSupport);

}
