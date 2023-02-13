<%-- 
    Document   : view_appointment
    Created on : Feb 1, 2023, 12:57:16 PM
    Author     : ADMIN
--%>

<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <%@include file="component/allcss.jsp"%>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }

            .backImg {
                background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
                    url("images/user_app_banner.jpg");
                height: 25vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body>
        <c:if test="${empty userObj }">
            <c:redirect url="user_login.jsp"></c:redirect>
        </c:if>
        <%@include file="component/navbar.jsp"%>

        <div class="container-fulid backImg p-5">
            <p class="text-center fs-2 text-white"></p>
        </div>
        <div class="container p-3 mt-4">
            <div class="row">

                <div class="col-md-3 pe-3">
                    <img alt="" src="images/josins2.png" style="width: 300px;">
                </div>

                <div class="col-md-9">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-4 fw-bold text-center text-primary mb-4">Appointment
                                List</p>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Age</th>
                                        <th scope="col">Appoint Date</th>
                                        <th scope="col">Diseases</th>
                                        <th scope="col">Doctor Name</th>
                                        <th scope="col">Status</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        User user = (User) session.getAttribute("userObj");
                                        AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
                                        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                        List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
                                        for (Appointment ap : list) {
                                            Doctor d = dao2.getDoctorById(ap.getDoctorId());
                                    %>

                                    <tr>
                                        <th><%=ap.getFullName()%></th>
                                        <td><%=ap.getGender()%></td>
                                        <td><%=ap.getAge()%></td>
                                        <td><%=ap.getAppoinDate()%></td>
                                        <td><%=ap.getDiseases()%></td>
                                        <td><%=d.getFullName()%></td>
                                        <td>
                                            <%
                                                if ("Pending".equals(ap.getStatus())) {
                                            %> <a href="#" class="btn btn-sm btn-primary disabled">Pending</a> <%
                                            } else {
                                            %> <a href="#" class="btn btn-sm btn-success" data-bs-toggle="modal"
                                               data-bs-target="#exampleModal">Show</a> 
                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal" tabindex="-1"
                                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Doctor's comment</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                    aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="../addSpecialist" method="post">

                                                                <div class="form-group">
                                                                    <label>Doctor's comment</label> <input type="text"
                                                                                                                class="form-control" value="<%=ap.getStatus()%>" disabled>
                                                                </div>
                                                            </form>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-bs-dismiss="modal">Close</button>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div><%
                                                }
                                            %>

                                        </td>
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



    </body>
</html>