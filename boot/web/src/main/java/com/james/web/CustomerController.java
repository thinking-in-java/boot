package com.james.web;

import java.util.HashMap;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.james.domain.BaseDict;
import com.james.domain.Customer;
import com.james.domain.Msg;
import com.james.domain.User;
import com.james.service.IBaseDictService;
import com.james.service.ICustomerService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
   *
   * @return
   */
  @GetMapping("/customers")
  @ResponseBody
  public Msg getCustsWithJson(
      @RequestParam(value = "pn", defaultValue = "1") Integer pn, Customer customer) {

    PageHelper.startPage(pn, 5);
    List<Customer> customers = customerService.findCustomerList(customer);
    PageInfo page = new PageInfo(customers, 5);

    // 客户来源
    List<BaseDict> source = baseDictService.findBaseDictByTypeCode(FROM_TYPE);
    // 客户行业
    List<BaseDict> Industry = baseDictService.findBaseDictByTypeCode(INDUSTRY_TYPE);
    // 客户级别
    List<BaseDict> level = baseDictService.findBaseDictByTypeCode(LEVEL_TYPE);
    return Msg.success()
        .add("pageInfo", page)
        .add("source", source)
        .add("Industry", Industry)
        .add("level", level);
  }

  /**
   * 保存客户信息
   *
   * @param customer
   * @return
   */
  @PostMapping("/customers")
  @ResponseBody
  public Msg customerCreate(@Valid Customer customer, BindingResult result) {
    System.out.println(customer);
    if (result.hasErrors()) { // 校验失败
      Map<String, Object> map = new HashMap<String, Object>();
      List<FieldError> fieldErrors = result.getFieldErrors();
      for (FieldError fieldError : fieldErrors) {
        // 获取错误字段
        // 获取错误字段信息
        map.put(fieldError.getField(), fieldError.getDefaultMessage());
      }
      return Msg.fail().add("errors", map);

    } else { // 校验成功
      Subject currentUser = SecurityUtils.getSubject();
      User user = (User) currentUser.getPrincipal();
      // 将当前用户id存储在客户对象中
      customer.setCustCreateId(user.getUserId());
      // 创建Date对象
      Date date = new Date();
      // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
      Timestamp timeStamp = new Timestamp(date.getTime());
      customer.setCustCreatetime(timeStamp);
      // 执行Service层中的创建方法，返回的是受影响的行数
      int rows = customerService.createCustomer(customer);
      if (rows > 0) {
        return Msg.success().add("msg", "添加成功!");
      } else {
        return Msg.fail().add("msg", "添加失败!");
      }
    }
  }

  /**
   * 通过名称查询该用户是否存在
   *
   * @param custName
   * @return
   */
  @GetMapping("/checkCustName")
  @ResponseBody
  public Msg customerCheck(String custName) {
    int rows = customerService.customerCheck(custName);
    if (rows > 0) {
      return Msg.success();
    } else {
      return Msg.fail();
    }
  }
  /** 通过id获取客户信息 */
  @GetMapping("/customers/{id}")
  @ResponseBody
  public Msg getCustomerById(@PathVariable("id") Integer id) {
    Customer customer = customerService.getCustomerById(id);
    // 客户来源
    List<BaseDict> source = baseDictService.findBaseDictByTypeCode(FROM_TYPE);
    // 客户行业
    List<BaseDict> Industry = baseDictService.findBaseDictByTypeCode(INDUSTRY_TYPE);
    // 客户级别
    List<BaseDict> level = baseDictService.findBaseDictByTypeCode(LEVEL_TYPE);
    return Msg.success()
        .add("cust", customer)
        .add("source", source)
        .add("Industry", Industry)
        .add("level", level);
  }

  /** 更新客户 */
  @PutMapping("/customers/{custId}")
  @ResponseBody
  public Msg customerUpdate(Customer customer) {
    int rows = customerService.updateCustomer(customer);
    if (rows > 0) {
      return Msg.success();
    } else {
      return Msg.fail();
    }
  }

  /**
   * 根据id删除用户信息 注意:单个批量二合一 如:1-2-3-4-5 Q @param id
   *
   * @return
   */
  @DeleteMapping("/customers/{id}")
  @ResponseBody
  public Msg removeEmp(@PathVariable("id") String ids) {
    if (ids.contains("-")) {
      // 包含"-"就是批量删除
      String[] split = ids.split("-");
      List list = new ArrayList();
      for (String s : split) {
        list.add(Integer.parseInt(s));
      }
      // 批量删除
      int i = customerService.deleteBatch(list);
      if (i > 0) {
        return Msg.success();
      }
    } else { // 单个删除
      int i = customerService.deleteCustomer(Integer.parseInt(ids));
      if (i > 0) {
        return Msg.success();
      }
    }
    return Msg.fail();
  }
}
