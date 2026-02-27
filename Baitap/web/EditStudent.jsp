<%-- 
    Document   : AddProduct
    Created on : Jan 30, 2026, 2:23:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edit Student!</h1>
        <form action="EditStudent" method="post">
            ID: <input type="text" id="ID" name="id" value="${student.id}" readOnly/>

            FirstN: <input type="text" id="firstName" name="firstName" value="${student.firstName}"/>
            lastN: <input type="text" name="lastName" id="lastName" value="${student.lastName}"/>
            Date: <input type="date" name="date" id="date" value="${student.date}"/> </br>

            <input type="submit" id="submit" name="submit" value="Edit product"/>
        </form>
    </body>
</html>
