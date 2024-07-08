package com.patrick.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("song_list")
public class SongList {
    @TableField("id")
    private int id;

    @TableField("title")
    private String title;

    @TableField("pic")
    private String pic;

    @TableField("introduction")
    private String introduction;

    @TableField("style")
    private String style;
}
