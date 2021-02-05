package com.bjpowernode.crm.settings.service.impl;

import cn.hutool.core.util.StrUtil;
import com.bjpowernode.crm.base.constants.CrmEnum;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.DateTimeUtil;
import com.bjpowernode.crm.base.util.MD5Util;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserMapper;
import com.bjpowernode.crm.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;



    @Override
    public User login(User user) {
        //获取客户端的请求ip
        String remoteIp = user.getAllowIps();
        //把用户中的ip信息置为null,就不参与查询了
        user.setAllowIps(null);
        //非空校验
        if(StrUtil.isEmpty(user.getLoginAct())){
            throw new CrmException(CrmEnum.USER_LOGIN_EMPTY);
        }
        //加密密码
        String loginPwd = MD5Util.getMD5(user.getLoginPwd());
        user.setLoginPwd(loginPwd);


        //方式一:只能精准查询

       List<User> users = userMapper.select(user);
       if(users.size() == 0){
            //用户名或密码错误
           throw new CrmException(CrmEnum.USER_LOGIN_LOGIN);
       }else {
           user = users.get(0);
           //用户存在
           //判断用户账户是否失效
           String now = DateTimeUtil.getSysTime();
           if(now.compareTo(user.getExpireTime()) > 0){
               //账户失效
               throw new CrmException(CrmEnum.USER_LOGIN_ACCOUNT_EXPIRE);
           }
           if("0".equals(user.getLockState())){
               //账户被锁定
               throw new CrmException(CrmEnum.USER_LOGIN_ACCOUNT_LOCKED);
           }
           if(!user.getAllowIps().contains(remoteIp)){
                //不允许的ip
               throw new CrmException(CrmEnum.USER_LOGIN_IP);
           }
       }
       return user;

       //方式二:Example查询 做复杂查询 模糊查询 排序 分组
        /*Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        //参数1:实体类的属性名 参数2:实际传入的参数
        criteria.andEqualTo("loginAct",user.getLoginAct())
        .andEqualTo("loginPwd",user.getLoginPwd());
        List<User> users = userMapper.selectByExample(example);
        System.out.println(users);*/

    }

    //校验原始密码输入是否正确
    @Override
    public boolean verifyPwd(String oldPwd, String id) {
        oldPwd = MD5Util.getMD5(oldPwd);
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("id",id)
                .andEqualTo("loginPwd",oldPwd);
        User user = userMapper.selectOneByExample(example);
        return user == null ? false : true;
    }

    //用户修改密码和头像
    @Override
    public void updatePwd(User user) {

        //根据主键修改用户信息，空值不参与修改
        int count = userMapper.updateByPrimaryKeySelective(user);
        if(count == 0){
            throw new CrmException(CrmEnum.ACTIVITY_ADD);
        }
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.selectAll();
    }
}
