import processing.serial.*;
Serial mojPort;

char smer = 0;
int x=100,y=100;

void setup(){
  printArray(Serial.list());
  mojPort = new Serial(this, Serial.list()[1], 9600);
  size(800,600);
  rectMode(CENTER);
}

void draw(){
  if(mojPort.available() >= 2){
    if(mojPort.read() == 0x01){
      smer = (char)mojPort.read();
    }
  }
  
  switch(smer){
    case '1':
      x = x - 2;
      break;
    case '2':
      x = x + 2;
      break;
    case '3':
      y= y + 2;
      break;
  }
  
  if(y>height) y=0;
  
  background(51); 
  fill(255, 204);
  rect(x,y, 50, 50);
  
  delay(10);
}
