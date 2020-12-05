public interface Map<T> {
  void add(String key, T value);
  T find(String key);
}
