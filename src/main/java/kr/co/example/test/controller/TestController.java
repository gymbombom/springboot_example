package kr.co.example.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

    @RequestMapping(value="/test01", method={RequestMethod.GET, RequestMethod.POST})
    public String ajax01 (Model model)
    {
        return "/test/test01";
    }
}
