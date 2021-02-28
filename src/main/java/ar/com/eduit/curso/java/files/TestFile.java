package ar.com.eduit.curso.java.files;

import com.sun.tools.javac.util.List;
import java.util.stream.Collectors;

public class TestFile {
    public static void main(String[] args) {
        String file="res/texto.txt";
        I_File fText=new FileText(file);
        
        fText.setText("Curso de Java!\n");
        fText.appendText("Hoy es martes\n");
        fText.addLine("Lunes");
        fText.addLine("Martes");
        fText.addLine("Miercoles");
        fText.addLine("Jueves");
        fText.addLine("Viernes");
        fText.addLine("Sabado");
        fText.addLine("Domingo");
        
        List<String>semana=List.of("Primavera", "Verano","Otono","Invierno","Primavera");
        fText.addLines(semana);
              
        
        //System.out.println(fText.getText());
        //fText.print();
        
        //fText.getAll().forEach(System.out::println);
        
        //Mostrar solo filas que contengan la letra M
        fText
                .getAll()
                .stream()
                .filter(s -> s.toLowerCase().contains("m"))
                .collect(Collectors.toSet())
                .forEach(System.out::println);
    }
}
