import processing.serial.*;
Serial myPort;  // The serial port
float val1, val2, val3;
float x1, x2, b1, b2, n1, n2, v1, v2, x3, x4, x5, x6;
int num = 30;
String txt = "";
void setup() {
  size(800, 600);
  background(255, 255, 255);
  x1 = 50;
  x3 = 50;
  x5 = 50;
  v1 = 0;
  v2 = 0;
  b1 = 0;
  b2 = 0;
  n1 = 0;
  n2 = 0;
  printArray(Serial.list());
  // Open the port you are using at the rate you want:
  // vertical
  for (int i = 50; i < width + 1; i += 50) {
    line(i, 0, i, height - 50);
  }
  // horizontal
  for (int i = 50; i < height + 1; i += 50) {
    line(50, i, width, i);
  }

//b
  fill(0, 0, 255);
  text("950 hPa", 3, 535);
  fill(0, 128, 0);
  text("0%", 3, 550);
  fill(255, 0, 0);
  text("62 deg", 3, 565);
  //t
  fill(0, 0, 255);
  text("1050 hPa", 3, 10);
  fill(0, 128, 0);
  text("100%", 3, 25);
  fill(255, 0, 0);
  text("85 deg", 3, 40);
  
  // l
  fill(0, 0, 0);
  for (int i = 100; i < width; i+= 50) {
    txt = String.valueOf(num);
    text(txt, i , 563);
    num += 30;
  }
}
