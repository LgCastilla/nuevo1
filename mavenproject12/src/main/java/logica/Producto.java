/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionDB;

/**
 *
 * @author lugca
 */
public class Producto {

    private String codigo;
    private String nombre;
    private String descripcion;

    private double valorUnitario;
    private int existencias;
    private String categoria;

    public Producto(){
    
}
    public String getDescripcion() {
        return descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getExistencias() {
        return existencias;
    }

    public void setExistencias(int existencias) {
        this.existencias = existencias;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(double valorUnitario) {
        this.valorUnitario = valorUnitario;
    }
 public Producto getProducto(String codigo) throws SQLException {
        this.codigo = codigo;
        return this.getProducto();
    }
    public boolean guardarProducto() {
        ConexionDB conexion = new ConexionDB();
        String sentenciaSql = "INSERT into producto(codigo, nombre, descripcion, valorUnitario, existencias, categoria)" + "VALUES ( '" + this.codigo + "','" + this.nombre + "','"
                + this.descripcion + "','" + this.valorUnitario + "','" + this.existencias + "','" + this.categoria + "');";
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

    public boolean actualizarContacto() {
        ConexionDB conexion = new ConexionDB();
        String sentenciaSql = "UPDATE  producto SET nombre='" + this.nombre + "',descripcion='" + this.descripcion + "',valorUnitario='" + this.valorUnitario + "',existencias='" + this.existencias + "',categoria='" + this.categoria + " WHERE codigo=" + this.codigo;

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

    public boolean borrarContacto(int identificacion) {
        String Sentencia = "DELETE FROM 'producto' WHERE 'codigo'='" + this.codigo + "'";
        ConexionDB conexion = new ConexionDB();
        if (conexion.setAutoCommitBD(false)) {

            if (conexion.borrarBD(Sentencia)) {
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

    public List<Producto> listarProductos() throws SQLException {
        ConexionDB conexion = new ConexionDB();
        List<Producto> listaProductos = new ArrayList<>();
        String sql = "Select * from producto order by codigo asc";
        ResultSet rs = conexion.consultarBD(sql);
        Producto p;
        while (rs.next()) {
            p = new Producto();
            p.setCodigo(rs.getString("codigo"));
            p.setNombre(rs.getString("nombre"));
            p.setDescripcion(rs.getString("descripcion"));
            p.setValorUnitario(rs.getDouble("valorUnitario"));
            p.setExistencias(rs.getInt("existencias"));
            p.setCategoria(rs.getString("categoria"));
            listaProductos.add(p);
        }
        conexion.cerrarConexion();
        return listaProductos;
    }

    public Producto getProducto() throws SQLException {
        ConexionDB conexion = new ConexionDB();
        String sql = "select * from producto where codigo='" + this.codigo + "'";
        ResultSet rs = conexion.consultarBD(sql);
        if (rs.next()) {
            this.codigo = rs.getString("codigo");
            this.nombre = rs.getString("nombre");
            this.descripcion = rs.getString("descripcion");
            this.valorUnitario = rs.getDouble("valorUnitario");
            this.existencias = rs.getInt("existencias");
            this.categoria = rs.getString("categoria");
            conexion.cerrarConexion();
            return this;

        } else {
            conexion.cerrarConexion();
            return null;
        }

    }

    @Override
    public String toString() {
        return "Producto{" + "codigo=" + codigo + ", nombre=" + nombre + ", descripcion=" + descripcion 
                + ", valorUnitario=" + valorUnitario + ", existencias=" + existencias + ", categoria=" + categoria + '}';
    }

}
