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
        <h1>Add Product!</h1>
        <form action="AddStudent" method="post">
            First Name: <input type="text" name="fname" id="fname"/>
            Last Name: <input type="text" name="lname" id="lname"/> </br>
            Date: <input type="date" name="date" id="date"/> </br>
            Is Discontinued: <input type='checkbox' name="dis" id="pdis"/> </br>
            <input type="submit" id="submit" name="submit" value="Add product"/>
        </form>
    </body>
</html>
