<%-- 
    Document   : UpdateStudent
    Created on : Jun 3, 2023, 3:26:33 PM
    Author     : TienPro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="AddStudent">Create Student</a>
        <c:if test="${not empty requestScope.delete}">
            <h1 style="color:red" >${requestScope.delete}</h1>
        </c:if>
        <br>List of Product
        <table border="1">
            <tr>
                <td>ID</td>
                <td>First Name</td>
                <td>Last Name</td>
                <td>Date</td>
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${data}" var="item">
                <tr>
                    <td id="td_code_${item.getId()}">${item.id}</td>
                    <td id="td_name_${item.getId()}">${item.firstName}</td>
                    <td id="td_quan_${item.getId()}">${item.lastName}</td>
                    <td id="td_price_${item.getId()}">${item.date}</td>
                    <td><a id="td_edit_${item.getId()}" href="EditStudent?id=${item.getId()}">Update</a></td>
                    <td><a id="td_delete_${item.getId()}" href="StudentServlet?id=${item.getId()}&mod=1">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

<-- hello -->
