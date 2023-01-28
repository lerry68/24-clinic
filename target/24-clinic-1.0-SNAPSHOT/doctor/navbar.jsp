<%-- 
    Document   : navbar
    Created on : 29-Jan-2023, 02:02:41
    Author     : FarrelAkiela
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
   <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"></i> <strong>24-Clinic</strong></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
              data-bs-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false"
              aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item"><a class="nav-link active fw-bold" href="index.jsp">HOME</a></li>
            <li class="nav-item"><a class="nav-link active fw-bold" href="patient.jsp">PATIENT</a></li>
         </ul>

         <form class="d-flex">
            <div class="dropdown">
               <button class="btn btn-light dropdown-toggle" type="button"
                       id="dropdownMenuButton1" data-bs-toggle="dropdown"
                       aria-expanded="false">
                  <i class="fas fa-user-doctor"></i> ${doctObj.fullName }
               </button>
               <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                  <li><a class="dropdown-item" href="edit_profile.jsp">Edit
                        Profile</a></li>
                  <li><a class="dropdown-item" href="../doctorLogout">Logout</a></li>
               </ul>
            </div>
         </form>
      </div>
   </div>
</nav>