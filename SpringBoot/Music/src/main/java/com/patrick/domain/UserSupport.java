package com.patrick.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserSupport {
    @TableField("id")
    private int id;

    @TableField("comment_id")
    private int commentId;

    @TableField("user_id")
    private int userId;

}
