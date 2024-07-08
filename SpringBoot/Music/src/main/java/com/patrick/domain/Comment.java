package com.patrick.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    @TableField("id")
    private int id;

    @TableField("user_id")
    private int userId;

    @TableField("type")
    private boolean type;

    @TableField("song_id")
    private int songId;

    @TableField("song_list_id")
    private int songListId;

    @TableField("content")
    private String content;

    @TableField("create_time")
    private Date createTime;

    @TableField("up")
    private int up;
}
