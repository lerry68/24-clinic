<%-- 
    Document   : edit_doctor
    Created on : 29-Jan-2023, 00:11:25
    Author     : FarrelAkiela
--%>

<%--<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>--%>
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
      <title>Edit Specialist | ADMIN</title>
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
                     <p class="fs-3 mb-4 text-center"><b>EDIT SPECIALISTS</b></p>
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
                        SpecialistDao dao2 = new SpecialistDao(DBConnect.getConn());
                        Specialist d = dao2.getSpecialistById(id);
                     %>


                     <form action="../updateSpecialist" method="post">

                        <div class="mb-3">
                           <label class="form-label">Nama Spesialis</label> <input required
                                                                             value="<%=d.getSpecialistName()%>" name="spec_name" type="text"
                                                                             class="form-control">
                        </div>
                        
                        <div class="mb-3">
                           <label class="form-label">Deskripsi Spesialis</label> <input required
                                                                             value="<%=d.getSpecialistDesc()%>" name="spec_desc" type="text"
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