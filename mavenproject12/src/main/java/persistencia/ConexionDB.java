/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;
//import static java.lang.System.out;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author lugca
 */
public class ConexionDB {
  private String DB_driver = "";
    private String url = "";
    private String db = "";
    private String host = "";
    private String username = "";
    private String password = "";
    public Connection con = null;
    private Statement stmt = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private boolean local;

    //Constructor sin parmetros		
    public ConexionDB() {
//        local = false;
            DB_driver = "com.mysql.jdbc.Driver";
            host = "localhost:3306";
            db = "tienda_bd";
            url = "jdbc:mysql://" + host + "/" + db; 		//URL DB
            username = "root";                      			//usuario base de datos global 
            password = "";
        try {
            //Asignacin del Driver
            Class.forName(DB_driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            // Realizar la conexion
            con=(Connection) DriverManager.getConnection(url, username, password);
           // con = DriverManager.getConnection(url, username, password);
            //con.setTransactionIsolation(8);
        } catch (SQLException ex) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Realizar la conexin
    }

    //Retornar la conexin
    public Connection getConnection() {
        return con;
    }

    //Cerrar la conexin
    public void closeConnection(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // Mtodo que devuelve un ResultSet de una consulta (tratamiento de SELECT)
    public ResultSet consultarBD(String sentencia) {
        Connection cn =getConnection();
        try {
           
            stmt = cn.createStatement();//ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(sentencia);
            
        } catch (SQLException sqlex) {
        } catch (RuntimeException rex) {
        } catch (Exception ex) {
        }

        return rs;
    }

    // Mtodo que realiza un INSERT y devuelve TRUE si la operacin fue existosa
    public boolean insertarBD(String sentencia) {
        try {
            stmt = con.createStatement();
            stmt.execute(sentencia);
        } catch (SQLException | RuntimeException sqlex) {
            System.out.println("ERROR RUTINA: " + sqlex);
            return false;
        }
        return true;
    }

    public boolean borrarBD(String sentencia) {
        try {
            stmt = con.createStatement();
            stmt.execute(sentencia);
        } catch (SQLException | RuntimeException sqlex) {
            System.out.println("ERROR RUTINA: " + sqlex);
            return false;
        }
        return true;
    }

    // Mtodo que realiza una operacin como UPDATE, DELETE, CREATE TABLE, entre otras
    // y devuelve TRUE si la operacin fue existosa
    public boolean actualizarBD(String sentencia) {
        try {
            stmt = con.createStatement();
            stmt.executeUpdate(sentencia);
        } catch (SQLException | RuntimeException sqlex) {
            System.out.println("ERROR RUTINA: " + sqlex);
            return false;
        }
        return true;
    }

    /**
     *
     * @param parametro
     * @return
     */
    public boolean setAutoCommitBD(boolean parametro) {
        try {
            con.setAutoCommit(parametro);
        } catch (SQLException sqlex) {
            System.out.println("Error al configurar el autoCommit " + sqlex.getMessage());
            return false;
        }
        return true;
    }

    public void cerrarConexion() {
        closeConnection(con);
    }

    public boolean commitBD() {
        try {
            con.commit();
            return true;
        } catch (SQLException sqlex) {
            System.out.println("Error al hacer commit " + sqlex.getMessage());
            return false;
        }
    }

    public boolean rollbackBD() {
        try {
            con.rollback();
            return true;
        } catch (SQLException sqlex) {
            System.out.println("Error al hacer rollback " + sqlex.getMessage());
            return false;
        }
    }   
}
