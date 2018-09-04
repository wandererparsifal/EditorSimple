package com.simple;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;

@Controller
public class SubmitHtmlController {

    @RequestMapping(value = "/submithtml", method = RequestMethod.POST)
    public void submit(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("mdContent " + request.getParameter("mdContent"));
        System.out.println("htmlContent " + request.getParameter("htmlContent"));
        // htmlContent 不带 css
        String htmlDir = request.getSession().getServletContext().getRealPath("/resources/html/");
        File dir = new File(htmlDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        try {
            saveText(request.getParameter("htmlContent"), htmlDir + File.separator + System.currentTimeMillis() + ".txt");
            PrintWriter writer = response.getWriter();
            response.getWriter().write("{\"success\":0}");
            writer.flush();
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void saveText(String content, String path) throws Exception {
        File file = new File(path);
        PrintWriter printWriter = new PrintWriter(file);
        printWriter.print(content);
        printWriter.close();
    }
}
