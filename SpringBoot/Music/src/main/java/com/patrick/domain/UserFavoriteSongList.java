package com.patrick.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author:
 * @Date: 2024-05-09-21:17
 * @Description:
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("user_favorite_songlist")
public class UserFavoriteSongList {
    @TableField("id")
    private int id;

    @TableField("song_list_id")
    private int songListId;

    @TableField("user_id")
    private int userId;
}
