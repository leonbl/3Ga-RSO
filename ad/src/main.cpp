#include <Arduino.h>
#define data 8
#define clk 7
#define lclk 4

void t_lclk(void);
void t_clk(void);
float izmeri(void);
void vpis(byte levi, byte desni);
void prikaz(int d_num, int stevilo, int dp);
void izpis(float stevilo);

void setup() {
  Serial.begin(9600);
  pinMode(data, OUTPUT);
  pinMode(clk, OUTPUT);
  pinMode(lclk, OUTPUT);
  digitalWrite(clk, LOW);
  digitalWrite(lclk, LOW);
}

void loop() {
  izpis(izmeri());
}

void t_clk(void){
  digitalWrite(clk, HIGH);
  digitalWrite(clk, LOW);
}
void t_lclk(void){
  digitalWrite(lclk, HIGH);
  digitalWrite(lclk, LOW);
}
float izmeri(void){
  int napetost = analogRead(A0);
  float nap_f = (float)napetost*5/1024;
  return nap_f;
}
void vpis(byte levi, byte desni){
  for(int n=0; n<8; n++){
    digitalWrite(data, (desni & 0x01));
    t_clk();
    desni = desni >> 1;
  }
  for(int n=0; n<8; n++){
    digitalWrite(data, (levi & 0x01));
    t_clk();
    levi = levi >> 1;
  }
  t_lclk();
}

void prikaz(int d_num, int stevilo, int dp){
  byte num[]={0x03, 0x9f, 0x25, 0x0d, 0x99,0x49, 0x41, 0x1f, 0x01, 0x09, 0xff};
  vpis(0x01<<(d_num+4), num[stevilo] & (0xff^dp));
}

void izpis(float stevilo){
  char buf[10];
  dtostrf(stevilo, 4, 3, buf);
  int str_cnt = 0;
  for(int n=0; n<4; n++){
    if(buf[n+1]=='.'){
      prikaz(3-n, buf[str_cnt]-'0', 1);
      str_cnt++;
    }
    else {
      prikaz(3-n, buf[str_cnt]-'0', 0);
    }
    str_cnt++;
    delay(2);
  }
}