package com.james.domain;

import com.baomidou.mybatisplus.annotations.KeySequence;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;

/**
 * (SysUser)实体类
 * @author  Mr.YiQuan
 * @since 2020-04-24 16:03:24
 */
@Data
@TableName("sys_user")
@KeySequence(value = " S_SYSUSER",clazz = Integer.class)
public class User implements Serializable {
    /**
    * 用户id
    */
    @TableId( type = IdType.INPUT)
    private Integer userId;
    /**
    * 用户账号
    */
    private String userCode;
    /**
    * 用户名称
    */
    private String userName;
    /**
    * 用户密码
    */
    private String userPassword;
    /**
     * 用户手机号
     */
    private String phone;
    /**
     * 验证码
     */
    @TableField(exist = false)
    private String validateCode;
    /**
    * 1:正常,0:暂停
    */
    private Integer userState;

}