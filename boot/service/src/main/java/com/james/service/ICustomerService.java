package com.james.service;

import com.james.domain.Customer;

import java.util.List;

/**
 * 客户接口
 *
 * @author Mr.YiQuan
 * @since 2020-04-24 16:02:38
 */
public interface ICustomerService {
  // 带条件查询用户查询客户列表
  public List<Customer> findCustomerList(Customer customer);
  // 创建用户
  public int createCustomer(Customer customer);

  // 通过id查询客户
  public Customer getCustomerById(Integer id);
  // 更新客户
  public int updateCustomer(Customer customer);
  // 删除客户
  public int deleteCustomer(Integer id);
  // 批量删除用户
  public int deleteBatch(List list);
  // 根据用户名查询用户是否存在
  public int customerCheck(String custName);
}
