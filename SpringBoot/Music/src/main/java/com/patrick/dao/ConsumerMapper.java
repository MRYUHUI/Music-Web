package com.patrick.dao;

import com.patrick.domain.Consumer;
import com.patrick.utils.Consts;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface ConsumerMapper {
    @Insert("INSERT INTO consumer (username, password, sex, phone_num, email, birth, introduction, location, avatar, create_time, update_time) " +
            "VALUES (#{username}, #{password}, #{sex}, #{phoneNum}, #{email}, #{birth}, #{introduction}, #{location}, #{avatar}, NOW(), #{updateTime})")
    public int insert(Consumer consumer);

    @Update({
            "<script>",
            "UPDATE consumer",
            "<set>",
            "<if test='username != null and username.trim().length() > 0'>username = #{username},</if>",
            "<if test='password != null and password.trim().length() > 0'>password = #{password},</if>",
            "<if test='sex != null'>sex = #{sex},</if>",
            "<if test='phoneNum != null and phoneNum.trim().length() > 0'>phone_num = #{phoneNum},</if>",
            "<if test='email != null and email.trim().length() > 0'>email = #{email},</if>",
            "<if test='birth != null'>birth = #{birth},</if>",
            "<if test='introduction != null and introduction.trim().length() > 0'>introduction = #{introduction},</if>",
            "<if test='location != null and location.trim().length() > 0'>location = #{location},</if>",
            "<if test='avatar != null and avatar.trim().length() > 0'>avatar = #{avatar},</if>",
            "<if test='createTime != null'>create_time = #{createTime},</if>",
            "update_time = NOW(),", // Set update_time to current time
            "</set>",
            "WHERE id = #{id}",
            "</script>"
    })
    public int update(Consumer consumer);

    @Select("SELECT * FROM consumer")
    public List<Consumer> allConsumer();

    @Select("SELECT COUNT(*) FROM consumer WHERE id = #{id}")
    public Integer isExist(Integer id);

    @Select("SELECT * FROM consumer WHERE id = #{id}")
    public Consumer getConsumerById(Integer id);

    @Select("SELECT COUNT(*) FROM consumer WHERE username = #{username} AND password = #{password}")
    public int verifyPassword(String username, String password);

    @Select("SELECT * FROM consumer WHERE username = #{username}")
    public Consumer getConsumerByUsername(String username);

    @Delete("DELETE FROM consumer WHERE id = #{id}")
    public int delete(Integer id);

    @Select("SELECT COUNT(*) FROM consumer WHERE username = #{username}")
    public int countUserByUserName(String username);

    @Select("SELECT playlist_id FROM  user_create_songlist WHERE user_id = #{userId}")
    public List<Integer> getPlayListByUserId(Integer userId);
}
