package ar.com.eduit.curso.java.test;

import ar.com.eduit.curso.java.connectors.Connector;
import ar.com.eduit.curso.java.entities.Alumno;
import ar.com.eduit.curso.java.entities.Curso;
import ar.com.eduit.curso.java.entities.Profesor;
import ar.com.eduit.curso.java.enums.Dia;
import ar.com.eduit.curso.java.enums.Turno;
import ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository;
import ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository;
import ar.com.eduit.curso.java.repositories.interfaces.I_ProfesorRepository;
import ar.com.eduit.curso.java.repositories.jdbc.AlumnoRepository;
import ar.com.eduit.curso.java.repositories.jdbc.CursoRepository;
import ar.com.eduit.curso.java.repositories.jdbc.ProfesorRepository;
import java.util.List;

public class TestRepository {
    public static void main(String[] args) {
        /*
        I_CursoRepository cr=new CursoRepository(Connector.getConnection());
        
        Curso curso=new Curso("PHP", "Peterson", Dia.VIERNES, Turno.MAÑANA);
        
        cr.save(curso);
        
        System.out.println(curso);
        
        System.out.println("**************************************************");
        */
        
        /*
        List<Curso>list=cr.getAll();
        
        //recorrido por indices
        for(int a=0;a<list.size();a++){
            System.out.println(list.get(a));
        }
        */
        
        /*
        cr.getAll().forEach(System.out::println);
        
        System.out.println("**************************************************");
        
        curso=cr.getById(2);
        System.out.println(curso);
        
        System.out.println("**************************************************");
        cr.remove(cr.getById(3));
        
        System.out.println("**************************************************");
        curso=cr.getById(5);
        curso.setProfesor("Segovia");
        curso.setDia(Dia.LUNES);
        cr.update(curso);
        
        System.out.println("**************************************************");
        
        */
        
        /*
        list=cr.getLikeTitulo("ja");
        
        //recorrido por indices
        for(int a=0;a<list.size();a++){
            System.out.println(list.get(a));
        }
        */
        
        /*
        cr.getLikeTitulo("ja").forEach(System.out::println);
        
        System.out.println("**************************************************");
        cr.getLikeTituloProfesor("ja", "rios").forEach(System.out::println);
        
        System.out.println("**************************************************");
        */
        
        /*
        I_AlumnoRepository ar=new AlumnoRepository(Connector.getConnection());
        
        Alumno alumno=new Alumno("Gabriel", "Garcia", 74, 4);
        
        ar.save(alumno);
        
        
        
        ar.remove(ar.getById(14));
        
        alumno = ar.getById(15);
        alumno.setIdCurso(10);
        ar.update(alumno);
        System.out.println(alumno);
        System.out.println("**************************************************");
        ar.getAll().forEach(System.out::println);
        
        System.out.println("**************************************************");
        ar.getByApellido("Molina").forEach(System.out::println);
        System.out.println("*******METODO GET LIKE APELLIDO*****************");
        ar.getLikeApellido("mo").forEach(System.out::println);
        System.out.println("**************************************************");
        ar.getLikeApellidoNombre("", "cri").forEach(System.out::println);
        System.out.println("**************************************************");
        ar.getLikeCurso(cr.getById(2)).forEach(System.out::println);
        
        */
        
        I_ProfesorRepository pr=new ProfesorRepository(Connector.getConnection());
        
        //Profesor profesor=new Profesor("Walter", "Whitman");
        
        //pr.save(profesor);
        //System.out.println(profesor);   
        
        System.out.println("****** Filtrado de profesor por ID ******");
        Profesor profesor2 = pr.getById(3);
        System.out.println(profesor2);
        
        //System.out.println("****** Actualizacion (Update) de profesor ******");
        //profesor2.setId(1);
        //pr.update(profesor2);
        //System.out.println(profesor2);
        
        System.out.println("****** Filtrado de profesor por Apellido (Exacto) ******");
        pr.getByApellido("Rulfo").forEach(System.out::println);
        
         System.out.println("****** Filtrado de profesor por Apellido ******");
        pr.getLikeApellido("Whi").forEach(System.out::println);
        
        System.out.println("****** Remocion de profesor (Remove) ******");
        pr.remove(pr.getById(5));

        
        
    }
}