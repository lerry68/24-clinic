<%-- 
    Document   : view_doctor
    Created on : 28-Jan-2023, 23:50:39
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${ empty adminObj }">
   <c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>Doctor | ADMIN</title>
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
                        <p class="fs-3 text-center"><b>DOCTOR LISTS</b></p>
                        <a class='btn btn-outline-dark btn-sm mb-2' href="add_doctor.jsp">
                           <span class="fs-6 text-center">Add new Doctor</span></a>

                        <table class="table">
                           <thead>
                              <tr class="text-center">
                                 <th scope="col">Full Name</th>
                                 <th scope="col">Qualification</th>
                                 <th scope="col">Specialist</th>
                                 <th scope="col">Email</th>
                                 <th scope="col">Mob No</th>
                                 <th scope="col">Action</th>
                              </tr>
                           </thead>
                           <tbody>
                              <%
                                 DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                 List<Doctor> list2 = dao2.getAllDoctor();
                                 for (Doctor d : list2) {
                              %>
                              <tr class="text-center">
                                 <td><%=d.getFullName()%></td>
                                 <td><%=d.getQualification()%></td>
                                 <td><%=d.getSpecialist()%></td>
                                 <td><%=d.getEmail()%></td>
                                 <td><%=d.getMobNo()%></td>
                                 <td><a href="view_doctor.jsp?id=<%=d.getId()%>"
                                        class="btn btn-sm btn-success">Details</a> 

                                    <a href="edit_doctor.jsp?id=<%=d.getId()%>"
                                       class="btn btn-sm btn-primary">Edit</a> 

                                    <a
                                       href="../deleteDoctor?id=<%=d.getId()%>"
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