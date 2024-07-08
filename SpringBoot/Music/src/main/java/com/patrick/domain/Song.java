package com.patrick.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Song {
    @TableField("id")
    private int id;

    @TableField("singer_id")
    private int singerId;

    @TableField("name")
    private String name;

    @TableField("introduction")
    private String introduction;

    @TableField("create_time")
    private Date createTime;

    @TableField("update_time")
    private Date updateTime;

    @TableField("pic")
    private String pic;

    @TableField("lyric")
    private String lyric;

    @TableField("url")
    private String url;
}
