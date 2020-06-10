package com.james.service.imp;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.james.dao.BaseDictMapper;
import com.james.domain.BaseDict;
import com.james.service.IBaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * (BaseDict)实体类
 *
 * @author Mr.YiQuan
 * @since 2020-04-24 16:02:38 数据字典Service接口实现类
 */
@Service("baseDictService")
public class BaseDictServiceImp implements IBaseDictService {
  @Autowired private BaseDictMapper baseDictMapper;
  // 根据类别代码查询数据字典
  @Override
  public List<BaseDict> findBaseDictByTypeCode(String typecode) {
    return baseDictMapper.selectList(new EntityWrapper<BaseDict>().eq("dict_type_code", typecode));
  }
}
