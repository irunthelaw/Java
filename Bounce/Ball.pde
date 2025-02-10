class Ball {

  // instance variables - describe the object
  float x, y, radius, vx, vy, ax, ay;
  color fillColor;

  // constructor(s) - create an instance of the object
  public Ball() {
    x = 0;
    y = 0;
    radius = 0;
    vx = 0;
    vy = 0;
    ax = 0;
    ay = 0;
    fillColor = color(0, 0, 0);
  }

  public Ball(float x, float y, float radius, color fillColor) {
    this.x = x;
    this.y = y;
    vx = 0;
    vy = 0;
    ax = 0;
    ay = 0;
    this.radius = radius;
    this.fillColor = fillColor;
  }

  public Ball(float x, float y, float radius, float vx, float vy, float ax, float ay, color fillColor) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.vx = vx;
    this.vy = vy;
    this.ax = ax;
    this.ay = ay;
    this.fillColor = fillColor;
  }

  // class method(s) - manipulate the object
  void drawBall() {
    noStroke();
    fill(fillColor);
    circle(x, y, radius*2);
  }

  boolean moveBall() {
    x += vx;
    y += vy;

    if (x - radius < 0) {
      vx *= -1;
      x = radius - 1;
      return true;
    }
    if (x + radius > width) {
      vx *= -1;
      x = width - radius - 1;
      return true;
    }
    if (y - radius < 0) {
      vy *= -1;
      y = radius - 1;
      return true;
    }
    if (y + radius > height) {
      vy *= -1;
      y = height - radius - 1;
      return true;
    } else {
      return false;
    }
  }

  // setters
  void setVelocity(float vx, float vy) {
    this.vx = vx;
    this.vy = vy;
  }

  void setRadius(float radius) {
    this.radius = radius;
  }

  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void setColor(color fillColor) {
    this.fillColor = fillColor;
  }

}
