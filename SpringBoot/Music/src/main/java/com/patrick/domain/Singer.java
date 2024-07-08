package com.patrick.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Singer {
    @TableField(value = "id")
    private Integer id;

    @TableField(value = "name")
    private String name;

    @TableField(value = "sex")
    private Integer sex;

    @TableField(value = "pic")
    private String pic;

    @TableField(value = "birth")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date birth;

    @TableField(value = "location")
    private String location;

    @TableField(value = "introduction")
    private String introduction;
}
