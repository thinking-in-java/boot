package com.james.web;

import com.james.domain.Msg;
import com.james.domain.User;
import com.james.service.IUserService;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

/** 用户控制器类 */
@Controller
@RequestMapping("/user")
public class UserController {
  // 依赖注入
  @Autowired private IUserService userService;

  // 验证码发送地址
  private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
  // 存放验证码
  private String validateCode;

  @GetMapping("/login")
  public String login() {
    return "login/login";
  }

  /**
   * 用户登录
   * @param u
   * @return
   */
  @ResponseBody
  @PostMapping("/login")
  public Msg login(User u) {
    Subject currentUser = SecurityUtils.getSubject();
    if (!currentUser.isAuthenticated()) {
      UsernamePasswordToken token = new UsernamePasswordToken(u.getUserCode(), u.getUserPassword());
      try {
        currentUser.login(token);
      } catch (UnknownAccountException ae) {
        return Msg.fail().add("msg", "用户名不存在!");
      } catch (AuthenticationException ac) {
        return Msg.fail().add("msg", "密码错误");
      }
    }
    return Msg.success();
  }

  /**
   * 验证码
   * @param mobile
   * @return
   */
  @PostMapping("/getCode")
  @ResponseBody
  public Msg sendCode(String mobile) {
    HttpClient client = new HttpClient();
    PostMethod method = new PostMethod(Url);

    client.getParams().setContentCharset("GBK");
    method.setRequestHeader("ContentType", "application/x-www-form-urlencoded;charset=GBK");

    int mobile_code = (int) ((Math.random() * 9 + 1) * 100000);
    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

    NameValuePair[] data = { // 提交短信
      new NameValuePair("account", "C99656365"), // 查看用户名是登录用户中心->验证码短信->产品总览->APIID
      new NameValuePair(
          "password", "ee2b4417d148339eace309ae152d5558"), // 查看密码请登录用户中心->验证码短信->产品总览->APIKEY
      // new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
      new NameValuePair("mobile", mobile),
      new NameValuePair("content", content),
    };
    method.setRequestBody(data);
    try {
      client.executeMethod(method);
      String SubmitResult = method.getResponseBodyAsString();
      // System.out.println(SubmitResult);
      Document doc = DocumentHelper.parseText(SubmitResult);
      Element root = doc.getRootElement();
      String code = root.elementText("code");
      String msg = root.elementText("msg");
      String smsid = root.elementText("smsid");
      if ("2".equals(code)) {
        validateCode = mobile_code + "";
        return Msg.success();
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return Msg.fail();
  }

  /**
   * 注册用户
   * @param user
   * @return
   */
  @ResponseBody
  @PostMapping("/register")
  public Msg register(User user) {
    // 对比短信验证码来激活该用户
    if (validateCode!=null&&validateCode.equals(user.getValidateCode())) {
      System.out.println(user);
      // 激活该对象
      user.setUserState(1);
      // 添加该用户*/
      System.out.println(user);
      int row = userService.addUser(user);
      // 插入是否成功
      if (row > 0) {
        return Msg.success();
      }
    }
    return Msg.fail();
  }

  /**
   * 校验用户是否存在
   * @param userCode
   * @return
   */
  @ResponseBody
  @GetMapping("/GetUserCode")
  public Msg findUserCode(String userCode){
    int row  = userService.findUserCode(userCode);
    //大于零就存在
    if (row > 0) {
      return Msg.success();
    }
    return  Msg.fail();
  }


  /**
   * 跳转到客户管理
   * @return
   */
  @GetMapping("/index")
  public String toCustomer() {
    return "index/index";
  }

  /**
   * 跳转到订单管理
   * @return
   */

  @GetMapping("/orders")
  public String toOrders() {
    return "index/orders";
  }
}
