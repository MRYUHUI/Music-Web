package com.patrick.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Rank {
    @TableField("id")
    private int id;

    @TableField("song_list_id")
    private int songListId;

    @TableField("consumer_id")
    private int consumerId;

    @TableField("score")
    private int score;

}
