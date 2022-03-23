// Popravi tako, da lahko pošlješ vrednosti večje od 255

import processing.serial.*;
Serial mojPort;

void setup(){
  printArray(Serial.list());
  mojPort = new Serial(this, Serial.list()[2], 9600);
  size(800,600);
}

void draw(){
  background(255);
  char bajt1 = 0, bajt2 = 0, bajt3 = 0;
  if(mojPort.available() >= 5){
    if(mojPort.read() == 'S'){
      bajt1 = (char)mojPort.read();
      bajt2 = (char)mojPort.read();
      bajt3 = (char)mojPort.read();
      print(bajt1);
    }
  }
  fill(bajt1, bajt2, bajt3);
  rect(bajt1, bajt3, bajt2*2, bajt3*2);
  delay(10);
}
