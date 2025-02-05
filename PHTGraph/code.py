import processing.serial.*;

Serial serialPort;  // The serial port
float sensor1, sensor2, sensor3;
float posX1, posX2, temp1, temp2, pres1, pres2, hum1, hum2, posX3, posX4, posX5, posX6;
int gridNum = 30;
String labelText = "";

void setup() {
  size(800, 600);
  background(255, 255, 255);
  posX1 = 50;
  posX3 = 50;
  posX5 = 50;
  hum1 = 0;
  hum2 = 0;
  temp1 = 0;
  temp2 = 0;
  pres1 = 0;
  pres2 = 0;
  printArray(Serial.list());
  
  // Open the serial port at the desired baud rate
  serialPort = new Serial(this, Serial.list()[0], 9600);
  
  // Create grid (vertical)
  for (int i = 50; i < width + 1; i += 50) {
    line(i, 0, i, height - 50);
  }

  // Create grid (horizontal)
  for (int i = 50; i < height + 1; i += 50) {
    line(50, i, width, i);
  }

  // Display top labels
  fill(0, 0, 255);
  text("1050 hPa", 3, 10);
  fill(0, 128, 0);
  text("100%", 3, 25);
  fill(255, 0, 0);
  text("85 deg", 3, 40);

  // Display bottom labels
  fill(0, 0, 255);
  text("950 hPa", 3, 535);
  fill(0, 128, 0);
  text("0%", 3, 550);
  fill(255, 0, 0);
  text("62 deg", 3, 565);

  // Display second labels on the bottom
  fill(0, 0, 0);
  for (int i = 100; i < width; i += 50) {
    labelText = String.valueOf(gridNum);
    text(labelText, i - 5, 563);
    gridNum += 30;
  }
}

void draw() {
  while (serialPort.available() > 0) {
    String inputBuffer = serialPort.readString();
    if (inputBuffer != null) {
      println(inputBuffer);
      String values = inputBuffer;
      int startIdx, endIdx;
      String substring;
      
      startIdx = 0;
      endIdx = values.indexOf(',', startIdx);
      if (endIdx != -1) {
        substring = values.substring(startIdx, endIdx);
        sensor1 = Float.parseFloat(substring);
        println(sensor1);
        startIdx = endIdx + 1;
      }
      
      endIdx = values.indexOf(',', startIdx);
      if (endIdx != -1) {
        substring = values.substring(startIdx, endIdx);
        sensor2 = Float.parseFloat(substring);
        println(sensor2);
        startIdx = endIdx + 1;
      }
      
      if (endIdx < values.length() - 1) {
        substring = values.substring(startIdx);
        sensor3 = Float.parseFloat(substring);
        println(sensor3);
      }

      // Temperature calculation and mapping
      float temperature = sensor3;
      float mappedTemp = 600 - map(temperature, 62, 85, 0, 550);
      print("Temperature: " + temperature + " Mapped: " + mappedTemp);
      println();

      // Humidity calculation and mapping
      float humidity = sensor2;
      float mappedHumidity = 600 - map(humidity, 0, 100, 0, 550);
      print("Humidity: " + humidity + " Mapped: " + mappedHumidity);

      // Pressure calculation and mapping
      float pressure = sensor1;
      float mappedPressure = 600 - map(pressure, 850, 1100, 0, 550);
      print("Pressure: " + pressure + " Mapped: " + mappedPressure);

      // Draw temperature line
      posX2 = posX1 + 50;
      if (temp1 == 0 && temp2 == 0) {
        temp1 = mappedTemp;
        temp2 = mappedTemp;
      } else {
        temp2 = mappedTemp;
      }
      stroke(255, 0, 0);
      strokeWeight(3);
      line(posX1, temp1, posX2, temp2);
      posX1 = posX2;
      temp1 = temp2;

      // Draw humidity line
      posX4 = posX3 + 50;
      if (hum1 == 0 && hum2 == 0) {
        hum1 = mappedHumidity;
        hum2 = mappedHumidity;
      } else {
        hum2 = mappedHumidity;
      }
      stroke(0, 128, 0);
      strokeWeight(3);
      line(posX3, hum1, posX4, hum2);
      posX3 = posX4;
      hum1 = hum2;

      // Draw pressure line
      posX6 = posX5 + 50;
      if (pres1 == 0 && pres2 == 0) {
        pres1 = mappedPressure;
        pres2 = mappedPressure;
      } else {
        pres2 = mappedPressure;
      }
      stroke(0, 0, 255);
      strokeWeight(3);
      line(posX5, pres1, posX6, pres2);
      posX5 = posX6;
      pres1 = pres2;
    }
  }
}
