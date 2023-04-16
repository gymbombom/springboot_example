package kr.co.example.test.controller;

import kr.co.example.test.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class TestController {

    @Autowired
    TestService testService;

    @RequestMapping(value="/test01", method={RequestMethod.GET, RequestMethod.POST})
    public String ajax01 (Model model)
    {
        return "/test/test01";
    }

    /**
     * DB 연결 테스트
     * @param model
     * @return
     */
    @RequestMapping(value="/test02", method={RequestMethod.GET,RequestMethod.POST})
    public String test01(Model model)
    {
        Map<String, Object> testMap = testService.selectTest02();
        model.addAttribute("testMap", testMap);
        return "/test/test02";
    }
}
