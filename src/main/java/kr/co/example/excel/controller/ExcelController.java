package kr.co.example.excel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ExcelController {

    /**
     * JSP Excel 다운로드 View
     *
     * @param model
     * @return
     * @throws RuntimeException
     */
    @RequestMapping(value="/excel01", method={RequestMethod.GET,RequestMethod.POST})
    public String excel01(ModelMap model)throws RuntimeException{
        return "excel/excel01";
    }

    /**
     * JSP Excel 다운로드 Controller
     * @param model
     * @return
     * @throws RuntimeException
     */
    @RequestMapping(value="/excel01Download", method={RequestMethod.GET,RequestMethod.POST})
    public String excel01Download( ModelMap model)throws RuntimeException{
        Map<String, Object> map = new HashMap<>();
        map.put("korName", "테스트");
        map.put("EngName", "Test");
        map.put("age", 20);
        map.put("height", "175");
        map.put("weight", 70.3);

        model.addAttribute("map", map);
        return "excel/excel01Download";
    }
}
