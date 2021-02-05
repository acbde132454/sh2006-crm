package com.bjpowernode.crm.settings.service;

import com.bjpowernode.crm.settings.bean.User;

import java.util.List;

public interface UserService {


    User login(User user);

    boolean verifyPwd(String oldPwd, String id);

    void updatePwd(User user);

    List<User> queryAllUser();
}
