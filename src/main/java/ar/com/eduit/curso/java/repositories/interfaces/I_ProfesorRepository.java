package ar.com.eduit.curso.java.repositories.interfaces;

import ar.com.eduit.curso.java.entities.Profesor;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_ProfesorRepository {
    void save(Profesor profesor);
    void remove(Profesor profesor);
    void update(Profesor profesor);
    List<Profesor>getAll();
    default Profesor getById(int id){
        return getAll()
                .stream()
                .filter(a->a.getId()==id)
                .findAny()
                .orElse(new Profesor());
    };
    
   default List<Profesor>getByApellido(String apellido){
        if (apellido==null) return new ArrayList<Profesor>();
        return getAll()
                .stream()
                .filter(a->a.getApellido().equalsIgnoreCase(apellido))
                .collect(Collectors.toList());
    }
   
   
    default List<Profesor>getLikeApellido(String apellido){
        if (apellido==null) return new ArrayList<Profesor>();
        return getAll()
                .stream()
                .filter(a->a.getApellido().toLowerCase().contains(apellido.toLowerCase()))
                .collect(Collectors.toList());
    }
}
