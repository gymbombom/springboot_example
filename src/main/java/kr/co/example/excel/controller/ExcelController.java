package kr.co.example.excel.controller;

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

    //=======================================================================================================================================

    /**
     * POI Excel 다운로드 view
     * @return
     * @throws RuntimeException
     */
    @RequestMapping(value="/excel02", method={RequestMethod.GET,RequestMethod.POST})
    public String excel02()throws RuntimeException{
        return "excel/excel02";
    }

    /**
     * POI 엑셀 다운로드 Controller
     * @param model
     * @return
     * @throws RuntimeException
     */
    @RequestMapping(value="/excel02Download", method={RequestMethod.GET,RequestMethod.POST})
    public String excel02Download(ModelMap model)throws RuntimeException{
        //workBook 생성
        SXSSFWorkbook workBook =  new SXSSFWorkbook();

        // 시트 생성
        SXSSFSheet sheet = workBook.createSheet("시트1");

        //style 적용
        CellStyle cellStyle = workBook.createCellStyle();
        cellStyle.setBorderTop(BorderStyle.THIN);
        cellStyle.setBorderBottom(BorderStyle.THIN);
        cellStyle.setBorderLeft(BorderStyle.THIN);
        cellStyle.setBorderRight(BorderStyle.THIN);

        // 헤더 행 생성
        Row headerRow = sheet.createRow(0);

        //헤더 Cell 생성
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("한글이름");
        headerCell.setCellStyle(cellStyle);

        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("Eng Name");
        headerCell.setCellStyle(cellStyle);

        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("나이");
        headerCell.setCellStyle(cellStyle);

        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("키");
        headerCell.setCellStyle(cellStyle);

        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("몸무게");
        headerCell.setCellStyle(cellStyle);


        //내용 행 생성
        Row bodyRow = sheet.createRow(1);

        //내용 Cell 생성
        Cell bodyCell = bodyRow.createCell(0);
        bodyCell.setCellValue("테스트");
        bodyCell.setCellStyle(cellStyle);

        bodyCell = bodyRow.createCell(1);
        bodyCell.setCellValue("Test");
        bodyCell.setCellStyle(cellStyle);

        bodyCell = bodyRow.createCell(2);
        bodyCell.setCellValue(20);
        bodyCell.setCellStyle(cellStyle);

        bodyCell = bodyRow.createCell(3);
        bodyCell.setCellValue("180.3");
        bodyCell.setCellStyle(cellStyle);

        bodyCell = bodyRow.createCell(4);
        bodyCell.setCellValue(68.3);
        bodyCell.setCellStyle(cellStyle);

        model.addAttribute("workbookName", "POI 엑셀 다운로드 Sample");
        model.addAttribute("workbook", workBook);
        return "ExcelDownloadView";
    }
}
