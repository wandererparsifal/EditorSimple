package com.simple;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EditorMdController {

    @RequestMapping(value = "/editormd", method = RequestMethod.GET)
    public String editormd(ModelMap model) {
        return "editormd";
    }
}
