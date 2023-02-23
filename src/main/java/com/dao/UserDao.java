package com.dao;

import com.entity.Specialist;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private Connection conn;

    public UserDao(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean register(User u) {
        boolean f = false;

        try {
            String sql = "insert into user_dtls(full_name,email,password,status) values(?,?,?,'Active') ";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getFullName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public User login(String em, String psw) {
        User u = null;

        try {
            String sql = "select * from user_dtls where email=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, em);
            ps.setString(2, psw);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setFullName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setStatus(rs.getString(5));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }

    public boolean checkOldPassword(int userid, String oldPassword) {
        boolean f = false;

        try {
            String sql = "select * from user_dtls where id=? and password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setString(2, oldPassword);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean changePassword(int userid, String newPassword) {
        boolean f = false;

        try {
            String sql = "update user_dtls set password=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, userid);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
   
        public boolean updateStatusUser(int id, String status) {
        boolean f = false;

        try {
            String sql = "update user_dtls set status='notActive' where id=?";

            if (status.equals("notActive")) {
               sql = "update user_dtls set status='Active' where id=?";
            }
            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setString(1, status);
            ps.setInt(1, id);
            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean updateUser(int id, String fullname, String email, String password) {
        boolean f = false;

        try {
            String sql = "update user_dtls set full_name=?, email=?, password=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, password) ;
            ps.setInt(4, id);
            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public User getUserById(int id) {

        User u = null;
        try {

            String sql = "select * from user_dtls where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setFullName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setStatus(rs.getString(5));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public List<User> getAllUser() {
        List<User> list = new ArrayList<User>();
        User u = null;

        try {
            String sql = "select * from user_dtls";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setFullName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setStatus(rs.getString(5));

                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
