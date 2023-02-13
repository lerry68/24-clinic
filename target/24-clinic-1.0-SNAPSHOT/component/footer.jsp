<%-- 
    Document   : footer
    Created on : 16-Jan-2023, 13:09:49
    Author     : Gilang Algifari
--%>

<c:if test="${empty userObj }">
      <div class="container-fluid p-1 bg-danger text-center text-white">
   <p class="mt-3">Copyright 24-Clinic</p>
</div>
      </c:if>
      
      <c:if test="${not empty userObj }">
      <div class="container-fluid p-1 bg-primary text-center text-white">
      <p class="mt-3">Copyright 24-Clinic</p>
</div>
      </c:if>
      
<!--<div class="container-fluid p-1 bg-danger text-center text-white">
   <p>Copyright 24-Clinic</p>
</div>-->
