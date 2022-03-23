#include <Arduino.h>

void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.write(random(256));
  delay(200);
}