// file: StringSetC.java
// author: Bob Muller
//
// CS3366 Programming Languages
//
// Facilities for programming in the large in Java.
//
// Classes and interfaces.
//
import java.util.*;

public class StringSetC implements StringSet {

    private ArrayList<String> set;

    public StringSetC() {
	set = new ArrayList<String>();
    }
    public int size() { return set.size(); }
    
    public void add(String item) { set.add(item); }
    
    public boolean mem(String item) { return set.contains(item); }
}
