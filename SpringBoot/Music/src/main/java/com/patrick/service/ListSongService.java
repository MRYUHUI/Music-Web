package com.patrick.service;

import com.patrick.domain.ListSong;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ListSongService {
    public boolean insert(ListSong listSong);

    public boolean delete(Integer id);

    public  boolean deleteBySongIdAndSongListId(ListSong listSong);

    public ListSong getListSongById(Integer id);

    public List<ListSong> allListSong();

    public List<ListSong> getListSongBySongListId(Integer songListId);

    public boolean isExist(ListSong listSong);
}
