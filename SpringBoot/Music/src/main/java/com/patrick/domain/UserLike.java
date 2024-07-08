package com.patrick.domain;

import com.alibaba.druid.filter.AutoLoad;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("user_like")
public class UserLike {
    @TableField("id")
    private int id;

    @TableField("user_id")
    private int userId;

    @TableField("type")
    private int type;

    @TableField("song_id")
    private int songId;

    @TableField("song_list_id")
    private int songListId;

    @TableField("create_time")
    private Date createTime;
}
