package com.james.service;

import com.james.domain.Orders;

import java.util.List;

/**
 * Author:      James Ben
 * Email:       thinking_in_java@126.com
 * ToDo:        Sail against the current
 * Create Time: 2020/6/7 23:58
 */
public interface IOrdersService {
    /**
     * 添加订单
     * @param orders
     * @return
     */
    public  int addOrders(Orders orders);

    /**
     * 查询订单
     * @param orders
     * @return
     */
    public  List<Orders> findOrders(Orders orders);

    /**
     * 修改订单  只能修改 订单状态 和 收获地址
     * @param orders
     * @return
     */
    public int changeOrders(Orders orders);

    /**
     * 逻辑删除该用户
     * @param orderNo
     * @return
     */
    public int deleteOrders(Integer orderNo);

    /**
     * 通过订单id 查询该订单
     * @param orderNo
     * @return
     */
    public  Orders findOrdersById(Integer orderNo);

    /**
     * 通过订单Id批量删除 用户
     * @param list
     * @return
     */
    public Integer deleteBatch(List list);
}
