/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/updatePatient")

/**
 *
 * @author FarrelAkiela
 */
public class UpdatePatient
        extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      try {

         int id = Integer.parseInt(req.getParameter("id"));
         String fullname = req.getParameter("fullname");
         String gender = req.getParameter("gender");
         String age = req.getParameter("age");
         String appoint_date = req.getParameter("appoint_date");
         String email = req.getParameter("email");
         String phno = req.getParameter("phno");
         String diseases = req.getParameter("diseases");
         int doctor_id = Integer.parseInt(req.getParameter("doct"));
         String address = req.getParameter("address");
         String status = req.getParameter("status");
         String comment = req.getParameter("comment");

         AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
         boolean f = dao.updatePatient(fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, status, comment, id);

         HttpSession session = req.getSession();
         if (f) {
            session.setAttribute("succMsg", "Patient Updated Sucessfully..");
            resp.sendRedirect("admin/patient.jsp");
         }
         else {
            session.setAttribute("errorMsg", "Something wrong on server!");
            resp.sendRedirect("admin/patient.jsp");
         }

      }
      catch (Exception e) {
         e.printStackTrace();
      }

   }
}
