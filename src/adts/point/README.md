This folder contains three subfolders implementing a Point ADT in java, ocaml and python. The code is used as part of the transition from CS1103 to CS1102 at Boston College.

Java, ocaml and python have different ways of specifying an API. But here's a java interface specifying immutable points:

interface Point {

  public static Point make(double x, double y)

  public double getX();
  public double getY();
  public String toString();
  public double compareTo(Point other);
  public double distance(Point other);
  public Point move(double dx, double dy);
}

