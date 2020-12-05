/* An implementation of Mutable Maps in Java

   CSCI 1103 Computer Science 1 Honors
*/
public class MapC<T> implements Map<T> {

  private class Node {        // Think 3-tuple.
    String key;
    T value;
    Node next;

  private Node(String key, T value, Node next) {
    this.key   = key;
    this.value = value;
    this.next  = next;
    }
  }

  private Node first;

  public MapC() {           // null is a special symbol in Java and C.
    this.first = null;      // It's of every type and is commonly used
  }                         // to initialize variables of reference type.

  public T find(String key) {
    Node current = this.first;
    while (current != null) {
      if (key.compareTo(current.key) == 0) return current.value;
      current = current.next;
    }
    throw new RuntimeException("Key not found");
  }

  public void add(String key, T value) {
    this.first = new Node(key, value, this.first);
  }

  // The client for the mutable Map ADT.
  //
  public static void main(String[] args) {

    Map<Integer> myMap = new MapC<Integer>();
    myMap.add("Alice", 12);
    myMap.add("Bob", 10);

    System.out.format("Bob = %s\n", myMap.find("Bob"));
  }
}
