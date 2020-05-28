package com.james.service.imp;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.james.dao.CustomerMapper;
import com.james.domain.Customer;
import com.james.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * 客户管理
 *
 * @author Mr.YiQuan
 * @since 2020-04-24 16:02:38 数据字典Service接口实现类
 */
@Service("customerService")
@Transactional
public class CustomerServiceImp implements ICustomerService {
  // 声明DAO属性并注入
  @Autowired private CustomerMapper customermapper;

  @Override
  public List<Customer> findCustomerList(Customer customer) {
    return customermapper.findCustomers(customer);
  }

  /**
   * 创建用户
   *
   * @param customer
   * @return
   */
  @Override
  public int createCustomer(Customer customer) {
    return customermapper.insert(customer);
  }

  /**
   * 通过id查询用户
   *
   * @param id
   * @return
   */
  @Override
  public Customer getCustomerById(Integer id) {
    return customermapper.selectById(id);
  }
  /**
   * 通过id更新用户
   *
   * @param customer
   * @return
   */
  @Override
  public int updateCustomer(Customer customer) {
    return customermapper.updateById(customer);
  }

  /**
   * 通过id删除客户
   *
   * @param id
   * @return
   */
  @Override
  public int deleteCustomer(Integer id) {
    return customermapper.deleteById(id);
  }
}
