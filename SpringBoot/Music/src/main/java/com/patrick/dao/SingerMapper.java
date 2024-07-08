package com.patrick.dao;

import com.patrick.domain.Singer;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface SingerMapper {
    /**
     * add a singer
     */
    @Insert("INSERT INTO singer (name, sex, pic, birth, location, introduction) " +
            "VALUES (#{name}, #{sex}, #{pic}, #{birth}, #{location}, #{introduction})")
    public int insert(Singer singer);

    /**
     * update a singer
     */
    @Update("UPDATE singer SET name = #{name}, sex = #{sex}, pic = #{pic}, birth = #{birth}, location = #{location}, introduction = #{introduction} WHERE id = #{id}")
    public int update(Singer singer);

    /**
     * delete a  singer
     */
    @Delete("DELETE FROM singer WHERE id = #{id}")
    public int delete(Integer id);

    /**
     * get a singer by PK
     */
    @Select("select * from singer where id = #{id}")
    public Singer getSingerById(Integer id);

    /**
     * select all singers
     */
    @Select("SELECT * FROM singer")
    public List<Singer> allSingers();

    /**
     * fuzzy query by name of singer
     */
    @Select("SELECT * FROM singer WHERE name LIKE CONCAT('%', #{name}, '%')")
    public List<Singer> getSingerByFuzzyName(String name);

    /**
     * select singer by sex
     */
    @Select("SELECT * FROM singer WHERE sex = #{sex}")
    public List<Singer> getSingerBySex(Integer sex);

    @Update("update singer set pic = #{pic} where id = #{id}")
    public int updateSingerPic(Singer singer);

    @Select("select pic from singer where id = #{id}")
    public String getPicById(Integer id);
}
