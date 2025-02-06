
float x, y, radius, vx, vy, ax, ay, g;
color newColor;

ArrayList<Ball> ballList = new ArrayList<Ball>();

void setup() {
  size(800, 600);
  g = 2;
  for(int i = 0; i < 1; i++) {
  x = random(width);
  y = random(height);
  radius = random(40);
  vx = random(21) - 10;
  vy = random(21) - 10;
  newColor = color(random(200), random(50), random(55));
  Ball one = new Ball(x, y, radius, vx, vy, 0, 0, newColor);
  ballList.add(one);
}
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
