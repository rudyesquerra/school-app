<%-- 
    Document   : Test
    Created on : 2 feb. 2021, 12:12:09
    Author     : carlos
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=es >
    <head>
        <meta http-equiv=Content-Type content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <!-- Bloque de comentarios HTML o XML -->
        
        <%
            //código en JAVA
            
            int x=2;
            
            
            //imprime en consola
            System.out.println("*********************************************");
            System.out.println("Hola Mundo!!!");
            System.out.println("*********************************************");
            

            //renderiza en el browser
            out.println("<h3>Hola mundo JSP!!</h3>");
            

            List<String> lista=new ArrayList();
        

            //Recibir parametros de usuario.
            
            String nombre=request.getParameter("nombre");
            if(nombre!=null && !nombre.isEmpty()){
                out.println("Hola "+nombre);
            }else{
                out.println("No se recibieron parametros!!");
            }

        %>
        
    </body>
</html>
