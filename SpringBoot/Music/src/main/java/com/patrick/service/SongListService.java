package com.patrick.service;

import com.patrick.domain.SongList;

import java.util.List;

public interface SongListService {
    public boolean insert(SongList songList);

    public boolean update(SongList songList);

    public boolean delete(Integer id);

    public SongList getSongListById(Integer id);

    public List<SongList> allSongList();

    public List<SongList> getSongListByTitle(String title);

    public List<SongList> getSongListByFuzzyTitle(String title);

    public List<SongList> getSongListByStyle(String style);

}
