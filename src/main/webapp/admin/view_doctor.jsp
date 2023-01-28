<%-- 
    Document   : view_doctor
    Created on : 29-Jan-2023, 00:10:54
    Author     : FarrelAkiela
--%>

<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Insert title here</title>
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
            <div class="col-md-4 offset-md-4">
               <div class="card paint-card">
                  <div class="card-body">
                     <p class="fs-3 mb-4 text-center"><b>DOCTOR DETAILS</b></p>

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
                        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                        Doctor d = dao2.getDoctorById(id);
                     %>

                     <div class="row mb-4">
                        <div class="col">
                           <label class="form-label">Full Name</label> <input type="text" class="form-control" value="<%=d.getFullName()%>"
                                                                              disabled>
                        </div>

                        <div class="col">
                           <label class="form-label">Qualification</label> <input value="<%=d.getQualification()%>" type="text" 
                                                                                  class="form-control" disabled>
                        </div>
                     </div>

                     <div class="row mb-4">
                        <div class="col">
                           <label class="form-label">Date of Birth</label> <input type="date" value="<%=d.getDob()%>" class="form-control"
                                                                                  disabled>
                        </div>

                        <div class="col">
                           <label class="form-label">Specialist</label><input type="text" value="<%=d.getSpecialist()%>" class="form-control"
                                                                              disabled>
                        </div>
                     </div>

                     <div class="row mb-4">
                        <div class="col">
                           <label class="form-label">Email</label> <input type="text" value="<%=d.getEmail()%>" class="form-control"
                                                                          disabled>
                        </div>

                        <div class="col">
                           <label class="form-label">Phone Number</label> <input type="text" value="<%=d.getMobNo()%>" class="form-control"
                                                                           disabled>
                        </div>
                     </div>



                     <div class="mb-3">
                        <label class="form-label">Password</label> <input value="<%=d.getPassword()%>" type="text" class="form-control"
                                                                          disabled>
                     </div>

                  </div>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>