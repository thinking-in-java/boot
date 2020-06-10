package com.james.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.james.domain.Customer;
import com.james.domain.Msg;
import com.james.domain.Orders;
import com.james.service.ICustomerService;
import com.james.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Author: James Ben Email: thinking_in_java@126.com ToDo: Sail against the current Create Time:
 * 2020/6/8 0:05
 */
@Controller
@RequestMapping("/order")
public class OrderController {
  @Autowired private IOrdersService service;
  @Autowired private ICustomerService customerService;

  /**
   * 查询订单 分页查询订单 根据 客户订单查询 根据收货地址查询
   *
   * @return
   */
  @ResponseBody
  @GetMapping("/orders")
  public Msg selectOrder(
      @RequestParam(value = "pn", defaultValue = "1") Integer pn, Orders orders) {

    PageHelper.startPage(pn, 5);
    List<Orders> ordersList = service.findOrders(orders);
    PageInfo page = new PageInfo(ordersList, 5);

    return Msg.success().add("pageInfo", page);
  }

  /**
   * 通过订单Id查询该笔订单
   *
   * @param orderNo
   * @return
   */
  @ResponseBody
  @GetMapping("/orders/{orderNo}")
  public Msg getOrdersById(@PathVariable("orderNo") Integer orderNo) {
    Orders orders = service.findOrdersById(orderNo);
    if (orders != null) {
      return Msg.success().add("orders", orders);
    }
    return Msg.fail();
  }

  /**
   * 添加订单 信息
   *
   * @param orders
   * @return
   */
  @PostMapping("/orders")
  @ResponseBody
  public Msg addOrders(Orders orders) {
    // 创建Date对象
    Date date = new Date();
    // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
    Timestamp timeStamp = new Timestamp(date.getTime());
    orders.setOrderDate(timeStamp);
    int row = service.addOrders(orders);
    if (row > 0) {
      return Msg.success();
    }
    return Msg.fail();
  }

  /**
   * 修改订单信息
   *
   * @param orders
   * @return
   */
  @ResponseBody
  @PutMapping("/orders/{orderNo}")
  public Msg changeOrders(Orders orders) {
    int row = service.changeOrders(orders);
    if (row > 0) {
      return Msg.success();
    }
    return Msg.fail();
  }

  /**
   * 根据id删除用户信息 注意:单个批量二合一 如:1-2-3-4-5 Q @param orderNo
   *
   * @return
   */
  @ResponseBody
  @DeleteMapping("/orders/{orderNo}")
  public Msg deleteOrders(@PathVariable("orderNo") String orderNo) {
    if (orderNo.contains("-")) {
      // 包含"-"就是批量删除
      String[] split = orderNo.split("-");
      List list = new ArrayList();
      for (String s : split) {
        list.add(Integer.parseInt(s));
      }
      // 批量删除
      int integer = service.deleteBatch(list);
      if (integer > 0) {
        return Msg.success();
      }
    } else { // 单个删除
      int i = service.deleteOrders(Integer.parseInt(orderNo));
      if (i > 0) {
        return Msg.success();
      }
    }
    return Msg.fail();
  }

  /**
   * 根据客户id 查询有无该用户
   *
   * @param orderCustNo
   * @return
   */
  @ResponseBody
  @GetMapping("/findCusts")
  public Msg selectCusts(Integer orderCustNo) {
    Customer customerById = customerService.getCustomerById(orderCustNo);
    if (customerById != null) {
      return Msg.success();
    }
    return Msg.fail();
  }
}
