<%-- 
    Document   : Profesores
    Created on : Feb 25, 2021, 9:13:13 AM
    Author     : rodol
--%>

<%@page import="ar.com.eduit.curso.java.utils.html.HtmlTable"%>
<%@page import="ar.com.eduit.curso.java.entities.Profesor"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.ProfesorRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_ProfesorRepository"%>
<%@page import="ar.com.eduit.curso.java.connectors.Connector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_ProfesorRepository pr=new ProfesorRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profesores</title>
    </head>
    <body>
        <h1>Mantenimiento de Profesores</h1>
        <form>
            <table>
                <tr><td>Nombre:     </td><td><input type="text"     name="nombre"   /></td></tr>
                <tr><td>Apellido:   </td><td><input type="text"     name="apellido" /></td></tr>
                <tr>
                    <td><input type="submit" value="Guardar"/></td>
                    <td><input type="reset" value="Borrar"/></td>
                </tr>
            </table>
        </form>
                        
        <% 
            try {
            
                /*
                for(int a=0;a<=10;a++){
                    out.println("<script>alert('Hola')</script>");
                }
                */
            
                String nombre=request.getParameter("nombre");
                String apellido=request.getParameter("apellido");
                
                if(nombre == null || nombre.isEmpty() || apellido== null || apellido.isEmpty() ||
                    nombre.contains("<") || apellido.contains("<")
                ){
                    out.println("<h3>Falta Ingresar Parametros</h3>");
                }else{
                    Profesor profesor=new Profesor(nombre, apellido);
                    pr.save(profesor);
                    if(profesor.getId()!=0){
                        out.println("<h3>Se guardo el profesor id: "+profesor.getId()+"</h3>");
                    }else{
                        out.println("<h3>No se pudo guardar el profesor!</h3>");
                    }
                }
            } catch (NullPointerException | NumberFormatException e) { out.println("<h3>Falta Ingresar Parametros</h3>");
            } catch (Exception e) {
                out.println("<h3>Ocurrio un error!!</h3>");
                System.out.println("*****************************************");
                System.out.println(e);
                System.out.println("*****************************************");
            }
        %>
        
        <form>
            Buscar Apellido: <input type="text" name="buscarApellido" />
        </form>
        
        <%
            String buscarApellido=request.getParameter("buscarApellido");
            if(buscarApellido==null || buscarApellido.isEmpty())
                out.println(new HtmlTable().getTable(pr.getAll()));
            else
                out.println(new HtmlTable().getTable(pr.getLikeApellido(buscarApellido)));
        %>
    </body>
</html>
