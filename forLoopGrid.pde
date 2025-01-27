void setup() {
  size(800,600);
  background(255,255,255);
  // vertical rows
  for (int i = 50; i < width + 1; i += 50){
    line(i, 0, i, height - 50);
  }
  // horizantal rows
  for (int i = 50; i < height + 1; i += 50){
    line(50, i, width, i);
  }
}
void draw(){
}
