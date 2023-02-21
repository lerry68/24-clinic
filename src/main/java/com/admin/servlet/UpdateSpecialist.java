/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.admin.servlet;

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
import com.entity.Specialist;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "UpdateSpecialist", urlPatterns = {"/updateSpecialist"})
public class UpdateSpecialist extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      try {

         String spec_name = req.getParameter("spec_name");
         String spec_decs = req.getParameter("spec_desc");

         int id = Integer.parseInt(req.getParameter("id"));

         Specialist d = new Specialist(id, spec_name, spec_decs);

         SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
         HttpSession session = req.getSession();

         if (dao.updateSpecialist(d)) {
            session.setAttribute("succMsg", "Specialist Updated Sucessfully..");
            resp.sendRedirect("admin/specialist.jsp");
         }
         else {
            session.setAttribute("errorMsg", "Something wrong on server!");
            resp.sendRedirect("admin/specialist.jsp");
         }

      }
      catch (Exception e) {
         e.printStackTrace();
      }

   }
}
