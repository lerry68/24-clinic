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
public class Specialist {

   private int id;
   private String specialistName;

   public Specialist() {
      super();
      // TODO Auto-generated constructor stub
   }

   public Specialist(int id, String specialistName) {
      super();
      this.id = id;
      this.specialistName = specialistName;
   }

   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getSpecialistName() {
      return specialistName;
   }

   public void setSpecialistName(String specialistName) {
      this.specialistName = specialistName;
   }
}
