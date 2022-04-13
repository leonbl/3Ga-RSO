#include <Arduino.h>
int x;
void setup() {
  Serial.begin(9600);
}

void loop() {
  if(Serial.available() >= 2){
    if(Serial.read() == 'm'){
      x = Serial.read();  
      if(x<80)
        digitalWrite(10, !digitalRead(10));
      else if(x<160)
        digitalWrite(11, !digitalRead(11));
      else if(x<250)
        digitalWrite(11, !digitalRead(11));
    }
  }
  delay(50);
}

