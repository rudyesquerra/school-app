<%-- 
    Document   : Alumnos
    Created on : 4 feb. 2021, 11:53:18
    Author     : carlos
--%>

<%@page import="ar.com.eduit.curso.java.utils.html.HtmlTable"%>
<%@page import="ar.com.eduit.curso.java.entities.Alumno"%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.connectors.Connector"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_CursoRepository cr=new CursoRepository(Connector.getConnection()); %>
<% I_AlumnoRepository ar=new AlumnoRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alumnos</title>
    </head>
    <body>
        <h1>Mantenimiento de Alumnos</h1>
        <form>
            <table>
                <tr><td>Nombre:     </td><td><input type="text"     name="nombre"   /></td></tr>
                <tr><td>Apellido:   </td><td><input type="text"     name="apellido" /></td></tr>
                <tr><td>Edad:       </td><td><input type="number"   name="edad" min="18" max="130" /></td></tr>
                <tr><td>Curso:      </td>
                    <td>
                        <select name="idCurso">
                            <%
                                for(Curso c: cr.getAll())
                                    out.print("<option value="+c.getId()+">"+
                                    c.getId()+", "+c.getTitulo()+", "+c.getProfesor()+", "+c.getDia()+", "+c.getTurno()
                                    +"</option>");
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Guardar"/></td>
                    <td><input type="reset" value="Borrar"/></td>
                </tr>
            </table>
        </form>
         
                        
        <script>
            alert("Formulario de alumnos!!!!");
            <% out.println("<script>alert('Hola')</script>"); %>
        </script>
                        
        <% 
            try {
            
                /*
                for(int a=0;a<=10;a++){
                    out.println("<script>alert('Hola')</script>");
                }
                */
            
                String nombre=request.getParameter("nombre");
                String apellido=request.getParameter("apellido");
                int edad=Integer.parseInt(request.getParameter("edad"));
                int idCurso=Integer.parseInt(request.getParameter("idCurso"));
                
                if(nombre == null || nombre.isEmpty() || apellido== null || apellido.isEmpty() ||
                    nombre.contains("<") || apellido.contains("<")
                ){
                    out.println("<h3>Falta Ingresar Parametros</h3>");
                }else{
                    Alumno alumno=new Alumno(nombre, apellido, edad, idCurso);
                    ar.save(alumno);
                    if(alumno.getId()!=0){
                        out.println("<h3>Se guardo el alumno id: "+alumno.getId()+"</h3>");
                    }else{
                        out.println("<h3>No se pudo guardar el alumno!</h3>");
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
                out.println(new HtmlTable().getTable(ar.getAll()));
            else
                out.println(new HtmlTable().getTable(ar.getLikeApellido(buscarApellido)));
        %>
    </body>
</html>
