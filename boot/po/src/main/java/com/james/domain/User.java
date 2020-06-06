package com.james.domain;

import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * (SysUser)实体类
 * @author  Mr.YiQuan
 * @since 2020-04-24 16:03:24
 */
@Data
@TableName("sys_user")
public class User implements Serializable {
    /**
    * 用户id
    */
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
    * 1:正常,0:暂停
    */
    private Integer userState;

}