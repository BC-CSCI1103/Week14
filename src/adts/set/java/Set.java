// file: Set.java
// author: Bob Muller
//
// CS3366 Programming Languages
//
// Facilities for programming in the large in Java.
//
// Classes and interfaces.
//
public interface Set<T> {

    int size();
    void add(T item);
    boolean mem(T item);
}
