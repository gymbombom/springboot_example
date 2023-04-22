<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>POI 엑셀 다운로드 Sample View</title>
    <script>
        const fnExcelDownload01 = function(){
            document.excelForm.action = "<c:url value='excel02Download'/>";
            document.excelForm.submit();
        }

        const fnExcelDownload02 = function(){
            location.href= "<c:url value='excel02Download'/>";
        }
    </script>
</head>

<body>
<h2>POI 엑셀다운로드샘플</h2>
<form id="excelForm" name="excelForm">
</form>
<button type="button"  onclick="fnExcelDownload01();">POI 엑셀 다운로드1</button>
<button type="button"  onclick="fnExcelDownload02();">POI 엑셀 다운로드2</button>
</body>
</html>