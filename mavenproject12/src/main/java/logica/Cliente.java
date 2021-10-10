/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import persistencia.ConexionDB;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author lugca
 */
public class Cliente {

    private int identificacion;
    private String nombre;
    private String apellido;
    private String genero;
    private String tipoIdentificacion;
    private String telefono;
    private String direccion;
    private String correo;

    public void setIdentificacion(int identificacion) {
        this.identificacion = identificacion;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public void setTipoIdentificacion(String tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getIdentificacion() {
        return identificacion;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getGenero() {
        return genero;
    }

    public String getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getCorreo() {
        return correo;
    }
    public Cliente() {
    }
    public Cliente getCliente(int identificacion) throws SQLException {
        this.identificacion = identificacion;
        return this.getCliente();
    }
 

    public boolean guardarCliente() {
        ConexionDB conexion = new ConexionDB();
       
        String sentenciaSql = "  INSERT INTO cliente(identificacion,nombre, apellido, genero, tipo_identificacion, telefono, direccion, correo)" + "VALUES ( '" + this.identificacion + "','" + this.nombre + "','"
                + this.apellido + "','" + this.genero + "','" + this.tipoIdentificacion + "','" + this.telefono + "','" + this.direccion + "','" + this.correo + "');";
     System.out.println(sentenciaSql);
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sentenciaSql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }

        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean actualizarCliente() {
        ConexionDB conexion = new ConexionDB();
  
        String sentenciaSql = "UPDATE  cliente SET nombre='" + this.nombre + "',apellido='" + this.apellido + "',genero='" + this.genero + "',tipo_identificacion='" + this.tipoIdentificacion + "',telefono='" + this.telefono + "',direccion='" + this.direccion + "',correo='" + this.correo + "' WHERE identificacion= '" + this.identificacion+"'";
System.out.println(sentenciaSql);
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sentenciaSql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }

        } else {
            conexion.cerrarConexion();
            return false;
        }
    }
    public boolean borrarCliente(int identificacion) {
        String sentencia = "DELETE FROM cliente WHERE identificacion=" + identificacion + "";
        ConexionDB conexion = new ConexionDB();
       System.out.println(sentencia);
        if (conexion.setAutoCommitBD(false)) {
            
            if (conexion.borrarBD(sentencia)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }
 public List<Cliente> listarCliente() throws SQLException {
        ConexionDB conexion = new ConexionDB();
        List<Cliente> listaCliente = new ArrayList<>();
        String sql = "SELECT * FROM cliente ORDER BY identificacion ASC";
        System.out.println(sql);
        ResultSet rs = conexion.consultarBD(sql);
        
        Cliente c;
        while (rs.next()) {
             System.out.println(rs.getString("nombre"));
            c = new Cliente();
            c.setIdentificacion(rs.getInt("identificacion"));
            c.setNombre(rs.getString("nombre"));
            c.setApellido(rs.getString("apellido"));
            c.setGenero(rs.getString("genero"));
            c.setTipoIdentificacion(rs.getString("tipo_identificacion"));
            c.setTelefono(rs.getString("telefono"));
            c.setDireccion(rs.getString("direccion"));
            c.setCorreo(rs.getString("correo"));
            listaCliente.add(c);
        }
        
        //conexion.cerrarConexion();
        return listaCliente;
    }

    public Cliente getCliente() throws SQLException {
        ConexionDB conexion = new ConexionDB();
        String sql = "SELECT * FROM cliente WHERE identificacion=" + this.identificacion + "";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.identificacion = rs.getInt("identificacion");
            this.nombre = rs.getString("nombre");
            this.apellido = rs.getString("apellido");
            this.genero = rs.getString("genero");
            this.tipoIdentificacion = rs.getString("tipoIdentificacion");
            this.telefono = rs.getString("telefono");
            this.direccion = rs.getString("direccion");
            this.correo = rs.getString("correo");
            conexion.cerrarConexion();
            return this;

        } else {
            conexion.cerrarConexion();
            return null;
        }

    }

    @Override
    public String toString() {
        return "Cliente{" + "identificacion=" + identificacion + ", nombre=" + nombre + ", apellido=" + apellido + 
                ", genero=" + genero + ", tipoIdentificacion=" + tipoIdentificacion + ", telefono=" + telefono + 
                ", direccion=" + direccion + ", correo=" + correo + '}';
    }
    
}


