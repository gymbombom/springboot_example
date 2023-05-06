<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Ajax08</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
        crossorigin="anonymous">
</script>

<script>
    const submit = function(){

        //form을 JSON Object로 변경
        let formSerialize = $("#form").serializeObject();

        let subAjax08VO = {
            korName: "서브VO",
            engName: "subAjaxVO",
            age: 21,
            height : "180.2",
            weight : 68.3
        }

        let subAjax08VOList = [];

        let subAjax08VO1  = {
            korName: "서브VOList1",
            engName: "subAjaxVOList1",
            age: 21,
            height : "180.2",
            weight : 68.3
        }
        subAjax08VOList.push(subAjax08VO1);

        let subAjax08VO2  = {
            korName: "서브VOList2",
            engName: "subAjaxVOList2",
            age: 21,
            height : "180.2",
            weight : 68.3
        }
        subAjax08VOList.push(subAjax08VO2);

        formSerialize.subAjax08VO = subAjax08VO;
        formSerialize.subAjax08VOList = subAjax08VOList;

        console.log(formSerialize);



        $.ajax({
            url : "<c:url value='/ajax08Submit'/>"
            , data : JSON.stringify(formSerialize)
            , type : "POST"
            , contentType: "application/json; charset=utf-8;"
            , dataType : "json"
            , traditional: true
            , async	: true
            , success : function(data) {
                console.log(data);
                alert(data.subAjax08VO.korName);
            }
            , error : function(res) {
                alert("error");
                return false;
            }
        });
    }

    // form => JSON Object 로 변경
    $.fn.serializeObject = function()
    {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };

</script>
<body>
<p>form을 JSON Object 로 변경하여 전송 => VO(model) 으로 받음.</p>
<form id="form" name="form">
    한글이름: <input type="text" name="korName" value="테스트">
    영문이름: <input type="text" name="engName" value="test">
    나이: <input type="number" name="age" value=20>
    키: <input type="text" name="height" value="180.2">
    몸무게: <input type="number" name="weight" value=68.3>
</form>
<button onclick="submit();">submit</button>
</body>
</html>