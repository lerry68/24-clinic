<%-- 
    Document   : view_appointment_detail
    Created on : Feb 20, 2023, 11:44:11 AM
    Author     : gares
--%>

<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.user.servlet.Detail"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>User Appointment</title>
        <%@include file="component/allcss.jsp"%> 
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
            }

            .backImg {
                background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
                    url("images/user_app_banner.jpg");
                height: 25vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body>
        <%@include file="component/navbar.jsp"%>

        <div class="container-fulid backImg p-5">
            <p class="text-center fs-2 text-white"></p>
        </div>
        <div class="container p-5">
            <div class="row">
                <div class="col-md-6 pe-5 ">
                    <img alt="" src="images/josins.jpg" style="width: 500px;">
                </div>

                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="text-center fs-3 fw-bold text-center text-primary mb-4">Detail Appointment ${idDetail}</p>
                            <c:if test="${not empty errorMsg}">
                                <p class="fs-4 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <c:if test="${not empty succMsg}">
                                <p class=" fs-4 text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>
                            <form class="row g-3" action="appAppointment" method="post">

                                <input type="hidden" name="userid" value="${userObj.id }">

                                <div class="col-md-12">
                                    <label for="inputEmail4" class="form-label">Full Name</label> 
                                    <textarea disabled required name="address" class="form-control" rows="3"
                                                  cols="">${appo.fullName}</textarea>
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Gender</label> 
                                    <input
                                        required type="text" disabled class="form-control" name="fullname" value="${appo.gender}">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Age</label> <input
                                        required type="number" class="form-control" disabled name="age" value="${appo.age}">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Appointment
                                        Date</label> <input type="date" class="form-control" disabled required
                                                        name="appoint_date" value="${appo.appoinDate}">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Email</label> <input
                                        required type="email" class="form-control" name="email" disabled value="${appo.email}">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Phone No</label> <input
                                        maxlength="10" required type="number" disabled class="form-control"
                                        name="phno" value="${appo.phNo}">
                                </div>


                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Diseases</label> <input
                                        required type="text" class="form-control" name="diseases" disabled value="${appo.diseases}">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">Doctor</label>
                                    <input
                                        maxlength="10" required type="text" disabled class="form-control"
                                        name="phno" value="${d.fullName}">

                                    
                                </div>
                                        
                                        <div class="col-md-6">
                                            <label class="form-label">Appoint Total</label>
                                            <input
                                        maxlength="10" required type="text" disabled class="form-control"
                                        name="phno" value="${ap2}">
                                        </div>        

                                <div class="col-md-12">
                                    <label>Comment</label>

                                    <c:if test="${not empty appo.comment}">
                                        <textarea disabled required name="address" class="form-control" rows="3"
                                                  cols="">${appo.comment}</textarea>
                                    </c:if>
                                    <c:if test="${empty appo.comment}">
                                        <textarea required disabled name="address" class="form-control" rows="3"
                                                  cols=""> Not Commented Yet</textarea>
                                    </c:if>

                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="component/footer.jsp"%>

    </body>
</html>
