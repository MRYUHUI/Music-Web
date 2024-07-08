package com.patrick.service;

import com.patrick.domain.Singer;

import java.util.List;

/**
 * 歌手service接口
 */
public interface SingerService {
    /**
     * Add a singer
     */
    public boolean insert(Singer singer);

    /**
     * Update a singer
     */
    public boolean update(Singer singer);

    /**
     * Delete a singer
     */
    public boolean delete(Integer id);

    /**
     * Get a singer by PK
     */
    public Singer getSingerById(Integer id);

    /**
     * Select all singers
     */
    public List<Singer> allSingers();

    /**
     * Fuzzy query by name of singer
     */
    public List<Singer> getSingerByFuzzyName(String name);

    /**
     * Select singer by sex
     */
    public List<Singer> getSingerBySex(Integer sex);

    public boolean updateSingerPic(Singer singer);

    public String getPicById(Integer id);
}

