void main() {
  Shape circle = Circle(3.3);
  print(circle.area());
}

abstract class Shape {
  double area();
}

class Circle extends Shape {
  double r;
  Circle(this.r);
  double area() {
    return 3.14 * r * r;
  }
}

class Rectangel extends Shape {
  double higth;
  double width;
  Rectangel(this.higth, this.width);
  double area() {
    return width * higth;
  }
}
