package com.james.service;

import com.james.domain.User;

/**
 * 用户Service层接口
 *
 * @author Mr.YiQuan
 * @since 2020-04-24 16:02:38
 */
public interface IUserService {
  // 通过账号和密码查询用户
  public User findUser(User u);
}
