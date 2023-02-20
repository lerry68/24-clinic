/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

/**
 *
 * @author FarrelAkiela
 */
public class SpecialistDao {
   private Connection conn;

	public SpecialistDao(Connection conn) {
		super();
		this.conn = conn;
	}
        
        public boolean deleteSpecialist(int id) {
            boolean f = false;
		try {
			String sql = "delete from specialist where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
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

	public boolean addSpecialist(String spec_name, String spec_desc) {
		boolean f = false;
		try {
			String sql = "insert into specialist(spec_name, spec_desc) values(?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, spec_name);
                        ps.setString(2, spec_desc);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
        
        public boolean updateSpecialist(Specialist d) {
		boolean f = false;

		try {
			String sql = "update specialist set spec_name=?, spec_desc=?  where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getSpecialistName());
                        ps.setString(2, d.getSpecialistDesc());
			ps.setInt(3, d.getId());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

        public Specialist getSpecialistById(int id) {

		Specialist d = null;
		try {

			String sql = "select * from specialist where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				d = new Specialist();
				d.setId(rs.getInt(1));
				d.setSpecialistName(rs.getString(2));
                                d.setSpecialistDesc(rs.getString(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}

	public List<Specialist> getAllSpecialist() {
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist s = null;

		try {
			String sql = "select * from specialist";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				s = new Specialist();
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
                                s.setSpecialistDesc(rs.getString(3));
				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
}
