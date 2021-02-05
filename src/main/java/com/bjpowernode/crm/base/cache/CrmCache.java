package com.bjpowernode.crm.base.cache;

import com.bjpowernode.crm.base.bean.DictionaryType;
import com.bjpowernode.crm.base.bean.DictionaryValue;
import com.bjpowernode.crm.base.mapper.DictionaryTypeMapper;
import com.bjpowernode.crm.base.mapper.DictionaryValueMapper;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import java.util.List;

/**
 * @Component:组件
 * 缓存数据
 * @Controller
 * @Service
 * @Repository
 * Spring+servlet
 * Spring+SpringMVC
 */
@Component
public class CrmCache {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private DictionaryTypeMapper dictionaryTypeMapper;

    @Autowired
    private DictionaryValueMapper dictionaryValueMapper;


    @Autowired
    private ServletContext servletContext;

    @PostConstruct
    public void init(){
        //缓存所有者信息
        List<User> users = userMapper.selectAll();

        //将查询出来的数据放在ServletContext
        servletContext.setAttribute("users",users);

        //缓存数据字典信息
        //查询字典类型
        List<DictionaryType> dictionaryTypes = dictionaryTypeMapper.selectAll();

        for (DictionaryType dictionaryType : dictionaryTypes) {
            DictionaryValue dictionaryValue = new DictionaryValue();
            dictionaryValue.setTypeCode(dictionaryType.getCode());
            List<DictionaryValue> dictionaryValues =
                    dictionaryValueMapper.select(dictionaryValue);
            dictionaryType.setDictionaryValues(dictionaryValues);
        }
        servletContext.setAttribute("dictionaryTypes",dictionaryTypes);
    }
}
