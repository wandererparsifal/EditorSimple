package com.simple;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@Controller
public class UploadController {

    private static final String UPLOAD_PATH = "/resources/upload/";

    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
    public void hello(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "editormd-image-file", required = false) MultipartFile multipartFile) {
        try {
            String trueFileName = multipartFile.getOriginalFilename();
            String suffix = trueFileName.substring(trueFileName.lastIndexOf("."));
            String fileName = System.currentTimeMillis() + suffix;
            String path = request.getSession().getServletContext().getRealPath(UPLOAD_PATH);
            System.out.println(path);
            File targetFile = new File(path, fileName);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            // 保存
            try {
                multipartFile.transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.getWriter().write("{\"success\": 1, \"message\":\"upload success\",\"url\":\"" + UPLOAD_PATH + targetFile.getName() + "\"}");
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.getWriter().write("{\"success\":0}");
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
