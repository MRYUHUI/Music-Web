package com.patrick.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("list_song")
public class ListSong {
    @TableField("id")
    private Integer id;

    @TableField("song_id")
    private Integer songId;

    @TableField("song_list_id")
    private Integer songListId;

    // 构造方法、Getter 和 Setter 省略
}