package kr.co.example.ajax.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.example.ajax.model.Ajax01VO;
import kr.co.example.ajax.model.Ajax03VO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    //    =======================================================================================================================================
    @RequestMapping(value = "/ajax02", method = {RequestMethod.GET, RequestMethod.POST})
    public String ajax02(Model model) {
        return "/ajax/ajax02";
    }

    @RequestMapping(value="/ajax02Submit", method = {RequestMethod.POST})
    @ResponseBody
    public HashMap<String, Object> ajax02Submit(@RequestParam Map<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("success", true);
        //resultMap.put("success", false);

        resultMap.put("korName", map.get("korName"));
        resultMap.put("engName", map.get("engName"));
        resultMap.put("age", map.get("age"));
        resultMap.put("height", map.get("height"));
        resultMap.put("weight", map.get("weight"));

        return resultMap;
    }

    //    =======================================================================================================================================

    @RequestMapping(value="/ajax03", method={RequestMethod.GET,RequestMethod.POST})
    public String ajax03 (Model model)
    {
        return "/ajax/ajax03";
    }

    @RequestMapping(value="/ajax03Submit", method={RequestMethod.POST})
    @ResponseBody
    public HashMap<String, Object> ajax03Submit( @ModelAttribute Ajax03VO ajax03VO) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("success", true);
        //resultMap.put("success", false);

        resultMap.put("korName", ajax03VO.getKorName());
        resultMap.put("engName", ajax03VO.getEngName());
        resultMap.put("age", ajax03VO.getAge());
        resultMap.put("height", ajax03VO.getHeight());
        resultMap.put("weight", ajax03VO.getWeight());

        return resultMap;
    }

    //    =======================================================================================================================================

    @RequestMapping(value = "/ajax04", method={RequestMethod.GET,RequestMethod.POST})
    public String ajax04 (Model model)
    {
        return "/ajax/ajax04";
    }

    @RequestMapping(value="/ajax04Submit", method={RequestMethod.POST})
    @ResponseBody
    public HashMap<String, Object> ajax04Submit(@RequestParam Map<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("success", true);
        //resultMap.put("success", false);

        resultMap.put("korName", map.get("korName"));
        resultMap.put("engName", map.get("engName"));
        resultMap.put("age", map.get("age"));
        resultMap.put("height", map.get("height"));
        resultMap.put("weight", map.get("weight"));


        return resultMap;
    }

    //    =======================================================================================================================================

    @RequestMapping(value="/ajax05", method={RequestMethod.GET,RequestMethod.POST})
    public String ajax05 (Model model)
    {
        return "/ajax/ajax05";
    }

    @RequestMapping(value="/ajax05Submit", method={RequestMethod.POST})
    @ResponseBody
    public HashMap<String, Object> ajax05Submit( @RequestBody Map<String, Object> map) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("success", true);
        //resultMap.put("success", false);

        resultMap.put("korName", map.get("korName"));
        resultMap.put("engName", map.get("engName"));
        resultMap.put("age", map.get("age"));
        resultMap.put("height", map.get("height"));
        resultMap.put("weight", map.get("weight"));

        return resultMap;
    }

    //    =======================================================================================================================================

    @RequestMapping(value="/ajax06", method={RequestMethod.GET,RequestMethod.POST})
    public String ajax06 (Model model)
    {
        return "/ajax/ajax06";
    }

    @RequestMapping(value="/ajax06Submit", method={RequestMethod.POST})
    @ResponseBody
    public HashMap<String, Object> ajax06Submit( @RequestBody List<Map<String, Object>> list) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        resultMap.put("success", true);
        //resultMap.put("success", false);

        for(int i = 0; i < list.size(); i++) {
            Map<String, Object> map = new HashMap<String, Object>();

            if(i == 1) {
                map = list.get(i);
                resultMap.put("korName", map.get("korName"));
                resultMap.put("engName", map.get("engName"));
                resultMap.put("age", map.get("age"));
                resultMap.put("height", map.get("height"));
                resultMap.put("weight", map.get("weight"));
            }
        }

        List<Map<String, Object>> returnList = new ArrayList<>();
        for (int i = 0  ; i < list.size(); i++){
            Map<String, Object> map = new HashMap<String, Object>();

            map = list.get(i);
            returnList.add(map);
        }

        resultMap.put("returnList", returnList);
        return resultMap;
    }

}
