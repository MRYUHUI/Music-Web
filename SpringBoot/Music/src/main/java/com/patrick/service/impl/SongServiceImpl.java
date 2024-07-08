package com.patrick.service.impl;

import com.patrick.dao.SingerMapper;
import com.patrick.dao.SongMapper;
import com.patrick.domain.Singer;
import com.patrick.domain.Song;
import com.patrick.service.SingerService;
import com.patrick.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 歌手service實現類
 */
@Service
public class SongServiceImpl implements SongService {
    @Autowired
    private SongMapper songMapper;

    @Override
    public boolean insert(Song song) {
        return songMapper.insert(song) > 0;
    }

    @Override
    public boolean update(Song song) {
        return songMapper.update(song) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return songMapper.delete(id) > 0;

    }

    @Override
    public Song getSongById(Integer id) {
        return songMapper.getSongById(id);
    }

    @Override
    public List<Song> getSongByFuzzyName(String name) {
        return songMapper.getSongByFuzzyName(name);
    }

    @Override
    public List<Song> allSongs() {
        return songMapper.allSongs();
    }

    @Override
    public List<Song> getSongByName(String name) {
        return songMapper.getSongByName(name);
    }

    @Override
    public boolean updateSongUrl(Song song) {
        return songMapper.updateSongUrl(song) > 0;
    }

    @Override
    public String getPicById(Integer id) {
        return songMapper.getPicById(id);
    }

    @Override
    public boolean updateSongPic(Song song) {
        return songMapper.updateSongPic(song) > 0;
    }

    @Override
    public String getUrlById(Integer id) {
        return songMapper.getUrlById(id);
    }

    @Override
    public List<Song> getSongBySingerId(Integer id) {
        return songMapper.getSongBySingerId(id);
    }
}
