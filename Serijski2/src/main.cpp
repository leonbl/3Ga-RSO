#include <Arduino.h>

void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.write('S');
  Serial.write(random(256));
  Serial.write(random(256));
  Serial.write(random(256));
  delay(10);
}