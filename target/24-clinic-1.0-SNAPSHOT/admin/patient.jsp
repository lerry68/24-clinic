<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
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
      <title>Patient | ADMIN</title>
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
                        <p class="fs-3 text-center"><b>PATIENT LISTS</b></p>

                        <table class="table">
                           <thead>
                              <tr class="text-center">
                                 <th scope="col">Full Name</th>
                                 <th scope="col">Appoint Date</th>
                                 <th scope="col">Phone Number</th>
                                 <th scope="col">Diseases</th>
                                 <th scope="col">Status</th>
                                 <th scope="col">Action</th>

                              </tr>
                           </thead>
                           <tbody>
                              <%
                                 AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                                 DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                 List<Appointment> list = dao.getAllAppointment();
                                 for (Appointment ap : list) {
                                    Doctor d = dao2.getDoctorById(ap.getDoctorId());
                              %>
                              <tr class="text-center">
                                 <th><%=ap.getFullName()%></th>
                                 <td><%=ap.getAppoinDate()%></td>
                                 <td><%=ap.getPhNo()%></td>
                                 <td><%=ap.getDiseases()%></td>
                                 <td><%=ap.getStatus()%></td>
                                 <td><a href="view_patient.jsp?id=<%=ap.getId()%>&amp;name=<%=ap.getFullName()%>&amp;user_id=<%=ap.getUserId()%>"
                                        class="btn btn-sm btn-success">Details</a> 

                                    <a href="edit_patient.jsp?id=<%=ap.getId()%>&amp;id_doct=<%=ap.getDoctorId()%>"
                                       class="btn btn-sm btn-primary">Edit</a> 

                                    <a
                                       href="../deletePatient?id=<%=ap.getId()%>"
                                       class="btn btn-sm btn-danger" onclick="return confirm('Are you sure want to delete this data?')">Delete</a></td>
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