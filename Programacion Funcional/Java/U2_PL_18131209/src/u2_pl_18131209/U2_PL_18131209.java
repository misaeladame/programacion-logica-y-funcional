/*------------------------------------------------------------------------------------------
:*                         TECNOLOGICO NACIONAL DE MEXICO
:*                                 CAMPUS LA LAGUNA
:*                     INGENIERIA EN SISTEMAS COMPUTACIONALES
:*                         PROGRAMACION LOGICA Y FUNCIONAL
:*
:*                   SEMESTRE: ENE-JUN/2021    HORA: 12-13 HRS
:*
:*               Clase sobre funciones anonimas y de orden superior
:*
:*  Archivo     : U2_PL_18131209.java
:*  Autor       : Jose Misael Adame Sandoval     18131209
:*  Fecha       : 08/Mayo/2021
:*------------------------------------------------------------------------------------------*/

package u2_pl_18131209;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Stream;

public class U2_PL_18131209 {

    public static void main(String[] args) {
        funcionLambda ();
        System.out.println();
        stream ();
        System.out.println();
        map ();
        System.out.println();
        filter ();
        System.out.println();
        reduce ();
        System.out.println();
    }
    
    public static void funcionLambda () {
        
        // Crear un ArrayList de String
        ArrayList<String> nombres = new ArrayList<>();
        
        // Añadiendo elementos al ArrayList
        nombres.add("Misael");
        nombres.add("Lamia");
        nombres.add("Ricardo");
        nombres.add("Adrian");
        nombres.add("Elizabeth");
        
        // Imprimir los valores añadidos usando la expresión lambda
        nombres.forEach( (n) -> { System.out.println(n); } );
    }
    
    public static void stream () {
        
        // Crear un arreglo
        Integer[] miArreglo = {1, 5, 8, 12};

        // Convertirlo en un Stream
        Stream<Integer> miStream = Arrays.stream(miArreglo);
        
        // Imprimir los valores del Stream
        miStream.forEach(System.out::println);
        
    }
    
    public static void map () {
        
        // Crear una lista de enteros
        List<Integer> lista = Arrays.asList(1, 4, 9, 49, 25, 6);
        
        // Convertirlo en un Stream
        Stream<Integer> s = lista.stream();
        
        // Usar el Map en el Stream 
        Stream<Double> t = s.map(x -> Math.sqrt(x));
        
        // Imprimir los valores (ya con Map) del Stream
        t.forEach(System.out::println); 
    }
    
    public static void filter () {
        
        // Crear una lista de enteros
        List<Integer> lista = Arrays.asList(1, 4, 10, 49, 24, 7, 8, 9);
        
        // Convertirlo en un Stream
        Stream<Integer> s = lista.stream();
        
        // Usar el Filter en el Stream
        Stream<Integer> t = s.filter(x -> x % 2 == 1);
        
        // Imprimir los valores (ya con Filter) del Stream
        t.forEach(System.out::println);
    }
    
    public static void reduce () {
        
        // Crear una lista de enteros
        List<Integer> lista = Arrays.asList(1, 2, 3, 4, 5);
        
        // Convertirlo en un Stream
        Stream<Integer> s = lista.stream();
        
        // Usar el Reduce en el Stream
        Integer t = s.reduce(0, (x, y) -> x+y);
        
        // Imprimir los valores (ya con Reduce) de los enteros
        System.out.println(t);
    }
}
