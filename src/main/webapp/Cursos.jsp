<%-- 
    Document   : Cursos
    Created on : 2 feb. 2021, 12:46:23
    Author     : carlos
--%>

<%@page import="ar.com.eduit.curso.java.repositories.jdbc.ProfesorRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_ProfesorRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_ProfesorRepository"%>
<%@page import="ar.com.eduit.curso.java.entities.Profesor"%>
<%@page import="ar.com.eduit.curso.java.utils.html.HtmlTable"%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.connectors.Connector"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.enums.Turno"%>
<%@page import="ar.com.eduit.curso.java.enums.Dia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_CursoRepository cr=new CursoRepository(Connector.getConnection()); %>
<% I_ProfesorRepository pr=new ProfesorRepository(Connector.getConnection()); %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cursos</title>
    </head>
    <body>
        <h1>Mantenimiento de Cursos!!</h1>
        
        <form>
            <table>
                <tr><td>Titulo:     </td><td><input type="text" name="titulo"/>     </td></tr>
                <!-- <tr><td>Profesor:   </td><td><input type="text" name="profesor"/>   </td></tr> -->
                <tr><td>Profesor:      </td>
                    <td>
                        <select name="profesor">
                            <%
                                for(Profesor p: pr.getAll())
                                    out.print("<option value="+p.getApellido()+">"+
                                    p.getId()+", "+p.getNombre()+", "+p.getApellido()+"</option>");
                            %>
                        </select>
                    </td>
                </tr>
                <tr><td>Día:        </td>
                    <td>
                        <select name="dia">
                            <!-- 
                            <option value="LUNES">lunes</option>
                            <option value="MARTES">martes</option>
                            <option value="MIÉRCOLES">miércoles</option>
                            <option value="JUEVES">jueves</option>
                            <option value="VIERNES">viernes</option>
                            -->
                            
                            <%
                                for(Dia d: Dia.values())
                                    out.print("<option value="+d+">"+d.toString().toLowerCase()+"</option>");
                            %>
                            
                        </select>
                    </td>
                </tr>
                <tr><td>Turno:      </td>
                    <td>
                        <select name="turno">
                            <%
                                for(Turno t: Turno.values())
                                    out.print("<option value="+t+">"+t.toString().toLowerCase()+"</option>");
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
        
        <% 
            try {
                String titulo=request.getParameter("titulo");
                String profesor=request.getParameter("profesor");
                Dia dia=Dia.valueOf(request.getParameter("dia"));
                Turno turno=Turno.valueOf(request.getParameter("turno"));
                
                if(titulo == null || titulo.isEmpty() || profesor== null || profesor.isEmpty()){
                    out.println("<h3>Falta Ingresar Parametros</h3>");
                }else{
                    Curso curso=new Curso(titulo,profesor,dia,turno);
                    cr.save(curso);
                    if(curso.getId()!=0){
                        out.println("<h3>Se guardo el curso id: "+curso.getId()+"</h3>");
                    }else{
                        out.println("<h3>No se pudo guardar el curso!</h3>");
                    }
                }
            } catch (NullPointerException e) { out.println("<h3>Falta Ingresar Parametros</h3>");
            } catch (Exception e) {
                out.println("<h3>Ocurrio un error!!</h3>");
                System.out.println("*****************************************");
                System.out.println(e);
                System.out.println("*****************************************");
            }
        %>
                        
        <form>
            Buscar Titulo: <input type="text" name="buscarTitulo"/>
        </form>
        
        <%
            
            //for(Curso c:cr.getAll()) out.println(c+"<br>");
            
            String buscarTitulo=request.getParameter("buscarTitulo");
            if(buscarTitulo==null || buscarTitulo.isEmpty())
                out.println(new HtmlTable().getTable(cr.getAll()));
            else
                out.println(new HtmlTable().getTable(cr.getLikeTitulo(buscarTitulo)));
        %>
                        
    </body>
</html>
