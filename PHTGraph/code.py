
float x1,y1,x2,y2;

void setup() {
  size(800,600);
  x1 = 0;
  y1 = height/2;


  background(255,255,255);
  for (int i = 50; i < width + 1; i += 50){
    line(i, 0, i, height - 50);
}
  // h row
  for (int i = 50; i < height + 1; i += 50){
    line(50, i, width, i);
}
}



void draw(){
  x2 = x1+50;
  y2 = random(0, height);
  line(x1,y1,x2,y2);
  x1 = x2;
  y1 = y2;
}
