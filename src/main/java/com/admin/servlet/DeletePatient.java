/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

import com.dao.AppointmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DBConnect;

/**
 *
 * @author Farrel Akiela
 */
@WebServlet(name = "DeletePatient", urlPatterns = {"/deletePatient"})
public class DeletePatient
        extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      int id = Integer.parseInt(req.getParameter("id"));

      AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
      HttpSession session = req.getSession();

      if (dao.deletePatient(id)) {
         session.setAttribute("succMsg", "Patient Deleted Sucessfully..");
         resp.sendRedirect("admin/patient.jsp");
      }
      else {
         session.setAttribute("errorMsg", "Something wrong on server");
         resp.sendRedirect("admin/patient.jsp");
      }

   }
}
