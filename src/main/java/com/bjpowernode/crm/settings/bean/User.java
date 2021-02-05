package com.bjpowernode.crm.settings.bean;

import lombok.Data;
import tk.mybatis.mapper.annotation.NameStyle;
import tk.mybatis.mapper.code.Style;

import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Table(name = "tbl_user")//找user表
@NameStyle(Style.normal)
public class User {

    @Id
    private String id;//主键
    private String loginAct;//登录账号
    private String name;//昵称
    private String loginPwd;//登录密码
    private String email;//邮箱
    /**
     * varchar:一个一个字符查询
     * char:定长查询 19:每次查询19位
     */
    private String expireTime;//失效时间 char:19 如果时间只是单纯为了显示 yyyy-MM-dd hh:mm:ss
    private String lockState;//账号是否被锁定 0:被锁定 1:没有锁定
    private String deptno;//所在部门
    private String allowIps;//允许登录的ip
    private String createTime;//创建时间
    private String createBy;//创建人
    private String editTime;//编辑时间
    private String editBy;//编辑人
    private String photo;//用户头像

}
