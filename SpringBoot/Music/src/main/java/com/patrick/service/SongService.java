package com.patrick.service;

import com.patrick.domain.Singer;
import com.patrick.domain.Song;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * 歌曲service接口
 */
public interface SongService {

    public boolean insert(Song song);


    public boolean update(Song song);

    public boolean delete(Integer id);

    public Song getSongById(Integer id);

    public List<Song> allSongs();

    public List<Song> getSongByName(String name);

    public List<Song> getSongBySingerId(Integer id);

    public String getUrlById(Integer id);

    public boolean updateSongPic(Song song);

    public String getPicById(Integer id);

    public boolean updateSongUrl(Song song);

    public List<Song> getSongByFuzzyName(String name);
}

