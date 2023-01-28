
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/doctorLogout")

/**
 *
 * @author FarrelAkiela
 */
public class DoctorLogout
        extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      HttpSession session = req.getSession();
      session.removeAttribute("doctObj");
      session.setAttribute("succMsg", "Doctor logged out successfully..");
      resp.sendRedirect("doctor_login.jsp");

   }

}
