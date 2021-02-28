package ar.com.eduit.curso.java.repositories.interfaces;

import ar.com.eduit.curso.java.entities.Alumno;
import ar.com.eduit.curso.java.entities.Curso;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public interface I_AlumnoRepository {
    void save(Alumno alumno);
    void remove(Alumno alumno);
    void update(Alumno alumno);
    List<Alumno> getAll();
    default Alumno getById(int id){
        return getAll()
                .stream()
                .filter(a->a.getId()==id)
                .findAny()
                .orElse(new Alumno());
    }
    default List<Alumno>getByApellido(String apellido){
        if (apellido==null) return new ArrayList<Alumno>();
        return getAll()
                .stream()
                .filter(a->a.getApellido().equalsIgnoreCase(apellido))
                .collect(Collectors.toList());
    }
    default List<Alumno>getLikeApellido(String apellido){
        if (apellido==null) return new ArrayList<Alumno>();
        return getAll()
                .stream()
                .filter(a->a.getApellido().toLowerCase().contains(apellido.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<Alumno>getLikeApellidoNombre(String apellido, String nombre){
        if (apellido==null || nombre==null) return new ArrayList<Alumno>();
        return getAll()
                .stream()
                .filter(a->a.getApellido().toLowerCase().contains(apellido.toLowerCase())
                        && a.getNombre().toLowerCase().contains(nombre.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<Alumno>getLikeCurso(int idCurso){
        return getAll()
                .stream()
                .filter(a->a.getIdCurso()==idCurso)
                .collect(Collectors.toList());
    }
    default List<Alumno>getLikeCurso(Curso curso){
        if(curso==null) return new ArrayList<Alumno>();
        return getLikeCurso(curso.getId());
    }
}