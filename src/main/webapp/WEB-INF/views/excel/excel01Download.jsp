<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.net.URLEncoder" %>


<%
    //파일 다운로드 날짜 생성
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    String strToday = sdf.format(cal.getTime());
    //파일 Title 생성(IE,Chrome 한글 UTF-8 인코딩)
    String sTitle = URLEncoder.encode("엑셀 다운로드 Sample", "UTF-8").replaceAll("\\+", "%20");

    response.setHeader("Content-Disposition", "attachment;filename="+strToday+"_"+sTitle+".xls"+";");
    response.setContentType( "application/download; UTF-8" );
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>

        <!-- meta 정보가 있어야 Excel 한글 정상 출력 가능함  -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <title>엑셀파일 다운로드 Sample</title>
        <style>
            table,td,tr {
            border:1px black solid;
            }
        </style>
    </head>

    <body>
        <table>
            <tr>
                <th>korName</th>
                <th>EngName</th>
                <th>age</th>
                <th>height</th>
                <th>weight</th>
            </tr>
            <tr>
                <td>${map.korName}</td>
                <td>${map.EngName}</td>
                <td>${map.age}</td>
                <td>${map.height}</td>
                <td>${map.weight}</td>
            </tr>
        </table>
    </body>
</html>