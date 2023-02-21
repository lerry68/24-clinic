<%-- 
    Document   : doctor
    Created on : 28-Jan-2023, 23:25:47
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
      <title>Add Specialist | ADMIN</title>
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
                     <p class="fs-3 mb-4 text-center"><b>ADD SPECIALIST</b></p>

                     <c:if test="${not empty errorMsg}">
                        <p class="fs-3 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session" />
                     </c:if>
                     <c:if test="${not empty succMsg}">
                        <div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
                        <c:remove var="succMsg" scope="session" />
                     </c:if>

                     <form action="../addSpecialist" method="post">

                        <div class="row mb-4">
                           <div class="col">
                              <label class="form-label">Nama Specialist</label> <input type="text"
                                                                                 required name="spec_name" class="form-control">
                           </div>
                        </div>
                         
                        <div class="row mb-4">
                           <div class="col">
                              <label class="form-label">Deskripsi Specialist</label> <input type="text"
                                                                                 required name="spec_desc" class="form-control">
                           </div>
                        </div>

         

                        <div class="text-center">
                           <button type="submit" class="btn btn-dark mt-2 mb-3">Submit</button>
                        </div>

                     </form>
                  </div>
               </div>
            </div>



         </div>
      </div>
   </body>
</html>