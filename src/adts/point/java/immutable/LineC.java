public class LineC implements Line {

  private Point p1;
  private Point p2;

  public LineC(Point p1, Point p2) {
    this.p1 = p1;
    this.p2 = p2;
  }

  public Point getP1() { return this.p1; }
  public Point getP2() { return this.p2; }

  public String toString() {
    return "{p1 = " + p1.toString() + ", p2 = " + p2.toString() + "}";
  }

  public double length() {
    double
      dx = this.p1.getX() - this.p2.getX(),
      dy = this.p1.getY() - this.p2.getY();

    return Math.sqrt(dx * dx + dy * dy);
  }

  public Point midPoint() {
    double
      x1 = this.p1.getX(),
      y1 = this.p1.getY(),
      x2 = this.p2.getX(),
      y2 = this.p2.getY();
    return new PointC((x1 + x2) / 2.0, (y1 + y2) / 2.0);
  }

  public int compareTo(Line other) {
    return midPoint().compareTo(other.midPoint());
  }

  public boolean equal(Line other) {
    return compareTo(other) == 0;
  }

  public Line move(double dx, double dy) {
    return new LineC(this.p1.move(dx, dy), this.p2.move(dx, dy));
  }

  // Unit testing
  //
  public static void main(String[] args) {
    Point p1 = new PointC(2.0, 3.0),
          p2 = new PointC(4.0, 5.0);
    Line line1 = new LineC(p1, p2);
    System.out.println("line1 = " + line1.toString());
    Line line2 = line1.move(1.0, 1.0);
    System.out.println("line2 = " + line2.toString());
    }
}
