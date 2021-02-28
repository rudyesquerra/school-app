package ar.com.eduit.curso.java.files;

import java.util.List;

public interface I_File {
    default void print(){System.out.println(getText());}
    String getText();
    void setText(String text);
    void appendText(String text);

    default void addLine(String line){appendText(line+"\n");}
    default void addLines(List<String>list){
        list.forEach(item->addLine(item));
    }
    List<String>getAll();
}
