package com.patrick.domain;

/**
 * @Author:
 * @Date: 2024-04-13-19:00
 * @Description:
 */
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("user_play_history")
public class PlayHistory {
    @TableField("id")
    private int id;

    @TableField("user_id")
    private int userId;

    @TableField("song_id")
    private int songId;

    @TableField("play_time")
    private Date playTime;


}