package com.james.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.james.domain.Customer;

import java.util.List;

/** Create Time:16:10 16:10 Author :Mr.YiQuan ToDo :Sail against the current Customer接口 */
public interface CustomerMapper extends BaseMapper<Customer> {


  public List<Customer> findCustomers(Customer customer);
}
