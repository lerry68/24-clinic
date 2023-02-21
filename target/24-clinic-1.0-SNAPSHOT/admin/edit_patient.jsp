<%-- 
    Document   : edit_patient
    Created on : 21-Feb-2023, 10:53:32
    Author     : FarrelAkiela
--%>

<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
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
      <title>Edit Patient | ADMIN</title>
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
                     <p class="fs-3 mb-4 text-center"><b>EDIT PATIENTS</b></p>
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

                        AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                        Appointment ap = dao.getAppointmentById(id);
                     %>


                     <form action="../updatePatient" method="post">

                        <div class="row mb-3">
                           <div class="col">
                              <label class="form-label">Full Name</label> <input type="text" class="form-control" value="<%=ap.getFullName()%>" name="fullname">
                           </div>

                           <div class="col">
                              <label class="form-label">Gender</label>
                              <select class="form-control" name="gender"
                                      required>
                                 <option value="<%=ap.getGender()%>"><%=ap.getGender()%></option>
                                 <option value="Male">Male</option>
                                 <option value="Female">Female</option>
                              </select>
                           </div>
                        </div>

                        <div class="row mb-3">
                           <div class="col">
                              <label class="form-label">Age</label> <input type="text" value="<%=ap.getAge()%>" class="form-control" name="age">
                           </div>

                           <div class="col">
                              <label class="form-label">Appoint Date</label> <input type="date" value="<%=ap.getAppoinDate()%>" class="form-control" name="appoint_date">
                           </div>
                        </div>

                        <div class="row mb-3">
                           <div class="col">
                              <label class="form-label">Email</label> <input type="text" value="<%=ap.getEmail()%>" class="form-control" name="email">
                           </div>

                           <div class="col">
                              <label class="form-label">Phone Number</label> <input type="number" value="<%=ap.getPhNo()%>" class="form-control" name="phno">
                           </div>
                        </div>

                        <div class="row mb-3">
                           <div class="col">
                              <label class="form-label">Diseases</label> <input value="<%=ap.getDiseases()%>" type="text" class="form-control" name="diseases">
                           </div>

                           <div class="col">
                              <label class="form-label">Doctor Name</label> <select
                                 required class="form-control" name="doct">
                                 <%
                                    int id2 = Integer.parseInt(request.getParameter("id_doct"));
                                    DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                    Doctor d = dao2.getDoctorById(id2);
                                 %>
                                 <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)</option>
                                 <%
                                    List<Doctor> list = dao2.getAllDoctor();
                                    for (Doctor d2 : list) {
                                 %>
                                 <option value="<%=d2.getId()%>"><%=d2.getFullName()%> (<%=d2.getSpecialist()%>)
                                 </option>
                                 <%
                                    }
                                 %>
                              </select>
                           </div>
                        </div>

                        <div class="row mb-3">
                           <div class="col">
                              <label class="form-label">Address</label> <input value="<%=ap.getAddress()%>" type="text" class="form-control" name="address">
                           </div>

                           <div class="col">
                              <label class="form-label">Status</label> <input type="text" value="<%=ap.getStatus()%>" class="form-control" name="status">
                           </div>
                        </div>

                        <div class="row mb-3">
                           <div class="col">
                              <label class="form-label">Doctor's Comment</label>
                              <textarea class="form-control" value="<%=ap.getComment()%>" rows="3" name="comment"><%=ap.getComment()%></textarea>
                           </div>
                        </div>

                              <input type="hidden" name="id" value="<%=ap.getId()%>">
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