Zogica[] zoga = new Zogica[50];

void setup(){
  size(400,400);
  for(int n = 0; n<zoga.length; n++){
     zoga[n] = new Zogica(); 
  }
}

void draw(){
  background(100);
  for(int n = 0; n < zoga.length; n++){
    zoga[n].update();
    zoga[n].display();
  }
}
