<%--<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>--%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ empty adminObj }">
    <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>User | ADMIN</title>
        <%@include file="../component/allcss.jsp"%>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container-fluid p-3"
             <span><a class="btn btn-dark btn-sm mt-3 mb-3" onclick="location.href = 'index.jsp'"><i class="fa-solid fa-chevron-left"></i> Home</a></span>

            <c:if test="${not empty errorMsg}">
                <p class="fs-5 text-center text-danger"><b>${errorMsg}</b></p>
                <br>
                <c:remove var="errorMsg" scope="session" />
            </c:if>
            <c:if test="${not empty succMsg}">
                <div class="fs-5 text-center text-success" role="alert"><b>${succMsg}</b></div>
                <br>
                <c:remove var="succMsg" scope="session" />
            </c:if>

            <div class="container">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card paint-card">
                            <div class="card-body">
                                <p class="fs-3 text-center"><b>USER LISTS</b></p>

                                <table class="table">
                                    <thead>
                                        <tr class="text-center">
                                            <th scope="col">Full Name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Password</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            UserDao dao = new UserDao(DBConnect.getConn());
                                            List<User> list2 = dao.getAllUser();
                                            for (User u : list2) {
                                        %>
                                        <tr class="text-center" >
                                            <td><%=u.getFullName()%></td>
                                            <td><%=u.getEmail()%></td>
                                            <td><%=u.getPassword()%></td>
                                            <td><%=u.getStatus()%></td>

                                            <td style="display: flex; gap: 5px; align-items: center; justify-content: center;">

                                                <a href="edit_user.jsp?id=<%=u.getId()%>"
                                                   class="btn btn-sm btn-primary">Edit</a> 

<% if (u.getStatus().equals("Active")) { %>
                                                <form action="../updateStatusUser" method="POST">
                                                <input type="hidden" name="id" value="<%=u.getId()%>">
                                                <input type="hidden" name="status" value="<%=u.getStatus()%>">
                                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure want to deactivate this account?')">Deactivate Account</button>
</form></td>
<% } else { %>
                                                <form action="../updateStatusUser" method="POST">
                                                <input type="hidden" name="id" value="<%=u.getId()%>">
                                                <input type="hidden" name="status" value="<%=u.getStatus()%>">
                                                <button type="submit" class="btn btn-sm btn-success" onclick="return confirm('Are you sure want to active this account?')">Active Account</button>
</form></td>
<% }%>
                                                
                                        </tr>
                                        <%
                                            }
                                        %>  



                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>