<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Ajax02</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
        crossorigin="anonymous">
</script>

<script>
    const submit = function(){
        let formSerialize = $("#form").serialize();

        console.log(formSerialize);

        $.ajax({
            url : "<c:url value='/ajax02Submit'/>"
            , data : formSerialize
            , type : "POST"
            , dataType : "json"
            , async	: true
            , success : function(data) {
                console.log(data);
                alert("success");
            }
            , error : function(res) {
                alert(res);
                return false;
            }
        });
    }
</script>
    <body>
        <p>Form을 Ajax로 전송 => controller에서 map으로 처리</p>
        <form id="form" name="form">
            한글이름: <input type="text" name="korName" value="테스트">
            영문이름: <input type="text" name="engName" value="Test">
            나이: <input type="number" name="age" value=20>
            키: <input type="text" name="height" value="180.2">
            몸무게: <input type="number" name="weight" value=68.3>
        </form>
        <button onclick="submit();">submit</button>
    </body>
</html>