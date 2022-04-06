#include <Arduino.h>

void setup() {
  Serial.begin(9600);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);

}

void loop() {
  if(!digitalRead(A1)){
    Serial.write(0x01);
    Serial.write('1');
    delay(100);
  }
  if(!digitalRead(A2)){
    Serial.write(0x01);
    Serial.write('2');
    delay(100);
  }
  if(!digitalRead(A3)){
    Serial.write(0x01);
    Serial.write('3');
    delay(100);
  }
}