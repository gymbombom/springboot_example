<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Ajax03</title>
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
            url : "<c:url value='/ajax03Submit'/>"
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

    const submit2 = function(){
        let form  = document.querySelector("#form");
        let formSerialize = serializeForm(form);
        console.log(formSerialize);

        $.ajax({
            url : "<c:url value='/ajax03Submit'/>"
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

    const submit3 = function(){
        let form  = document.querySelector("#form");
        let formSerialize = serializeForm(form);
        let url = "<c:url value='/ajax03Submit'/>";

        fetch(url, {
            method: 'POST',
            body: new URLSearchParams(formSerialize),
            headers: {
                "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8',
                "Accept" : "application/json"
            }
        })
            .then(function(response) {
                if (response.ok) {
                    return response.json(); // Parse the response as JSON
                } else {
                    throw new Error("Error: " + response.status);
                }
            })
            .then(function(data) {
                console.log(data);
                alert("success");
            })
            .catch(function(error) {
                console.log(error);
            });
    }

    const submit4 = function(){
        let xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) { //success
                if (xhr.status === 200) {
                    let data = xhr.response;
                    console.log(data);
                    alert("success");
                } else {
                    alert("fail");
                }
            }
        }

        let form = document.querySelector("#form");
        let formSerialize = serializeForm(form);

        xhr.open('POST', "<c:url value='/ajax03Submit'/>", true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8;');
        xhr.responseType = "json";
        xhr.send(new URLSearchParams(formSerialize));
    }

    function serializeForm(form) {
        let formData = new FormData(form);
        let serialized = {};

        for (let [key, value] of formData.entries()) {
            serialized[key] = value;
        }

        return serialized;
    }

</script>
<body>
<p>Form을 Ajax로 전송 => controller에서 model로 처리</p>
<form id="form" name="form">
    한글이름: <input type="text" name="korName" value="테스트">
    영문이름: <input type="text" name="engName" value="Test">
    나이: <input type="number" name="age" value=20>
    키: <input type="text" name="height" value="180.2">
    몸무게: <input type="number" name="weight" value=68.3>
</form>
<button onclick="submit();">submit</button>
<button onclick="submit2();">submit2</button>
<button onclick="submit3();">submit3</button>
<button onclick="submit4();">submit4</button>
</body>
</html>