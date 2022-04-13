import processing.serial.*;
Serial mojPort;

void setup(){
  printArray(Serial.list());
  mojPort = new Serial(this, Serial.list()[1], 9600);
  size(250,250);
  rectMode(CENTER);
}

void draw(){

}

void mousePressed(){
  mojPort.write('m');
  mojPort.write(mouseX);
}
