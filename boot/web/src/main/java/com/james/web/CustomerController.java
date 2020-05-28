package com.james.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.james.domain.BaseDict;
import com.james.domain.Customer;
import com.james.domain.Msg;
import com.james.service.IBaseDictService;
import com.james.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Author: James Ben Email: thinking_in_java@126.com ToDo: Sail against the current Create Time:
 * 2020/5/27 10:18
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {
  // 依赖注入
  @Autowired private ICustomerService customerService;
  @Autowired private IBaseDictService baseDictService;
  // 客户来源
  @Value("${customer.from.type}")
  private String FROM_TYPE;
  // 客户所属行业
  @Value("${customer.industry.type}")
  private String INDUSTRY_TYPE;
  // 客户级别
  @Value("${customer.level.type}")
  private String LEVEL_TYPE;
  /**
   * 查询客户来源
   *
   * @return
   */
  @GetMapping("/customerFrom")
  @ResponseBody
  public Msg findForm_type() {
    List<BaseDict> baseDictByTypeCode = baseDictService.findBaseDictByTypeCode(FROM_TYPE);
    return Msg.success().add("Form_type", baseDictByTypeCode);
  }
  /**
   * 查询客户行业
   *
   * @return
   */
  @GetMapping("/custIndustry")
  @ResponseBody
  public Msg industry_type() {
    List<BaseDict> baseDictByTypeCode = baseDictService.findBaseDictByTypeCode(INDUSTRY_TYPE);
    return Msg.success().add("industry_type", baseDictByTypeCode);
  }
  /**
   * 查询客户级别
   *
   * @return
   */
  @GetMapping("/custLevel")
  @ResponseBody
  public Msg level_type() {
    List<BaseDict> baseDictByTypeCode = baseDictService.findBaseDictByTypeCode(LEVEL_TYPE);
    return Msg.success().add("level_type", baseDictByTypeCode);
  }

  /*restful开始*/
  /**
   * 查询客户数据（分页查询）
   * @return
   */
  @GetMapping("/customers")
  @ResponseBody
  public Msg getCustsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Customer customer) {
    System.out.println(customer.getCustName());
    System.out.println(customer.getCustLevel());
    System.out.println(customer.getCustIndustry());
    System.out.println(customer.getCustSource());
    // 引入PageHelper分页插件
    // 在查询之前只需要调用，传入页码，以及每页的大小
    PageHelper.startPage(pn, 5);
    // startPage后面紧跟的这个查询就是一个分页查询
    List<Customer> customers = customerService.findCustomerList(customer);
    // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
    // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
    PageInfo page = new PageInfo(customers, 5);
    return Msg.success().add("pageInfo", page);
  }
}
