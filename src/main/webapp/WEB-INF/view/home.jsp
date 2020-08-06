<%--
  Created by IntelliJ IDEA.
  User: Haider
  Date: 06-Aug-20
  Time: 11:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>

<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .topForm{
            padding-top: 90px;
            /* size: 50px; */
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin-left: 250px;
            /* padding-left: 100px; */
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }


    </style>
</head>

<body>

<div id="topBody" style="background-color: #33cbf5;
                                 height: 200px;">

    <div class="topForm" align="center" >
        <form:form action="addNewEmployee" modelAttribute="newEmployee">

            Name: <form:input  placeholder="Enter your name" path="name" required="required"/>
            Designation: <form:input placeholder="Enter your designation" path="designation" required="required"/>
            <input type="submit" value="Submit"/>

        </form:form>
    </div>

    <br><br>
</div>

<div class="bodyParagraph" align="center">
    <p><h1>List of Employees</h1></p>
</div>

<div class="tableBody">


    <table>
        <tr>
            <th>Name</th>
            <th>Designation</th>
            <th>Action</th>
        </tr>
        <c:set var="test" value="test1"/>

        <% int index=0;
//            pageContext.setAttribute("resp", index);
        %>

        <c:forEach var="listOfEmployee" items="${employeeList}">
            <c:url var="deleteLink" value="/deleteEmployee">
                <c:param name="employeeIndex" value="" >   </c:param>
            </c:url>
            <tr>
                <td>${listOfEmployee.name} <c:out value="${index}" /> </td>
                <td>${listOfEmployee.designation}</td>
                <td><a href="/deleteEmployee/<%=index%>"> <i class="fa fa-user-times" style="font-size:25px;color:#33cbf5;"></i> </a> </td>
            </tr>
            <% index++; %>
        </c:forEach>

    </table>

</div>


</body>


</html>


