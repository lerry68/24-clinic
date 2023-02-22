package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import java.util.ArrayList;
import java.util.List;

import com.dao.AppointmentDAO;
import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.Appointment;
import com.entity.User;

@WebServlet("/appointmentDetail")
public class Detail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String idDetail = req.getParameter("idDetail");
        String idDokt = req.getParameter("idDokter");
        String fullName = req.getParameter("fullName");
        String userId = req.getParameter("userId");

        int idDokter = Integer.parseInt(idDokt);
        int userId2 = Integer.parseInt(userId);

        HttpSession session = req.getSession();
        AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
        Appointment appointment = dao.getDetailAppointment(idDetail);
        Doctor d = dao2.getDoctorById(idDokter);

        int ap2 = dao.getPatientTotalAppoint(fullName, userId2);

        session.setAttribute("ap2", ap2);
        session.setAttribute("appo", appointment);
        session.setAttribute("d", d);
//                        req.getRequestDispatcher("view_appointment_detail.jsp").forward(req, resp);
        resp.sendRedirect("view_appointment_detail.jsp");

    }

}
