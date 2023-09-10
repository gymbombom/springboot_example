<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Ajax04</title>
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
            url: "<c:url value='/ajax04Submit'/>",
            type: "POST",
            dataType : "json",
            data: form,
            success: function(data){
                alert("success");
                console.log(data);
            },
            error: function(e){
                alert("error");
            }
        });
    }

    const submit2 = function(){
        let form = {
            korName: "테스트",
            engName: "test",
            age: 20,
            height : "180.2",
            weight : 68.3
        }

        let formData = new URLSearchParams();
        for (let key in form) {
            formData.append(key, form[key]);
        }

        let url = "<c:url value='/ajax04Submit'/>";

        fetch(url, {
            method: 'POST',
            body: formData,
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

    const submit3 = function(){
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

        let form = {
            korName: "테스트",
            engName: "test",
            age: 20,
            height : "180.2",
            weight : 68.3
        }
        let formData = new URLSearchParams();
        for (let key in form) {
            formData.append(key, form[key]);
        }

        xhr.open('POST', "<c:url value='/ajax03Submit'/>", true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8;');
        xhr.setRequestHeader("Accept" , "application/json");
        xhr.responseType = "json";
        xhr.send(formData);
    }
</script>
<body>
<p>JsonObject로 Ajax전송 => Controller에서 Map으로 받음</p>
<button onclick="submit();">submit</button>
<button onclick="submit2();">submit2</button>
<button onclick="submit3();">submit3</button>
</body>
</html>