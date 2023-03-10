package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		UserDao dao = new UserDao(DBConnect.getConn());
		User user = dao.login(email, password);

		String status = user.getStatus();
                System.out.println(status);
                
		if (user != null) {
                        if (status.equals("Active")) {
                            session.setAttribute("userObj", user);
                            resp.sendRedirect("index.jsp");
                        } else {
                            System.out.println(status);
                            session.setAttribute("errorMsg", "Your account is inactive, please contact admin");
                            resp.sendRedirect("user_login.jsp");
                        }
			
		} else {
			session.setAttribute("errorMsg", "Wrong Email or Password!");
			resp.sendRedirect("user_login.jsp");
		}

	}

}