package com.james.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * (BaseDict)实体类
 * @author Mr.YiQuan
 * @since 2020-04-24 16:02:38
 */
@Data
public class BaseDict implements Serializable {
    /**
     * 数据字典id(主键)
     */
    private String dictId;
    /**
     * 数据字典类别代码
     */
    private String dictTypeCode;
    /**
     * 数据字典类别名称
     */
    private String dictTypeName;
    /**
     * 数据字典项目名称
     */
    private String dictItemName;
    /**
     * 数据字典项目代码(可为空)
     */
    private String dictItemCode;
    /**
     * 排序字段
     */
    private Integer dictSort;
    /**
     * 1:使用 0:停用
     */
    private String dictEnable;
    /**
     * 备注
     */
    private String dictMemo;
}