
package ar.com.eduit.curso.java.repositories.jdbc;

import ar.com.eduit.curso.java.entities.Profesor;
import ar.com.eduit.curso.java.repositories.interfaces.I_ProfesorRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProfesorRepository implements I_ProfesorRepository{

    Connection conn;

    public ProfesorRepository(Connection conn) {
        this.conn = conn;
    }
    
    
    @Override
    public void save(Profesor profesor) {
        if(profesor==null) return;
        String query="insert into profesores (nombre,apellido) values (?,?)";
        try (PreparedStatement ps=conn.prepareStatement(query,PreparedStatement.RETURN_GENERATED_KEYS)){
            ps.setString(1, profesor.getNombre());
            ps.setString(2, profesor.getApellido());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) profesor.setId(rs.getInt(1));
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    @Override
    public void remove(Profesor profesor) {
         if(profesor==null) return;
        try (PreparedStatement ps=conn.prepareStatement("delete from profesores where id=?")){
            ps.setInt(1, profesor.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void update(Profesor profesor) {
            if(profesor==null) return;
        try (PreparedStatement ps=conn.prepareStatement(
                "update profesores set nombre=?, apellido=? where id=?")){
            ps.setString(1, profesor.getNombre());
            ps.setString(2, profesor.getApellido());
            ps.setInt(3, profesor.getId());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List<Profesor> getAll() {
              List<Profesor>list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery("select * from profesores")){
            while(rs.next()){
                list.add(new Profesor(
                        rs.getInt("id"), 
                        rs.getString("nombre"), 
                        rs.getString("apellido")
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }   
}
