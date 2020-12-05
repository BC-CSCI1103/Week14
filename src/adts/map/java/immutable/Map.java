
/* An API for Immutable Maps in Java

   CSCI 1103 Computer Science 1 Honors
*/
public interface Map<T> {
  Map<T> add(String key, T value);
  T find(String key);
}
