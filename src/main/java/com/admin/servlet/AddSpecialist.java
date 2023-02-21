
package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/addSpecialist")

public class AddSpecialist
        extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String specName = req.getParameter("spec_name");
      String specDesc = req.getParameter("spec_desc");


      SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
      boolean f = dao.addSpecialist(specName, specDesc);

      HttpSession session = req.getSession();

      if (f) {
          System.out.println(f);
          
         session.setAttribute("succMsg", "Specialist added successfully..");
         resp.sendRedirect("admin/specialist.jsp");
      }
      else {
          System.out.println(f);
          
         session.setAttribute("errorMsg", "Something wrong on server!");
         resp.sendRedirect("admin/specialist.jsp");
      }

   }
}
