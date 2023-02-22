<%-- 
    Document   : edit_doctor
    Created on : 29-Jan-2023, 00:11:25
    Author     : FarrelAkiela
--%>

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
        <title>Edit User | ADMIN</title>
        <%@include file="../component/allcss.jsp"%>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>

        <%@include file="navbar.jsp"%>

        <div class="container-fluid p-3">
            <span><a class="btn btn-dark btn-sm mt-3 mb-3" onclick="history.go(-1)"><i class="fa-solid fa-chevron-left"></i> Back</a></span>
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 mb-4 text-center"><b>EDIT USERS</b></p>
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-3 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                UserDao dao = new UserDao(DBConnect.getConn());
                                User u = dao.getUserById(id);
                            %>


                            <form action="../updateUser" method="post">

                                <div class="mb-3">
                                    <label class="form-label">Full Name</label> <input required
                                                                                       value="<%=u.getFullName()%>" name="fullname" type="text"
                                                                                       class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label> <input required
                                                                                   value="<%=u.getEmail()%>" name="email" type="text"
                                                                                   class="form-control">
                                </div>                     
                                <div class="mb-3">
                                    <label class="form-label">Password</label> <input required
                                                                                   value="<%=u.getPassword()%>" name="password" type="text"
                                                                                   class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Status</label> <input required
                                                                                   value="<%=u.getStatus()%>" name="status" type="text"
                                                                                   class="form-control" disabled>
                                </div>

                                <input type="hidden" name="id" value="<%=u.getId()%>">
                                <div class="text-center">
                                    <button type="submit" class="btn btn-dark mt-3 mb-3">Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>




            </div>
        </div>
    </body>
</html>