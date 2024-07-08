package com.patrick.domain;

/**
 * @Author:
 * @Date: 2024-04-14-15:47
 * @Description:
 */

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("user_create_songlist")
public class UserCreateSongList {
    @TableField("id")
    private int id;

    @TableField("song_list_id")
    private int songListId;

    @TableField("user_id")
    private int userId;
}