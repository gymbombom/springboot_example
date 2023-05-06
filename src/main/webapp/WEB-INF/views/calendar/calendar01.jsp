<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.6/index.global.min.js'></script>
    <title>FullCalendar Example</title>
    <script>
        let calendar;

        // DOMContentLoaded
        document.addEventListener('DOMContentLoaded',function(){
            renderCalendar();

            //날짜 클릭 이벤트
            calendar.on('dateClick', function(info) {
                console.log(info);
            });
            
        });

        let renderCalendar = function(){
            let calendarEl = document.getElementById('calendarDiv');

            calendar = new FullCalendar.Calendar(calendarEl, {
                locale: 'ko',
                timeZone : 'KST',
                initialView: 'dayGridMonth',
                height: 'auto',
                navLinks : true,
                headerToolbar: {
                    left: 'prevYear prev next nextYear today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                footerToolbar : {
                    start: 'prevYear prev next nextYear today',
                    center: 'title',
                    end: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                }

            });
            calendar.render();
        }

        let prev=()=>calendar.prev();
        let next =()=>calendar.next();
        let toDay =()=>calendar.today();
        let prevYear =()=>calendar.prevYear();
        let nextYear =()=>calendar.nextYear();

        let getDate = function(){
            let date = calendar.getDate();
            console.log(date);
        }

        let addEventSource = function(){
            let event = [
                            {title:'event1',start: '2023-05-01', allDay:true},
                            {title:'event2',start: '2023-05-02', allDay:true}
                        ];

            calendar.addEventSource(event);
            calendar.refetchEvents();
        }

        let addEvent = function(){
            let event = {title:'event3',start: '2023-05-02', allDay:true}
            calendar.addEvent(event);
            calendar.refetchEvents();
        }



    </script>
</head>

<body>
<h2>FullCalendar Example</h2>
<div>
    <input type="button" onclick="prev()" value="prev"/>
    <input type="button" onclick="next()" value="next"/>
    <input type="button" onclick="toDay()" value="toDay"/>
    <input type="button" onclick="prevYear()" value="prevYear"/>
    <input type="button" onclick="nextYear()" value="nextYear"/>
    <input type="button" onclick="getDate()" value="getDate"/>
</div>
<div>
    <input type="button" onclick="addEventSource()" value="addEventSource"/>
    <input type="button" onclick="addEvent()" value="addEvent"/>
</div>
<div id='calendarDiv'></div>
</body>
</html>