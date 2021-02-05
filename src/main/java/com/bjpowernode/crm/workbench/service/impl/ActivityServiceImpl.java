package com.bjpowernode.crm.workbench.service.impl;

import com.bjpowernode.crm.base.constants.CrmEnum;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.DateTimeUtil;
import com.bjpowernode.crm.base.util.UUIDUtil;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.mapper.UserMapper;
import com.bjpowernode.crm.workbench.bean.Activity;
import com.bjpowernode.crm.workbench.bean.ActivityRemark;
import com.bjpowernode.crm.workbench.mapper.ActivityMapper;
import com.bjpowernode.crm.workbench.mapper.ActivityRemarkMapper;
import com.bjpowernode.crm.workbench.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Arrays;
import java.util.List;

@Service
public class ActivityServiceImpl implements ActivityService {

    @Autowired
    private ActivityMapper activityMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ActivityRemarkMapper activityRemarkMapper;

    @Override
    public List<Activity> activityList(Activity activity) {
        Example example = new Example(Activity.class);
        Example.Criteria criteria = example.createCriteria();
        if(activity.getName() != null && activity.getName() != ""){
            criteria.andLike("name","%"+activity.getName()+"%");
        }
        if(activity.getOwner() != null && activity.getOwner() != ""){
            /**
             * 因为owner当前获取的是名称，数据库存储的是外键，根据名称再查询用户表，
             * 查询出所有者的主键
             */
            Example e = new Example(User.class);
            e.createCriteria().andLike("name","%"+activity.getOwner()+"%");
            List<User> users = userMapper.selectByExample(e);
            if(users.size() > 0){
                for (User user : users) {
                    criteria.orEqualTo("owner",user.getId());
                }
            }else{
                criteria.orEqualTo("owner","");
            }
        }
        if(activity.getStartDate() != null && activity.getStartDate() != ""){
            criteria.andGreaterThanOrEqualTo("startDate",activity.getStartDate());
        }
        if(activity.getEndDate() != null && activity.getEndDate() != ""){
            criteria.andLessThanOrEqualTo("startDate",activity.getStartDate());
        }

        List<Activity> activityList = activityMapper.selectByExample(example);
        for (Activity activity1 : activityList) {
            //取出activity1的owner，根据ower查询用户信息，把用户的信息设置到activity1的owner
            User user = userMapper.selectByPrimaryKey(activity1.getOwner());
            activity1.setOwner(user.getName());
        }
        return activityList;
    }

    @Override
    public boolean createOrUpdateActivity(Activity activity,User user) {

        boolean updateOrAdd = false;
        if(activity.getId() != null){
            //修改
            activity.setEditBy(user.getName());
            activity.setEditTime(DateTimeUtil.getSysTime());
            int count = activityMapper.updateByPrimaryKeySelective(activity);
            if(count == 0){
                throw new CrmException(CrmEnum.ACTIVITY_UPDATE);
            }
        }else{
            activity.setCreateBy(user.getName());
            activity.setCreateTime(DateTimeUtil.getSysTime());
            activity.setId(UUIDUtil.getUUID());
            //插入非空字段
            int count = activityMapper.insertSelective(activity);
            if(count == 0){
                throw new CrmException(CrmEnum.USER_LOGIN_EMPTY);
            }
            updateOrAdd = true;
        }
        return updateOrAdd;
    }

    @Override
    public Activity queryById(String id) {
        return activityMapper.selectByPrimaryKey(id);
    }

    //单个删除
    //in(1,2,3)
    @Override
    public void deleteBatch(String ids) {
        String[] idString = ids.split(",");
        List<String> idList = Arrays.asList(idString);
        Example example = new Example(Activity.class);
        example.createCriteria().andIn("id",idList);
        int count = activityMapper.deleteByExample(example);
        if(count == 0){
            throw new CrmException(CrmEnum.USER_LOGIN_EMPTY);
        }
    }

    @Override
    public Activity queryDetail(String id) {
        Activity activity = activityMapper.selectByPrimaryKey(id);

        //根据市场活动的主键查询市场活动备注
        ActivityRemark activityRemark = new ActivityRemark();
        activityRemark.setActivityId(id);
        List<ActivityRemark> activityRemarks = activityRemarkMapper.select(activityRemark);
        activity.setActivityRemarks(activityRemarks);
        return activity;
    }

    //更新市场活动
    @Override
    public void updateRemark(ActivityRemark activityRemark) {
        activityRemark.setEditTime(DateTimeUtil.getSysTime());
        activityRemark.setEditFlag("1");
        int count = activityRemarkMapper.updateByPrimaryKeySelective(activityRemark);
        if(count == 0){
            throw new CrmException(CrmEnum.ACTIVITY_REMARK_UPDATE);
        }
    }

    @Override
    public ActivityRemark saveActivityRemark(ActivityRemark activityRemark) {
        //主键
        activityRemark.setId(UUIDUtil.getUUID());
        activityRemark.setCreateTime(DateTimeUtil.getSysTime());
        activityRemark.setEditFlag("0");
        int count = activityRemarkMapper.insertSelective(activityRemark);
        if(count == 0){
            throw new CrmException(CrmEnum.ACTIVITY_REMARK_ADD);
        }else{
            //更新成功
            activityRemark = activityRemarkMapper.selectByPrimaryKey(activityRemark.getId());
        }
        return activityRemark;
    }

    @Override
    public void deleteRemark(String id) {
        int count = activityRemarkMapper.deleteByPrimaryKey(id);
        if(count == 0){
            throw new CrmException(CrmEnum.ACTIVITY_REMARK_DELETE);
        }
    }
}
