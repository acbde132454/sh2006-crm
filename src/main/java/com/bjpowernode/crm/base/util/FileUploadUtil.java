package com.bjpowernode.crm.base.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class FileUploadUtil {

    public static String fileUpload(HttpSession session, MultipartFile img){
        //处理上传文件
        //文件存储目录创建
        String realPath = session.getServletContext().getRealPath("/upload");
        File file = new File(realPath);
        if(!file.exists()){
            //目录不存在创建目录
            file.mkdirs();
        }

        //不同用户可能上传同名的文件 系统时间戳+文件名
        //获取文件名
        String fileName = img.getOriginalFilename();
        fileName = System.currentTimeMillis() + fileName;
        //..../upload/文件名
        try {
            img.transferTo(new File(realPath + File.separator + fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "/crm" + File.separator + "upload" + File.separator + fileName;
    }
}
