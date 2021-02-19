package com.bjpowernode.crm.base.cache;

import com.bjpowernode.crm.base.bean.DictionaryType;
import com.bjpowernode.crm.base.bean.DictionaryValue;
import com.bjpowernode.crm.base.mapper.DictionaryTypeMapper;
import com.bjpowernode.crm.base.mapper.DictionaryValueMapper;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import java.util.*;

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
            Example example = new Example(DictionaryValue.class);
            //支持排序
            example.setOrderByClause("orderNo asc");
            example.createCriteria().andEqualTo("typeCode",dictionaryType.getCode());
            List<DictionaryValue> dictionaryValues =
                    dictionaryValueMapper.selectByExample(example);
            dictionaryType.setDictionaryValues(dictionaryValues);
        }
        servletContext.setAttribute("dictionaryTypes",dictionaryTypes);
        //缓冲阶段和可能性
        //读取Stage2Possibility.properties
        ResourceBundle bundle = ResourceBundle.getBundle("mybatis.Stage2Possibility");

        Enumeration<String> keys = bundle.getKeys();

        //把所有阶段和可能性的数据放在map中
        Map<String,String> map = new TreeMap<>();
        while(keys.hasMoreElements()){
            String key = keys.nextElement();
            String value = bundle.getString(key);
            map.put(key,value);
        }
        servletContext.setAttribute("stage2Possibility",map);
    }
}
