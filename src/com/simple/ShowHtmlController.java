package com.simple;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

@Controller
public class ShowHtmlController {

    @RequestMapping(value = "/showhtml", method = RequestMethod.GET)
    public String show(HttpServletRequest request, ModelMap model) {
        String htmlFilePath = request.getParameter("htmlFile");
        String path = request.getSession().getServletContext().getRealPath(htmlFilePath);
        System.out.println("htmlFile " + path);
        String htmlContent = "null";
        try {
            htmlContent = readText(path);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("htmlContent", htmlContent);
        System.out.println("htmlContent " + htmlContent);
        return "showhtml";
    }

    private String readText(String path) throws Exception {
        StringBuilder stringBuffer = new StringBuilder();
        File file = new File(path);
        if (file.isFile() && file.exists()) {
            InputStreamReader isr = new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8);
            BufferedReader bufferedReader = new BufferedReader(isr);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                stringBuffer.append(line);
                stringBuffer.append("\n");
            }
            isr.close();
        }
        return stringBuffer.toString();
    }
}
