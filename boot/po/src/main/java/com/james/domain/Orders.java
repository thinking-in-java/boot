package com.james.domain;

import com.baomidou.mybatisplus.annotations.KeySequence;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * (Orders)实体类
 *
 * @author James Ben
 * @since 2020-06-07 23:48:10
 */
@Data
@KeySequence(value = "S_ORDER",clazz = Integer.class)
public class Orders implements Serializable {
  private static final long serialVersionUID = 756933582166046164L;
  // 订单号
  @TableId( type = IdType.INPUT)
  private Integer orderNo;
  // 客户ID
  private Integer orderCustNo;
  // 订单日期
  private Date orderDate;
  // 订单地址
  private String orderAddress;
  // 订单状态 0未支付    1已支付
  private Integer orderStatus;
}
