public class Empty<T> implements Map<T> {

  public T find(String key) {
    throw new RuntimeException("Not Found");
  }

  public Map<T> add(String key, T value) {
    return new Node(key, value, this);
  }
}
