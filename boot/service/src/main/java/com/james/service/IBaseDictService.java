package com.james.service;

import com.james.domain.BaseDict;

import java.util.List;

/**
 * 数据字典Service接口
 * @author Mr.YiQuan
 * @since 2020-04-24 16:02:38
 */
public interface IBaseDictService {
  // 根据类别代码查询数据字典
  public List<BaseDict> findBaseDictByTypeCode(String typecode);
}
