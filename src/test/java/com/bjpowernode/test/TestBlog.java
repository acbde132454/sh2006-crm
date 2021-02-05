package com.bjpowernode.test;

import com.alibaba.fastjson.JSONObject;
import com.bjpowernode.bean.Person;
import com.bjpowernode.crm.base.constants.CrmEnum;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.DateTimeUtil;
import com.bjpowernode.crm.base.util.MD5Util;
import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.settings.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TestBlog {

    //测试对象-->json
    @Test
    public void test01(){
        Person person = new Person();
        person.setName("张三");
        person.setAge(20);
        person.setGender("男");

        Person person1 = new Person();
        person1.setName("李四");
        person1.setAge(30);
        person1.setGender("女");

        List<Person> personList = new ArrayList<>();
        personList.add(person);
        personList.add(person1);

        String jsonString = JSONObject.toJSONString(personList);
        System.out.println(jsonString);
    }

    //测试tkMapper中@NameStyle
    @Test
    public void test02(){
        //读取配置文件，获取IOC容器
        BeanFactory beanFactory =
                new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        UserService userService = (UserService) beanFactory.getBean("userServiceImpl");
        /*List<User> users = userService.queryAll();
        for (User user : users) {
            System.out.println(user);
        }*/
    }

    //测试自定义异常
    @Test
    public void test03(){
        try {
            int a = 1;
            if(a == 1){
                throw new CrmException(CrmEnum.USER_LOGIN_LOGIN);
            }
        }catch (CrmException e){
            System.out.println("123");
        }

    }

    //测试md5加密
    @Test
    public void test04(){
        String admin = MD5Util.getMD5("admin");
        System.out.println(admin);
    }

    //字符串大小比较

    /**
     * now > 失效时间 >0
     * now = 失效时间
     * now < 失效时间 <0
     */
    @Test
    public void test05(){
        String now = DateTimeUtil.getSysTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String expireTime = "1890-2-26";
        System.out.println(now.compareTo(expireTime));
    }

    //
    @Test
    public void test06(){
        System.out.println(File.separator);
    }

    //测试主键生成UUID
    @Test
    public void test07(){
        System.out.println(UUIDUtil.getUUID());
    }

    //数组转集合
    @Test
    public void test08(){
        String[] ids = {"1,","2","3"};
        List<String> idList = Arrays.asList(ids);
        System.out.println(idList);
    }
}
