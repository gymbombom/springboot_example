package kr.co.example.calendar.controller;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.Map;

@Controller
public class CalendarController {

    /**
     * FullCalendar View
     *
     * @param model
     * @return
     * @throws RuntimeException
     */
    @RequestMapping(value="/calendar01", method={RequestMethod.GET,RequestMethod.POST})
    public String calendar01(ModelMap model)throws RuntimeException{
        return "calendar/calendar01";
    }

    //=======================================================================================================================================

}
