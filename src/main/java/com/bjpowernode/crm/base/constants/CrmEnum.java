package com.bjpowernode.crm.base.constants;

public enum CrmEnum {


    USER_LOGIN_LOGIN("001-001"),//用户模块登录功能用户名错误
    USER_LOGIN_EMPTY("001-002"),//用户名和密码为空
    USER_LOGIN_ACCOUNT_EXPIRE("001-003"),//账户失效了
    USER_LOGIN_ACCOUNT_LOCKED("001-004"),//账户被锁定
    USER_LOGIN_IP("001-005"),//不允许的IP
    USER_UPDATE("001-006"),//更新用户失败
    ACTIVITY_ADD("002-001"),//添加市场活动失败
    ACTIVITY_UPDATE("002-002"),//修改市场活动失败
    ACTIVITY_DELETE("002-003"),//删除市场活动失败
    ACTIVITY_REMARK_UPDATE("002-004"),//市场市场活动备注失败
    ACTIVITY_REMARK_ADD("002-005"),//添加市场市场活动备注失败
    ACTIVITY_REMARK_DELETE("002-006");//删除市场市场活动备注失败

    private String code;//消息的类型


    CrmEnum(String code){
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
