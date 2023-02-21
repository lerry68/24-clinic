<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Admin Page | 24-Clinic</title>
      <%@include file="../component/allcss.jsp"%>
      <style type="text/css">
         .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
         }
      </style>
   </head>
   <body>
       
       <%@include file="navbar.jsp"%>

	<c:if test="${ empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

      <div class="container p-5">
         <p class="text-center fs-3"><b>ADMIN DASHBOARD</b></p>
         <br><br>

         <c:if test="${not empty errorMsg}">
            <p class="fs-4 text-center text-danger">${errorMsg}</p>
            <br><br>
            <c:remove var="errorMsg" scope="session" />
         </c:if>
         <c:if test="${not empty succMsg}">
            <div class="fs-4 text-center text-success" role="alert">${succMsg}</div>
            <br><br>
            <c:remove var="succMsg" scope="session" />
         </c:if>

         <%
            DoctorDao dao = new DoctorDao(DBConnect.getConn());
         %>
         <div class="row justify-content-center">
            <div class="col-md-4">
               <div class="card paint-card">
                  <div class="card-body text-center text-dark">
                     <i class="fas fa-user-md fa-3x"></i><br>
                     <p class="fs-4 text-center">
                        Doctor <br><%=dao.countDoctor()%>
                     </p>
                  </div>
               </div>
            </div>

            <div class="col-md-4">
               <div class="card paint-card">
                  <div class="card-body text-center text-dark">
                     <i class="far fa-calendar-check fa-3x"></i><br>
                     <p class="fs-4 text-center">
                        Specialist <br><%=dao.countSpecialist()%>
                     </p>
                  </div>
               </div>
            </div>
         </div>

         <div class="row justify-content-center">
            <div class="col-md-4 mt-4">
               <div class="card paint-card">
                  <div class="card-body text-center text-dark">
                     <i class="fas fa-user-circle fa-3x"></i><br>
                     <p class="fs-4 text-center">
                        User <br><%=dao.countUSer()%>
                     </p>
                  </div>
               </div>
            </div>

            <div class="col-md-4 mt-4">
               <div class="card paint-card">
                  <div class="card-body text-center text-dark">
                     <i class="far fa-calendar-check fa-3x"></i><br>
                     <p class="fs-4 text-center">
                        Total Appointment <br><%=dao.countAppointment()%>
                     </p>
                  </div>
               </div>
            </div>

         </div>
      </div>

   </body>
</html>