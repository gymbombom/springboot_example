<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Ajax01</title>
    <script
            src="https://code.jquery.com/jquery-3.6.4.js"
            integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
            crossorigin="anonymous">
    </script>

    <script>
        const submit = function(){
            $.ajax({
                type: 'POST',
                url: "<c:url value='/ajax01Submit'/>",
                data: new FormData($("#ajax01VO")[0]),
                processData: false,
                contentType: false,
                dataType: "json",
                success: function (result) {
                    if (result.success) {
                        console.log(result);
                        alert("success");
                    } else {
                        alert("fail");
                    }
                },
                error: function (request, status, error) {
                    alert(error);
                }
            });
        }

        const submit2 = function(){
            let ajax01VO = document.querySelector("#ajax01VO");
            let formData = new FormData(ajax01VO);

            $.ajax({
                type: 'POST',
                url: "<c:url value='/ajax01Submit'/>",
                data: formData,
                processData: false,
                contentType: false,
                dataType: "json",
                success: function (result) {
                    if (result.success) {
                        console.log(result);
                        alert("success");
                    } else {
                        alert("fail");
                    }
                },
                error: function (request, status, error) {
                    alert(error);
                }
            });
        }

        const submit3 = function(){
            let ajax01VO = document.querySelector("#ajax01VO");
            let formData = new FormData(ajax01VO);
            let url = "<c:url value='/ajax01Submit'/>";

            fetch(url, {
                method: 'POST',
                body: new URLSearchParams(formData),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
                    "Accept" : "application/json"
                }
            })
                .then(function(response) {
                    return response.json();
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
                    if (xhr.status === 201) {
                        let data = xhr.response;
                        console.log(data);
                        alert("success");
                    } else {
                        alert("fail");
                    }
                }
            }

            let ajax01VO = document.querySelector("#ajax01VO");
            let formData = new FormData(ajax01VO);

            xhr.open('POST', "<c:url value='/ajax01Submit'/>", true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8;');
            xhr.responseType = "json";
            xhr.send(new URLSearchParams(formData));
        }

    </script>
</head>
<body>
<p>multipart/form-data Ajax호출</p>
<form id="ajax01VO" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
    한글이름: <input type="text" name="korName" value="테스트">
    영문이름: <input type="text" name="engName" value="test">
    나이: <input type="number" name="age" value=20>
    키: <input type="text" name="height" value="180.2">
    몸무게: <input type="number" name="weight" value=68.3>
    <button onclick="submit();">submit</button>
    <button onclick="submit2();">submit2</button>
    <button onclick="submit3();">submit3</button>
    <button onclick="submit4();">submit4</button>
</form>
</body>
</html>