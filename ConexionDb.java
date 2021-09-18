
package model;


import java.sql.*;


/**
 *
 * @author lugca
 */
public class ConexionDb {
 private String url="";
 private Connection con=null;

 public ConexionDb(){
     conectar();
 }
 
 public void conectar(){
     url="jdbc:sqlite:carlostruji85_reto5db.db";try{
      con= DriverManager.getConnection(url); 
      if (con!=null){
          DatabaseMetaData meta=con.getMetaData();
          System.out.println("Base de datos conectada"+meta.getDriverName());
      }
     }catch(SQLException ex){System.out.println(ex.getMessage());
         
     }
 }
  
 public Connection getConexion(){
    conectar();
     return con;
     
 }
 
 
    
}
