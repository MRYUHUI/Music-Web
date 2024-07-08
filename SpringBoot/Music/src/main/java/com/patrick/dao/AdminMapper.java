package com.patrick.dao;

import com.patrick.domain.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AdminMapper {

    @Select("select count(*) from admin where name = #{username} and password = #{pwd}")
    public int verifyPassword(String username, String pwd);

    @Select("SELECT * FROM admin WHERE name = #{username} AND password = #{pwd}")
    public Admin getAdminByUsernameAndPassword(@Param("username") String username, @Param("pwd") String pwd);


}
