package com.patrick.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("banner")
public class Banner {
    @TableId
    private Integer id;

    @TableField(value = "pic")
    private String pic;

    @TableField(value = "title")
    private String title;
}
