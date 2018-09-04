package com.simple;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/hello", method = RequestMethod.GET)
public class EditerMdController {

    @RequestMapping(value = "/editermd", method = RequestMethod.GET)
    public String printHello(ModelMap model) {
        return "editermd";
    }
}
