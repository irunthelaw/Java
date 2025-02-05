class Ball {
  
  // instance variables - describe the object
  float x, y, radius, vx, vy, ax, ay;
  color fillColor;
  
  // constructor(s) - create an instance of the object
  public Ball(float x, float y, float radius, float vx,
              float vy, float ax, float ay, color fillColor) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.vx = vx;
    this.vy = vy;
    this.ax = ax;
    this.ay = ay;
    this.fillColor = fillColor;
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
  // class method(s) - manipulate the object
  void drawBall() {
    noStroke();
    fill(fillColor);
    circle(x, y, radius*2);
  }
  void moveBall() {
    x += vx;
    y += vy;
    if (x - radius <= 0 || x+radius >= width) vx *= -1;
    if (y -radius <= 0 || y+radius >= height) vy = -1; 
  }
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
float x, y, radius, vx, vy, ax, ay, g;
color newColor;

ArrayList<Ball> ballList = new ArrayList<Ball>();

void setup() {
  size(800, 600);
  g = 0.5;
  for(int i = 0; i < 1000; i++) {
  x = random(width);
  y = random(height);
  radius = random(40);
  vx = random(21) - 10;
  vy = random(21) - 10;
  newColor = color(random(256), random(256), random(256));
  Ball one = new Ball(x, y, radius, vx, vy, 0, 0, newColor);
  ballList.add(one);
}

void draw() {
  background(0);
  stroke(255);
  line(0, height * 7 / 8, width, height * 7 / 8);
  fill(255);
  for(Ball ball:ballList) {
    ball.drawBall();
    ball.moveBall();
  }
}
