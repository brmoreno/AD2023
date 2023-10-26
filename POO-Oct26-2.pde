class Particula{  
  float x;
  float y;
  float t;
  float dx;
  float dy;
  color c;

  Particula(){
    x= random(width);
    y= random(height);
    t = random(10,100);
    dx = random(-2,2);
    dy = random(-2,2);
  }

  void display(){
    noStroke();
    c =  cam.get(round(x),round(y));
    fill(c);
    ellipse(x,y,t,t);
  }
  
  void mover(){
    x+= dx;
    y+= dy;
  }
  
  void rebotar(){
    if(x<t/2){
    dx = abs(dx);
    }
    if(x>width-t/2){
      dx = -abs(dx);
    }
    if(y<t/2){
      dy = abs(dy);
    }
    if(y>height-t/2){
      dy = -abs(dy);
    }
  }
}


import processing.video.*;

Capture cam;
PImage slit;
int x = 0;
ArrayList <Particula> particulas;

void setup(){
  size(682,360);
  String[] camaras = Capture.list();
  cam = new Capture(this, camaras[0]);
  cam.start();
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<500; i++){
    particulas.add(new Particula());
  }
  
}

void draw(){
  background(255);
  for(Particula p: particulas){
    p.display();
    p.mover();
    p.rebotar();
  }
}

void captureEvent(Capture c) {
  c.read();
}
