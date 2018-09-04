package com.simple;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class SubmitHtmlController {

    @RequestMapping(value = "/submithtml", method = RequestMethod.POST)
    public void submit(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("mdContent " + request.getParameter("mdContent"));
        System.out.println("htmlContent " + request.getParameter("htmlContent"));
        // htmlContent 不带 css
        // TODO: 保存到数据库

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        try {
            PrintWriter writer = response.getWriter();
            response.getWriter().write("{\"success\":0}");
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
