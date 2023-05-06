<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Ajax09</title>
</head>

<script
        src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
        crossorigin="anonymous">
</script>

<script>
    const fnPageChange = function(){

        $.ajax({
            url : "<c:url value='/ajax02'/>"
            , type : "GET"
            , dataType : "html"
            , async	: true
            , success : function(data) {
                $('#mainDiv').children().remove();
                $('#mainDiv').html(data);
            }
            , error : function(res) {
                alert("error");
                return false;
            }
        });
    }


</script>
<body>
    <div id="mainDiv">
        <p>ajax jsp 화면 호출 => 화면전환</p>
        <button onclick="fnPageChange();">화면전환</button>
    </div>


<div></div>
</body>
</html>