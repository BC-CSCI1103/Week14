/* An implementation of Immutable Maps in Java

   CSCI 1103 Computer Science 1 Honors
*/
public class Node<T> implements Map<T> {

  private String key;
  private T value;
  private Map<T> next;

  public Node(String key, T value, Map<T> map) {
    this.key   = key;
    this.value = value;
    this.next  = map;
  }

  public T find(String key) {
    if (key == this.key) {
      return this.value;
    }
    else {
      return this.next.find(key);
    }
  }

  public Map<T> add(String key, T value) {
    return new Node(key, value, this);
  }

// The client for the Map ADT
//
  public static void main(String[] args) {
    Map<Integer> map0 = new Empty(),
    map1 = map0.add("Alice", 12),
    map2 = map1.add("Bob", 10);

    System.out.format("Bob = %s\n", map2.find("Bob"));
  }
}
