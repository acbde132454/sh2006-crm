package com.bjpowernode.crm.workbench.service;

import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.workbench.bean.Activity;
import com.bjpowernode.crm.workbench.bean.ActivityRemark;

import java.util.List;

public interface ActivityService {
    List<Activity> activityList(Activity activity);

    boolean createOrUpdateActivity(Activity activity, User user);

    Activity queryById(String id);

    void deleteBatch(String ids);

    Activity queryDetail(String id);

    void updateRemark(ActivityRemark activityRemark);

    ActivityRemark saveActivityRemark(ActivityRemark activityRemark);

    void deleteRemark(String id);
}
