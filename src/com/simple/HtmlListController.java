package com.simple;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;

@Controller
public class HtmlListController {

    @RequestMapping(value = "/htmllist", method = RequestMethod.GET)
    public String list(HttpServletRequest request) {
        HttpSession session = request.getSession();
        File htmlFileDir = new File(Global.HTML_PATH);
        if (!htmlFileDir.exists()) {
            htmlFileDir.mkdirs();
        }
        ArrayList<String> htmlFiles = new ArrayList<>();
        String filePath;
        for (File htmlFile : htmlFileDir.listFiles()) {
            filePath = htmlFile.getAbsolutePath();
            htmlFiles.add(htmlFile.getName());
            System.out.println("path " + filePath);
        }
        Collections.sort(htmlFiles);
        session.setAttribute("htmlFiles", htmlFiles);
        return "htmllist";
    }
}
