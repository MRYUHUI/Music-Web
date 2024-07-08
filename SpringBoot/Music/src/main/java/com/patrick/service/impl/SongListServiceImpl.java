package com.patrick.service.impl;

import com.patrick.dao.SongListMapper;
import com.patrick.domain.SongList;
import com.patrick.service.SongListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SongListServiceImpl  implements SongListService {
    @Override
    public List<SongList> getSongListByStyle(String style) {
        return songListMapper.getSongListByStyle(style);
    }

    @Autowired
    private SongListMapper songListMapper;
    @Override
    public boolean insert(SongList songList) {
        return songListMapper.insert(songList) > 0;
    }

    @Override
    public boolean update(SongList songList) {
        return songListMapper.update(songList) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return songListMapper.delete(id) > 0;
    }

    @Override
    public SongList getSongListById(Integer id) {
        return songListMapper.getSongListById(id);
    }

    @Override
    public List<SongList> allSongList() {
        return songListMapper.allSongList();
    }

    @Override
    public List<SongList> getSongListByTitle(String title) {
        return songListMapper.getSongListByTitle(title);
    }

    @Override
    public List<SongList> getSongListByFuzzyTitle(String title) {
        return songListMapper.getSongListByFuzzyTitle(title);
    }
}
