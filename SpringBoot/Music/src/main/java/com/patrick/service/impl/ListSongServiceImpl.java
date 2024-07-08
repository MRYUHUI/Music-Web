package com.patrick.service.impl;

import com.patrick.dao.ListSongMapper;
import com.patrick.domain.ListSong;
import com.patrick.service.ListSongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ListSongServiceImpl implements ListSongService {
    @Autowired
    private ListSongMapper listSongMapper;

    @Override
    public List<ListSong> getListSongBySongListId(Integer songListId) {
        return listSongMapper.getListSongBySongListId(songListId);
    }

    @Override
    public boolean isExist(ListSong listSong) {
        return listSongMapper.isExist(listSong) > 0;
    }

    @Override
    public boolean insert(ListSong listSong) {
        return listSongMapper.insert(listSong) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return listSongMapper.delete(id) > 0;
    }

    @Override
    public boolean deleteBySongIdAndSongListId(ListSong listSong) {
        return listSongMapper.deleteBySongIdAndSongListId(listSong) > 0;
    }

    @Override
    public ListSong getListSongById(Integer id) {
        return listSongMapper.getListSongById(id);
    }

    @Override
    public List<ListSong> allListSong() {
        return listSongMapper.allListSong();
    }
}
