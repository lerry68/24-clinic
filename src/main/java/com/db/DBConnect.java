/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author FarrelAkiela
 */
public class DBConnect {

   private static Connection conn;

   public static Connection getConn() {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/24_clinic", "root", "");

      }
      catch (Exception e) {
         e.printStackTrace();
      }

      return conn;
   }

}
