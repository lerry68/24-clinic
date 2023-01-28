<%-- 
    Document   : index
    Created on : 16-Jan-2023, 11:00:36
    Author     : garest
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Home | 24-Clinic</title>

      <%@include file="../component/allcss.jsp"%>

      <style type="text/css">
         .carousel-item:after {
            content: "";
            display: block;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0,0,0,0.1);
         }
         
         .carousel-caption {
            top: 70%;
         }
         
         .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
         }
      </style>

   </head>
   <body>
      <%@include file="navuser.jsp"%>

      <div id="carouselExampleIndicators" class="carousel slide">
         <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
         </div>
         <div class="carousel-inner">
            <div class="carousel-item active">
               <img src="../images/home1.jpg" class="d-block w-100" alt="..." height="615px">
            </div>
            <div class="carousel-item">
               <img src="../images/home1.jpg" class="d-block w-100" alt="..." height="615px">
            </div>
            <div class="carousel-item">
               <img src="../images/home1.jpg" class="d-block w-100" alt="..." height="615px">
            </div>
         </div>
         <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
         </button>
         <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
         </button>
      </div>

      <hr>

      <div class="container p-3">
         <p class="text-center fs-2 ">Key Features of our Hospital</p>

         <div class="row">
            <div class="col-md-8 p-5">
               <div class="row">
                  <div class="col-md-6">
                     <div class="card paint-card">
                        <div class="card-body">
                           <p class="fs-5">100% Safety</p>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                              Voluptatem, inventore</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="card paint-card">
                        <div class="card-body">
                           <p class="fs-5">Clean Environment</p>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                              Voluptatem, inventore</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-6 mt-2">
                     <div class="card paint-card">
                        <div class="card-body">
                           <p class="fs-5">Friendly Doctors</p>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                              Voluptatem, inventore</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-6 mt-2">
                     <div class="card paint-card">
                        <div class="card-body">
                           <p class="fs-5">Medical Research</p>
                           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                              Voluptatem, inventore</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <div class="col-md-4">
               <img alt="" src="../images/doctor.jpg" height="400px">
            </div>

         </div>
      </div>

<%@include file="../component/footer.jsp"%>


   </body>
</html>
