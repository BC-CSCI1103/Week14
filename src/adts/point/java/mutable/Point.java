// file: Point.java
// author: Bob Muller
// date: January 2020
//
// A simple Point type.
//
interface Point {
  double getX();
  double getY();
  String toString();
  int compareTo(Point other);
  boolean equal(Point other);
  void move(double dx, double dy);
}
