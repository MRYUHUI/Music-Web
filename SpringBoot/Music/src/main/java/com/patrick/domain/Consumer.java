package com.patrick.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 前端用户
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Consumer {
    @TableField(value = "id")
    private Integer id;

    @TableField(value = "username")
    private String username;

    @TableField(value = "password")
    private String password;

    @TableField(value = "sex")
    private Integer sex;

    @TableField(value = "phone_num")
    private String phoneNum;

    @TableField(value = "email")
    private String email;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @TableField(value = "birth")
    private Date birth;

    @TableField(value = "introduction")
    private String introduction;

    @TableField(value = "location")
    private String location;

    @TableField(value = "avatar")
    private String avatar;

    @TableField(value = "create_time")
    private Date createTime;

    @TableField(value = "update_time")
    private Date updateTime;
}
