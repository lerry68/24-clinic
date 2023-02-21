<%-- 
    Document   : view_patient
    Created on : 20-Feb-2023, 11:08:12
    Author     : FarrelAkiela
--%>

<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ empty adminObj }">
   <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Patient Details | ADMIN</title>
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
            <div class="col-md-6 offset-md-3 mb-5">
               <div class="card paint-card">
                  <div class="card-body">
                     <p class="fs-3 mb-4 text-center"><b>PATIENT DETAILS</b></p>

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
                        String name = request.getParameter("name");
                        int user_id = Integer.parseInt(request.getParameter("user_id"));

                        AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                        Appointment ap = dao.getAppointmentById(id);
                        int ap2 = dao.getPatientTotalAppoint(name, user_id);

                        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                        Doctor d = dao2.getDoctorById(ap.getDoctorId());

                     %>

                     <div class="row mb-3">
                        <div class="col">
                           <label class="form-label">Full Name</label> <input type="text" class="form-control" value="<%=ap.getFullName()%>"
                                                                              disabled>
                        </div>
                     </div>

                     <div class="row mb-3">
                        <div class="col">
                           <label class="form-label">Age</label> <input type="text" value="<%=ap.getAge()%>" class="form-control"
                                                                        disabled>
                        </div>

                        <div class="col">
                           <label class="form-label">Gender</label> <input value="<%=ap.getGender()%>" type="text" 
                                                                           class="form-control" disabled>
                        </div>
                     </div>

                     <div class="row mb-3">
                        <div class="col">
                           <label class="form-label">Appoint Date</label> <input type="text" value="<%=ap.getAppoinDate()%>" class="form-control"
                                                                                 disabled>
                        </div>

                        <div class="col">
                           <label class="form-label">Appoint Total</label><input type="number" value="<%=ap2%>" class="form-control"
                                                                                 disabled>
                        </div>
                     </div>

                     <div class="row mb-3">
                        <div class="col">
                           <label class="form-label">Email</label> <input type="text" value="<%=ap.getEmail()%>" class="form-control"
                                                                          disabled>
                        </div>

                        <div class="col">
                           <label class="form-label">Phone Number</label> <input type="number" value="<%=ap.getPhNo()%>" class="form-control"
                                                                                 disabled>
                        </div>
                     </div>

                     <div class="row mb-3">
                        <div class="col">
                           <label class="form-label">Diseases</label> <input value="<%=ap.getDiseases()%>" type="text" class="form-control"
                                                                             disabled>
                        </div>

                        <div class="col">
                           <label class="form-label">Doctor Name</label> <input type="text" value="<%=d.getFullName()%>" class="form-control"
                                                                                disabled>
                        </div>
                     </div>

                     <div class="row mb-3">
                        <div class="col">
                           <label class="form-label">Address</label> <input value="<%=ap.getAddress()%>" type="text" class="form-control"
                                                                            disabled>
                        </div>

                        <div class="col">
                           <label class="form-label">Status</label> <input type="text" value="<%=ap.getStatus()%>" class="form-control"
                                                                           disabled>
                        </div>
                     </div>

                     <div class="row mb-3">
                        <div class="col">
                           <label class="form-label">Doctor's Comment</label>
                           <textarea class="form-control" value="<%=ap.getComment()%>" rows="3" disabled><%=ap.getComment()%></textarea>
                        </div>
                     </div>

                  </div>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>