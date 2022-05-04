PVector poz;
PVector speed;
PVector accel;

void setup(){
  size(400,400);
  poz = new PVector(100,100);
  speed = new PVector(1,3);
  accel = new PVector(2,1);
}

void draw(){
  speed.add(accel);
  if(poz.x>width || poz.x<0){
    speed.x=speed.x * -1;
    accel.x=accel.x * -1;
  }
  if(poz.y>height || poz.y<0){
    speed.y=speed.y * -1; 
    accel.y=accel.y * -1;
  }
  background(100);
  fill(255);
  ellipse(poz.x,poz.y,50,50);
  speed.limit(10);
  poz.add(speed);
}
