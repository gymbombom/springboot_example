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

    const fnPageChange2 = function(){
        let url = "<c:url value='/ajax02'/>"

        fetch(url, {
            method: 'GET',
            headers: {
                "Content-Type": 'application/json; charset=utf-8;'
            }
        })
            .then(function(response) {
                if (response.ok) {
                    return response.text(); // Parse the response as text
                } else {
                    throw new Error("Error: " + response.status);
                }
            })
            .then(function(data) {
                document.querySelector("#mainDiv").removeChild;
                document.querySelector("#mainDiv").innerHTML = data;
            })
            .catch(function(error) {
                console.log(error);
            });
    }


</script>
<body>
    <div id="mainDiv">
        <p>ajax jsp 화면 호출 => 화면전환</p>
        <button onclick="fnPageChange();">화면전환</button>
        <button onclick="fnPageChange2();">화면전환2</button>
    </div>


<div></div>
</body>
</html>