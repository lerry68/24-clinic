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

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "UpdateUser", urlPatterns = {"/updateUser"})
public class UpdateUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            String fullname = req.getParameter("fullname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
//            String status = req.getParameter("status");

            int id = Integer.parseInt(req.getParameter("id"));

//            User u = new User(id, fullname, email, password);

            UserDao dao = new UserDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.updateUser(id, fullname, email, password)) {
                session.setAttribute("succMsg", "User Updated Sucessfully..");
                resp.sendRedirect("admin/user.jsp");
            } else {
                session.setAttribute("errorMsg", "Something wrong on server!");
                resp.sendRedirect("admin/user.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
