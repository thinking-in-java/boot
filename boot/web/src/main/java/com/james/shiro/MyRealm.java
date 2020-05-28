package com.james.shiro;

import com.james.domain.User;
import com.james.service.IUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Author: James Ben
 * Email: thinking_in_java@126.com
 * ToDo: Sail against the current
 * Create Time:2020/5/19 19:01
 */
public class MyRealm extends AuthenticatingRealm {
  @Autowired
  private IUserService service;
  /**
   * 身份认证
   * @param authenticationToken
   * @return
   * @throws AuthenticationException
   */
  @Override
  protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
      throws AuthenticationException {
    UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
    User u = new User();
    String username = token.getUsername();//前端获取的用户名
    u.setUserCode(username);
    //数据库比对是否有该用户
    User selectUser = service.findUser(u);
    //判断是否存在该用户
    if(selectUser == null){
      throw new UnknownAccountException("用户不存在");
    }

    SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(selectUser.getUserCode(),selectUser.getUserPassword(),getName());
    return simpleAuthenticationInfo;
  }
}
