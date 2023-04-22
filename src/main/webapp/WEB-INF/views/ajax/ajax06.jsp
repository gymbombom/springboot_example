<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Ajax06</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous">
</script>

<script>
    const submit = function(){

        let JSONArray = [];

        let form1 = {
            korName: "테스트1",
            engName: "test1",
            age: 20,
            height : "180.2",
            weight : 68.3
        }
        JSONArray.push(form1);

        let form2 = {
            korName: "테스트2",
            engName: "test2",
            age: 20,
            height : "180.2",
            weight : 68.3
        }
        JSONArray.push(form2);

        $.ajax({
            url : "<c:url value='/ajax06Submit'/>"
            , data : JSON.stringify(JSONArray)
            , type : "POST"
            , contentType: "application/json; charset=utf-8;"
            , dataType : "json"
            , traditional: true
            , async	: true
            , success : function(data) {
                alert("success");
                console.log(data);
                console.log(data.returnList[0]);
            }
            , error : function(res) {
                alert("error");
                return false;
            }
        });
    }
</script>
<body>
<p>JsonArray 를 controller에서 처리</p>
<button onclick="submit();">submit</button>
</body>
</html>