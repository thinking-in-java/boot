package com.james.service.imp;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.james.dao.UserMapper;
import com.james.domain.User;
import com.james.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户Service接口实现类
 *
 * @author Mr.YiQuan
 * @since 2020-04-24 16:02:38 数据字典Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImp implements IUserService {
  // 注入UserDao
  @Autowired private UserMapper userMapper;
  // 通过账号和密码查询用户   ,
  @Override
  public User findUser(User u) {
    User user = userMapper.selectOne(u);
    return user;
  }


  /**
   * 添加该用户到数据库
   * @param user
   * @return
   */
  @Override
  public int addUser(User user) {
    return userMapper.insert(user);
  }

  /**
   * 查询用户存在
   * @param userCode
   * @return
   */
  @Override
  public int findUserCode(String userCode) {
    return userMapper.selectCount(new EntityWrapper().eq("USER_CODE",userCode));
  }
}
