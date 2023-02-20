<%-- 
    Document   : navbar
    Created on : Jan 25, 2023, 1:39:33 PM
    Author     : gares
--%>

<a href="../component/navbar.jsp"></a>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
            <li class="nav-item"><a class="nav-link active fw-bold" href="doctor.jsp">DOCTORS</a></li>
            <li class="nav-item"><a class="nav-link active fw-bold" href="specialist.jsp">SPECIALISTS</a></li>
            <li class="nav-item"><a class="nav-link active fw-bold" href="patient.jsp">PATIENTS</a></li>
         </ul>

         <form class="d-flex">
            <div class="dropdown">
               <button class="btn btn-light dropdown-toggle" type="button"
                       id="dropdownMenuButton1" data-bs-toggle="dropdown"
                       aria-expanded="false"><i class="fa-solid fa-user-gear"></i> Admin</button>
               <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                  <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
               </ul>
            </div>
         </form>
      </div>
   </div>
</nav>