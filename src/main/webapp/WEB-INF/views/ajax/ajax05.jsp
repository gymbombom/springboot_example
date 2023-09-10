<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Ajax05</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
        crossorigin="anonymous">
</script>

<script>
    const submit = function(){
        let form = {
            korName: "테스트",
            engName: "test",
            age: 20,
            height : "180.2",
            weight : 68.3
        }

        $.ajax({
            url : "<c:url value='/ajax05Submit'/>"
            , data : JSON.stringify(form)
            , type : "POST"
            , contentType: "application/json; charset=utf-8;"
            , dataType : "json"
            , async	: false
            , success : function(data) {
                alert("success");
                console.log(data);
            }
            , error : function(res) {
                alert("error");
                return false;
            }
        });
    }

    const submit2 = function(){
        let url = "<c:url value='/ajax05Submit'/>";

        let form = {
            korName: "테스트",
            engName: "test",
            age: 20,
            height : "180.2",
            weight : 68.3
        }

        fetch(url, {
            method: 'POST',
            body: JSON.stringify(form),
            headers: {
                "Content-Type": 'application/json; charset=utf-8;',
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

    const submit3 = function(){
        let httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = function () {
            if (httpRequest.readyState === XMLHttpRequest.DONE) { //success
                if (httpRequest.status === 200) {
                    let data = httpRequest.response;
                    alert("success");
                    console.log(data);
                } else {
                    alert("fail");
                }
            }
        }

        let form = {
            korName: "테스트",
            engName: "test",
            age: 20,
            height : "180.2",
            weight : 68.3
        }

        httpRequest.open('POST', "<c:url value='/ajax05Submit'/>", true);
        httpRequest.setRequestHeader('Content-Type', 'application/json; charset=utf-8;');
        httpRequest.responseType = "json";
        httpRequest.send(JSON.stringify(form));
    }
</script>
<body>
<p>JSON 문자열전송=> Controller에서 @requestBody로 받음</p>
<button onclick="submit();">submit</button>
<button onclick="submit2();">submit2</button>
<button onclick="submit3();">submit3</button>
</body>
</html>