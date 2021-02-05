package com.bjpowernode.crm.settings.controller;

import com.bjpowernode.crm.base.bean.ResultVo;
import com.bjpowernode.crm.base.constants.CrmConstants;
import com.bjpowernode.crm.base.exception.CrmException;
import com.bjpowernode.crm.base.util.FileUploadUtil;
import com.bjpowernode.crm.settings.bean.User;
import com.bjpowernode.crm.settings.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/user/login")
    public String login(User user, HttpServletRequest request, Model model, HttpSession session){
        //获取客户端的请求ip Remote:远程
        String address = request.getRemoteAddr();
        user.setAllowIps(address);
        ResultVo resultVo = new ResultVo();
        try {
            user = userService.login(user);
            session.setAttribute(CrmConstants.LOGIN_USER,user);
        } catch (CrmException e) {
            //获取异常的状态码
            String code = e.getCrmEnum().getCode();
            if("001-001".equals(code)){
                resultVo.setMessage("用户名或密码错误");
            }else if("001-002".equals(code)){
                resultVo.setMessage("用户名或密码为空");
            }else if("001-003".equals(code)){
                resultVo.setMessage("账户已失效，请联系管理员");
            }else if("001-004".equals(code)){
                resultVo.setMessage("账户被锁定，请联系管理员");
            }else if("001-005".equals(code)){
                resultVo.setMessage("不允许的IP，请联系管理员");
            }

            model.addAttribute("message",resultVo.getMessage());
            return "../login";
        }
        return "workbench/index";
    }

    //用户修改密码
    @RequestMapping("/user/updatePwd")
    @ResponseBody
    public ResultVo updatePwd(User user, HttpSession session){
        //上传文件
        String photoUrl = (String) session.getServletContext().getAttribute("photoUrl");
        user.setPhoto(photoUrl);
        ResultVo resultVo = new ResultVo();
        try {
            userService.updatePwd(user);
            resultVo.setOk(true);
            resultVo.setMessage("更新用户成功!!!");
        } catch (CrmException e) {
            resultVo.setOk(false);
            resultVo.setMessage("修改用户失败!!!");
        }
        return resultVo;
    }

    //异步上传图片  提高用户体验度
    @RequestMapping("/user/fileUpload")
    @ResponseBody
    public ResultVo fileUpload(MultipartFile img,HttpSession session){
        ResultVo resultVo = new ResultVo();
        try {
            String photoUrl = FileUploadUtil.fileUpload(session,img);
            session.getServletContext().setAttribute("photoUrl",photoUrl);
            resultVo.setOk(true);
            resultVo.setMessage("上传图片成功");
        }catch (Exception e){
            resultVo.setOk(false);
            resultVo.setMessage("上传图片失败");
        }
        return resultVo;
    }


    //异步校验旧密码是否正确
    @RequestMapping("/user/verifyPwd")
    @ResponseBody
    public ResultVo verifyPwd(String oldPwd,String id){
        ResultVo resultVo = new ResultVo();
        boolean result = userService.verifyPwd(oldPwd,id);
        if(!result){
            resultVo.setOk(false);
            resultVo.setMessage("原始密码不正确");
        }else{
            resultVo.setOk(true);
        }
        return resultVo;
    }

    //退出系统
    @RequestMapping("/user/loginOut")
    public String loginOut(HttpSession session){
        //将用户从session中移除 session中存放值是占用服务器空间
        session.removeAttribute(CrmConstants.LOGIN_USER);
        //跳转到登录页面
        return "redirect:/login.jsp";
    }

    //异步查询所有用户信息
    @RequestMapping("/user/queryAllUser")
    @ResponseBody
    public ResultVo queryAllUser(){
        ResultVo resultVo = new ResultVo();
        List<User> users = userService.queryAllUser();
        resultVo.setDataList(users);
        return resultVo;
    }
}
