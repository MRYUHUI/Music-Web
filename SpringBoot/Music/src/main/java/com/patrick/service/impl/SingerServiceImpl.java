package com.patrick.service.impl;

import com.patrick.dao.SingerMapper;
import com.patrick.domain.Singer;
import com.patrick.service.SingerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 歌手service實現類
 */
@Service
public class SingerServiceImpl implements SingerService {
    @Autowired
    private SingerMapper singerMapper;


    /**
     * Add a singer
     *
     * @param singer
     */
    @Override
    public boolean insert(Singer singer) {
        return singerMapper.insert(singer) > 0;
    }

    @Override
    public String getPicById(Integer id) {
        return singerMapper.getPicById(id);
    }

    /**
     * Update a singer
     *
     * @param singer
     */
    @Override
    public boolean update(Singer singer) {
        return singerMapper.update(singer) > 0;
    }

    /**
     * Delete a singer
     *
     * @param id
     */
    @Override
    public boolean delete(Integer id) {
        return singerMapper.delete(id) > 0;
    }

    /**
     * Get a singer by PK
     *
     * @param id
     */
    @Override
    public Singer getSingerById(Integer id) {
        return singerMapper.getSingerById(id);
    }

    /**
     * Select all singers
     */
    @Override
    public List<Singer> allSingers() {
        return singerMapper.allSingers();
    }

    /**
     * Fuzzy query by name of singer
     *
     * @param name
     */
    @Override
    public List<Singer> getSingerByFuzzyName(String name) {
        return singerMapper.getSingerByFuzzyName(name);
    }

    @Override
    public boolean updateSingerPic(Singer singer) {
        return singerMapper.updateSingerPic(singer) > 0;
    }

    /**
     * Select singer by sex
     *
     * @param sex
     */
    @Override
    public List<Singer> getSingerBySex(Integer sex) {
        return singerMapper.getSingerBySex(sex);
    }
}
