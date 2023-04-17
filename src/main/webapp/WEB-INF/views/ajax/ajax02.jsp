<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Ajax02</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous">
</script>

<script>
    var submit = function(){
        $.ajax({
            url : "<c:url value='/ajax02Submit'/>"
            , data : $("#form").serialize()
            , type : "POST"
            , dataType : "json"
            , async	: true
            , success : function(data) {
                console.log(data);
                alert(data.korName);
            }
            , error : function(res) {
                alert("에러가 발생하였습니다.");
                return false;
            }
        });
    }
</script>
    <body>
        <p>Form을 Ajax로 전송 => controller에서 map으로 처리</p>
        <form id="form" name="form">
            한글이름: <input type="text" name="korName" value="홍길동">
            영문이름: <input type="text" name="engName" value="Hong Kil Dong">
            나이: <input type="number" name="age" value=20>
            키: <input type="text" name="height" value="180.2">
            몸무게: <input type="number" name="weight" value=68.3>
        </form>
        <button onclick="submit();">submit</button>
    </body>
</html>