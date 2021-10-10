/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import persistencia.ConexionDB;

/**
 *
 * @author lugca
 */
public class UsuarioDAO {
    
        public Usuario Validar(String user,String passw){
        Usuario usuario1=new Usuario();
        String consulta = "SELECT * FROM usuario WHERE usuarios = '"+user+"' AND contraseña = '"+passw+"'"; 
        System.out.println(consulta);
        ConexionDB con = new ConexionDB();
       try{
           
       
        ResultSet rs;
        rs = con.consultarBD(consulta);
       
        while (rs.next()) {
             
            usuario1.setId_usuario(rs.getInt("id_usuario"));
            
            usuario1.setNombre_usu(rs.getString("nombre_usu"));
            
            usuario1.setApellido_usu(rs.getString("apellido_usu"));
            usuario1.setUsuario(rs.getString("usuario"));
            usuario1.setContraseña(rs.getString("contraseña"));
            usuario1.setTipo_usuario(rs.getString("tipo_usuario")); 

        }
        
        con.cerrarConexion();
        
    } catch (SQLException sqlex) {
        } catch (RuntimeException rex) {
        } catch (Exception ex) {
        }
     //  System.out.println(usuario1.getNombre_usu());
     return usuario1;
    }
}
