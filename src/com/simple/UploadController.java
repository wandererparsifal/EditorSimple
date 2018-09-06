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

    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
    public void upload(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "editormd-image-file", required = false) MultipartFile multipartFile) {
        try {
            String trueFileName = multipartFile.getOriginalFilename();
            String suffix = trueFileName.substring(trueFileName.lastIndexOf("."));
            String fileName = System.currentTimeMillis() + suffix;
            System.out.println(Global.UPLOAD_PATH);
            File targetFile = new File(Global.UPLOAD_PATH, fileName);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            // 保存
            try {
                multipartFile.transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.getWriter().write("{\"success\": 1, \"message\":\"upload success\",\"url\":\"" + Global.IMAGE_DIR + targetFile.getName() + "\"}");
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
