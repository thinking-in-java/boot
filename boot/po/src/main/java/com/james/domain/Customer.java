package com.james.domain;

import com.baomidou.mybatisplus.annotations.KeySequence;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.util.Date;

/**
 * (Customer)实体类
 *
 * @author Mr.YiQuan
 * @since 2020-04-24 16:03:13
 */
@Data
@KeySequence(value = "S_CUSTOMER",clazz = Integer.class)
public class Customer implements Serializable {
  /** 客户编号(主键) */
  @TableId( type = IdType.INPUT)
  private Integer custId;
  /** 客户名称 */
  @Pattern(regexp = "(^[a-zA-Z0-9_-]{2,16}$)|(^[\\u2E80-\\u9FFF]{2,5})", message = "客户姓名不正确")
  private String custName;
  /** 负责人id */
  @TableField(value = "")
  private Integer custUserId;
  /** 创建人id */
  private Integer custCreateId;
  /** 客户信息来源 */

  private String custSource;
  /** 客户所属行业 */
  private String custIndustry;
  /** 客户级别 */
  private String custLevel;
  /** 联系人 */
  private String custLinkman;
  /** 固定电话 */
  private String custPhone;
  /** 移动电话 */
  private String custMobile;
  /** 邮政编码 */
  private String custZipcode;
  /** 联系地址 */
  private String custAddress;
  /** 创建时间 */
  private Date custCreatetime;

}
