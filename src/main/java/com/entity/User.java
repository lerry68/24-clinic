/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

/**
 *
 * @author FarrelAkiela
 */
public class User {
        private int id;
	private String fullName;
	private String email;
	private String password;
        private String status;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String fullName, String email, String password, String status) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.password = password;
                this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
        
        public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
