package com.bjpowernode.crm.base.service.impl;

import com.bjpowernode.crm.base.bean.DictionaryValue;
import com.bjpowernode.crm.base.mapper.DictionaryValueMapper;
import com.bjpowernode.crm.base.service.DictionaryService;
import com.bjpowernode.crm.base.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    private DictionaryValueMapper dictionaryValueMapper;

    @Override
    public List<DictionaryValue> dictionaryValuesList() {
        return dictionaryValueMapper.selectAll();
    }

    @Override
    public DictionaryValue queryDictionTypeByCode(String typeCode) {
        Example example = new Example(DictionaryValue.class);
        //降序排序
        example.setOrderByClause("orderNo desc");
        example.createCriteria().andEqualTo("typeCode",typeCode);
        List<DictionaryValue> dictionaryValues = dictionaryValueMapper.selectByExample(example);
        return dictionaryValues.get(0);
    }

    @Override
    public void saveDictionaryValue(DictionaryValue dictionaryValue) {
        dictionaryValue.setId(UUIDUtil.getUUID());
        dictionaryValueMapper.insertSelective(dictionaryValue);
    }
}
