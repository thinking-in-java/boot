package com.james.service.imp;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.james.dao.OrdersMapper;
import com.james.domain.Orders;
import com.james.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * Author:      James Ben
 * Email:       thinking_in_java@126.com
 * ToDo:        Sail against the current
 * Create Time: 2020/6/7 23:58
 */
@Service
public class OrdersServiceImp  implements IOrdersService {
    @Autowired
    private OrdersMapper ordersMapper;

    /**
     * 添加订单
     * @param orders
     * @return
     */
    @Override
    public int addOrders(Orders orders) {
        return ordersMapper.insertAllColumn(orders);
    }

    /**
     * 查询订单
     * @param orders
     * @return
     */
    @Override
    public List<Orders> findOrders(Orders orders) {
        EntityWrapper<Orders> entity = new EntityWrapper<Orders>();
        // 根据订单地址
        if (!StringUtils.isEmpty(orders.getOrderAddress())) {
            entity.like("ORDER_ADDRESS", orders.getOrderAddress());
        }
        // 根据客户Id
        if (!StringUtils.isEmpty(orders.getOrderCustNo())) {
            entity.eq("ORDER_CUST_NO", orders.getOrderCustNo());
        }

        return ordersMapper.selectList(entity);
    }

    /**
     * 修改订单   根据id修改
     * @param orders
     * @return
     */
    @Override
    public int changeOrders(Orders orders) {

        return ordersMapper.updateById(orders);
    }

    /**
     * 根据订单的id删除该订单
     * @param orderNo
     * @return
     */
    @Override
    public int deleteOrders(Integer orderNo) {
        return ordersMapper.deleteById(orderNo);
    }

    /**
     * 通过订单Id查询该订单信息
     * @param orderNo
     * @return
     */
    @Override
    public Orders findOrdersById(Integer orderNo) {
        return ordersMapper.selectById(orderNo);
    }

    /**
     * 通过id批量删除订单
     * @param list
     * @return
     */
    @Override
    public Integer deleteBatch(List list) {
        return ordersMapper.deleteBatchIds(list);
    }
}
