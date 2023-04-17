package kr.co.example.ajax.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.example.ajax.model.Ajax01VO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.StringWriter;

@Controller
public class AjaxController {

    @RequestMapping(value="/ajax01", method={RequestMethod.GET, RequestMethod.POST})
    public String ajax01 (Model model)
    {
        return "/ajax/ajax01";
    }

    @RequestMapping(value = "/ajax01Submit", method = {RequestMethod.POST})
    public ResponseEntity<String> ajax01Submit(@ModelAttribute("ajax01VO") Ajax01VO ajax01VO, ModelMap model) throws Exception {
        ModelMap modelMap = new ModelMap();

        //multipart-form-data 로 전송 시 한글이 깨질경우 아래와 같이 변환
        //String korName = ajaxVO.getKorName();
        //korName = new String(korName.getBytes("8859_1"), "utf-8");

        modelMap.put("korName", ajax01VO.getKorName());
        modelMap.put("engName", ajax01VO.getEngName());
        modelMap.put("age", ajax01VO.getAge());
        modelMap.put("height", ajax01VO.getHeight());
        modelMap.put("weight", ajax01VO.getWeight());

        modelMap.put("success", true);
        //modelMap.put("success", false);

        StringWriter sw = new StringWriter();
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(sw, modelMap);
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=UTF-8");

        return new ResponseEntity<String>(sw.toString(), responseHeaders, HttpStatus.CREATED);
    }

//    ===================================================================================================


}
