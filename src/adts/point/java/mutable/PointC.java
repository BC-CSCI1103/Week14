// file: PointC.java
// author: Bob Muller
// date: January 2020
//
// An implementation of the Point type.
//
public class PointC implements Point {

    private double x;
    private double y;

    // A constructor of Points.
    //
    public PointC(double x, double y) {
        this.x = x;
        this.y = y;
    }

    // A static factory method. We'll come back to this later!
    public static Point make(double x, double y) {
        return new PointC(x, y);
    }

    public String toString() { return "(" + x + ", " + y + ")"; }

    // Getters.
    //
    public double getX() { return this.x; }
    public double getY() { return this.y; }

    public int compareTo(Point other) {
      int xAnswer = (int) (this.getX() - other.getX());
      return xAnswer < 0 ? -1 : (xAnswer > 0 ? 1 : 0);
    }

  public boolean equal(Point other) {
    return compareTo(other) == 0;
  }

  public void move(double dx, double dy) {
    this.x = this.x + dx;
    this.y = this.y + dy;
  }

  // Unit testing
  //
  public static void main(String[] args) {
    Point p = new PointC(2.0, 3.0);
    System.out.println("p = " + p.toString());
    p.move(1.0, 1.0);
    System.out.println("p = " + p.toString());
    }
}
