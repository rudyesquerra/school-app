package ar.com.eduit.curso.java.repositories.interfaces;

import ar.com.eduit.curso.java.entities.Curso;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_CursoRepository {
    void save(Curso curso);                     //insert
    void remove(Curso curso);                   //delete
    void update(Curso curso);                   //update
    List<Curso> getAll();                       //select
    default Curso getById(int id){              //select where
        /*
        Curso curso=new Curso();
        for(Curso c:getAll()){
            if(c.getId()==id) curso=c;
        }
        return curso;
        */
        return getAll()
                .stream()
                .filter(c->c.getId()==id)
                .findAny()
                .orElse(new Curso());
    }
    default List<Curso>getLikeTitulo(String titulo){    //select where
        if(titulo==null) return new ArrayList<Curso>();
        return getAll()
                .stream()
                .filter(c->c.getTitulo().toLowerCase().contains(titulo.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<Curso>getLikeTituloProfesor(String titulo, String profesor){
        if(titulo==null || profesor==null) return new ArrayList<Curso>();
        return getAll()
                .stream()
                .filter(c->c.getTitulo().toLowerCase().contains(titulo.toLowerCase())
                        && c.getProfesor().toLowerCase().contains(profesor.toLowerCase()))
                .collect(Collectors.toList());
    }
    
}