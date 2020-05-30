package com.james.web;

import com.james.domain.Msg;
import com.james.domain.User;
import com.james.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** 用户控制器类 */
@Controller
@RequestMapping("/user")
public class UserController {
  // 依赖注入
  @Autowired private IUserService userService;

  @GetMapping("/login")
  public String login(){
    return "login/login";
  }

  /**
   * 用户登录
   *
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
      } catch (AuthenticationException ae) {
        System.out.println("密码错误");
      }
    }
    return Msg.success();
  }

  @GetMapping("/index")
  public String toCustomer() {
      return "index/index";
  }
}
