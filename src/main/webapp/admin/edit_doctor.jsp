<%-- 
    Document   : edit_doctor
    Created on : 29-Jan-2023, 00:11:25
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
      <title>Edit Doctor | ADMIN</title>
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
                     <p class="fs-3 mb-4 text-center"><b>EDIT DOCTORS</b></p>
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


                     <form action="../updateDoctor" method="post">

                        <div class="row mb-4">
                           <div class="col">
                              <label class="form-label">Full Name</label> <input type="text"
                                                                                 required name="fullname" class="form-control"
                                                                                 value="<%=d.getFullName()%>">
                           </div>

                           <div class="col">
                              <label class="form-label">Qualification</label> <input required
                                                                                     value="<%=d.getQualification()%>" name="qualification"
                                                                                     type="text" class="form-control">
                           </div>
                        </div>

                        <div class="row mb-4">
                           <div class="col">
                              <label class="form-label">DOB</label> <input type="date"
                                                                           value="<%=d.getDob()%>" required name="dob"
                                                                           class="form-control">
                           </div>

                           <div class="col">
                              <label class="form-label">Specialist</label> <select name="spec"
                                                                                   required class="form-control">
                                 <option><%=d.getSpecialist()%></option>
                                 <%
                                    SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
                                    List<Specialist> list = dao.getAllSpecialist();
                                    for (Specialist s : list) {
                                 %>
                                 <option><%=s.getSpecialistName()%></option>
                                 <%
                                    }
                                 %>
                              </select>
                           </div>
                        </div>

                        <div class="row mb-4">
                           <div class="col">
                              <label class="form-label">Email</label> <input type="text"
                                                                             value="<%=d.getEmail()%>" required name="email"
                                                                             class="form-control">
                           </div>

                           <div class="col">
                              <label class="form-label">Mob No</label> <input type="text"
                                                                              value="<%=d.getMobNo()%>" required name="mobno"
                                                                              class="form-control">
                           </div>
                        </div>

                        <div class="mb-3">
                           <label class="form-label">Password</label> <input required
                                                                             value="<%=d.getPassword()%>" name="password" type="text"
                                                                             class="form-control">
                        </div>
                                                                             
                        <input type="hidden" name="id" value="<%=d.getId()%>">
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