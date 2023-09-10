<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Ajax06</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
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

    const submit2 = function(){
        let url = "<c:url value='/ajax06Submit'/>"
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



        fetch(url, {
            method: 'POST',
            body: JSON.stringify(JSONArray),
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

        httpRequest.open('POST', "<c:url value='/ajax06Submit'/>", true);
        httpRequest.setRequestHeader('Content-Type', 'application/json; charset=utf-8;');
        httpRequest.responseType = "json";
        httpRequest.send(JSON.stringify(JSONArray));
    }

</script>
<body>
<p>JsonArray 를 controller에서 처리</p>
<button onclick="submit();">submit</button>
<button onclick="submit2();">submit2</button>
<button onclick="submit3();">submit3</button>
</body>
</html>