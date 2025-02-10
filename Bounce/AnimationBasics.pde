float x, y, radius, vx, vy, ax, ay, g;
color newColor;
ArrayList<Ball> ballList = new ArrayList<Ball>();
int ballCount;

void setup() {
  size(800, 600);
  g = 0.5;
  for (int i = 0; i < 1; i++) {
    x = random(width);
    y = random(height);
    radius = random(40) + 12;
    vx = 0;
    while (vx == 0) {
      vx = (float)(int)(random(21) - 10);
    }
    vy = 0;
    while (vy == 0) {
      vy = (float)(int)(random(21) - 10);
    }
    newColor = color(250, random(100), random(220));
    Ball one = new Ball(x, y, radius, vx, vy, 0, 0, newColor);
    ballList.add(one);
  }
}
void draw() {
  background(#000000);
  ballCount = ballList.size();
  for (int i = 0; i < ballCount; i++) {
    Ball ball =ballList.get(i);
    ball.drawBall();
    ball.moveBall();
    if (ball.moveBall()){
      newColor = color(250, random(100), random(220));
      radius = random(40) + 12;
      vx *= -1;
      vy *= -1;
      Ball one = new Ball(ball.x, ball.y, radius, vx, vy, 0, 0, newColor);
      ballList.add(one);
    }
  }
}
