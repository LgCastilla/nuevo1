<%-- 
    Document   : peticiones
    Created on : 4/10/2021, 07:02:33 PM
    Author     : lugca
--%>

<%--@page contentType="text/html" pageEncoding="UTF-8"%>
--%>
<!DOCTYPE html>

<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="logica.Cliente"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>


<%    // Iniciando respuesta JSON.
    Cliente c1 = new Cliente();
    String respuesta = "{";

    //Lista de procesos o tareas a realizar 
    List<String> tareas = Arrays.asList(new String[]{
        "actualizarCliente",
        "eliminarCliente",
        "listarCliente",
        "guardarCliente"
    });

    String proceso = "" + request.getParameter("proceso");
    
    // Validación de parámetros utilizados en todos los procesos.
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
    out.print(respuesta);  
        // ------------------------------------------------------------------------------------- //
        // -----------------------------------INICIO PROCESOS----------------------------------- //
        // ------------------------------------------------------------------------------------- //
        if (proceso.equals("guardarCliente")) {

            int ident = Integer.parseInt(request.getParameter("identificacion"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String genero = request.getParameter("genero");
            String tipoident = request.getParameter("tipoIdentificacion");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String correo = request.getParameter("correo");
            boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));
//
            Cliente c = new Cliente();
            c.setIdentificacion(ident);
            c.setNombre(nombre);
            c.setApellido(apellido);
            c.setGenero(genero);
            c.setTipoIdentificacion(tipoident);
            c.setTelefono(telefono);
            c.setDireccion(direccion);
            c.setCorreo(correo);
            if (c.guardarCliente()) {
//            if (true) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("eliminarCliente")) {
            Cliente c = new Cliente();
            int identificacion = Integer.parseInt(request.getParameter("identificacion"));
            if (c.borrarCliente(identificacion)) {
//            if (true) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("listarCliente")) {
            Cliente cl = new Cliente();
            try {
                List<Cliente> lista = cl.listarCliente();
                respuesta += "\"" + proceso + "\": true,\"Cliente\":" + new Gson().toJson(lista);
            } catch (SQLException ex) {
                respuesta += "\"" + proceso + "\": true,\"Cliente\":[]";
                Logger.getLogger(Cliente.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("actualizarCliente")) {
            int ident = Integer.parseInt(request.getParameter("identificacion"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String genero = request.getParameter("genero");
            String tipoident = request.getParameter("tipoIdentificacion");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String correo = request.getParameter("correo");
            boolean favorito = Boolean.parseBoolean(request.getParameter("favorito"));
//
            Cliente c = new Cliente();
            c.setIdentificacion(ident);
            c.setNombre(nombre);
            c.setApellido(apellido);
            c.setGenero(genero);
            c.setTipoIdentificacion(tipoident);
            c.setTelefono(telefono);
            c.setDireccion(direccion);
            c.setCorreo(correo);
            if (c.actualizarCliente()) {
//            if (true) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }

        // ------------------------------------------------------------------------------------- //
        // -----------------------------------FIN PROCESOS-------------------------------------- //
        // ------------------------------------------------------------------------------------- //
        // Proceso desconocido.
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    // Usuario sin sesión.
    // Responder como objeto JSON codificación ISO 8859-1.
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>
   