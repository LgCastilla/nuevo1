package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author lugca
 */
public class Operaciones extends ConexionDb {


    private Statement stmtOp = null;
    private ResultSet rsOp = null;

    public ResultSet consultarDb(String sentencia) {
        Connection conn =getConexion();

        try {
            
            
            stmtOp = conn.createStatement();
            rsOp = stmtOp.executeQuery(sentencia);
            

        } catch (SQLException sqlEx) {
            System.out.println(sqlEx.getMessage());
        } catch (RuntimeException rEx) {
            System.out.println(rEx.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        
        return rsOp;

    }

    public boolean crearProducto(String sentencia) {
        Connection conn =getConexion();

        try {

  
            stmtOp = conn.createStatement();
            this.stmtOp.execute(sentencia);

        } catch (SQLException sqlEx) {
            System.out.println(sqlEx.getMessage());
            return false;
        } catch (RuntimeException rEx) {
            System.out.println(rEx.getMessage());
            return false;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }finally{
            try{
                conn.close();
            }catch (SQLException sqlEx) {
                System.out.println(sqlEx.getMessage());
            }
        }
        
        return true;

    }
        public boolean eliminar(String sentencia) {
        Connection conn =getConexion();
        try {

            stmtOp = conn.createStatement();
            this.stmtOp.execute(sentencia);

        } catch (SQLException sqlEx) {
            System.out.println(sqlEx.getMessage());
            return false;
        } catch (RuntimeException rEx) {
            System.out.println(rEx.getMessage());
            return false;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }finally{
            try{
                conn.close();
            }catch (SQLException sqlEx) {
                System.out.println(sqlEx.getMessage());
            }
        }
        
        return true;

    }
        public boolean updateProducto(String sentencia) {
        
        Connection conn =getConexion();
        try {

            
            stmtOp = conn.createStatement();
            this.stmtOp.executeUpdate(sentencia);

        } catch (SQLException sqlEx) {
            System.out.println(sqlEx.getMessage());
            return false;
        } catch (RuntimeException rEx) {
            System.out.println(rEx.getMessage());
            return false;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }finally{
            try{
                conn.close();
            }catch (SQLException sqlEx) {
                System.out.println(sqlEx.getMessage());
            }
        }
        
        return true;

    }

}
