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
    c =  resize.get(round(x),round(y));
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

Movie video;
float vel;
PImage resize;
ArrayList <Particula> particulas;
void setup(){
  size(682,360);
  video = new Movie(this, "smoke1.mp4");
  video.loop();
  vel = 1;
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<500; i++){
    particulas.add(new Particula());
  }
}


void draw(){
  background(255);
  if(video.available()){
    video.read();
    //vel = map(mouseX,0,width,0.01,3);
    video.speed(vel);
    resize = video.copy();
    resize.resize(width,height);
  } 
  for(Particula p: particulas){
    p.display();
    p.mover();
    p.rebotar();
  }
  saveFrame("frame/####.png");
}

void keyPressed(){
  float npos = random(video.duration());
  video.jump(npos);
}
