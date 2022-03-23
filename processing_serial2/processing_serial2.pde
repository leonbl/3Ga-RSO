import processing.serial.*;
Serial mojPort;

void setup(){
  printArray(Serial.list());
  mojPort = new Serial(this, Serial.list()[2], 9600);
  size(800,600);
}

void draw(){
  background(255);
  char bajt = 0;
  while(mojPort.available() > 0){
    bajt = (char)mojPort.read();
    print(bajt);
  }
  fill(bajt);
  rect(100, 100, 600, 300);
  delay(200);
}
