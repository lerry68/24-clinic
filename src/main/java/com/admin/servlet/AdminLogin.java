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

import com.entity.User;
/**
 *
 * @author gares
 */
@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			HttpSession session = req.getSession();

			if ("admin@mail.com".equals(email) && "admin123".equals(password)) {
				session.setAttribute("adminObj", new User());
				resp.sendRedirect("admin/index.jsp");
			} else {
				session.setAttribute("errorMsg", "Wrong Email or Password!");
				resp.sendRedirect("admin_login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
