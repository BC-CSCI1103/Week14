// file: SetC.java
// author: Bob Muller
//
// Facilities for programming in the large in Java.
//
// Classes and interfaces.
//
import java.util.*;

public class SetC<T> implements Set<T> {

    private ArrayList<T> set;

    public SetC() {
      this.set = new ArrayList<T>();
    }
    public int size() { return set.size(); }

    public void add(T item) { set.add(item); }

    public boolean mem(T item) { return set.contains(item); }
}
