class Zogica{
  PVector poz;
  PVector speed;
  PVector accel;
  float maxSpeed;
  
  Zogica(){
   poz = new PVector(width/2, height/2); 
   speed = new PVector(random(3),random(3));
   accel = new PVector(random(1),random(1));
   maxSpeed = 8;
  }
  
  void update(){
    speed.add(accel); 
    if(poz.x>width || poz.x<0){
      speed.x=speed.x * -1;
      accel.x=accel.x * -1;
    }
    if(poz.y>height || poz.y<0){
      speed.y=speed.y * -1; 
      accel.y=accel.y * -1;
    }
     speed.limit(maxSpeed);
     poz.add(speed);
  }
  
  void display(){
     fill(255);
     ellipse(poz.x,poz.y,50,50);
  }
}
