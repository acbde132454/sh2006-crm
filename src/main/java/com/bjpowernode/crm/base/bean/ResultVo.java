package com.bjpowernode.crm.base.bean;

import com.github.pagehelper.PageInfo;
import lombok.Data;

import java.util.List;

/**
 * 用于返回给客户端结果的
 */
@Data
public class ResultVo<T> {

    private boolean isOk;//判断操作是否成功 true:成功 false:失败
    private String message;//返回消息

    private T t;//给前台返回单个对象
    private List<T> dataList;//给前台返回的集合对象

    private PageInfo<T> pageInfo;

}
