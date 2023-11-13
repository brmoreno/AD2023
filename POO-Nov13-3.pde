class Esfera{
  PVector pos;
  PVector posO;
  float dist;
  float d;
  float dd;
  color c;
  float t;
  float dr;
  Esfera(){
    pos = PVector.random3D();
    posO = pos.copy();
    dist = 200;
    d = random(TWO_PI);
    dd = random(-0.05,0.05);
    c = color(random(255),random(255),random(255));
    t = random(20,40);
    dr = random(-0.05,0.05);
  }
  
  void display(){
    pushMatrix();
    noStroke();
    fill(c);
    translate(pos.x,pos.y,pos.z);
    sphere(t);
    popMatrix();
  }
  
  void mover(){
    d+=dd;
    float tam = sin(d)*dist;
    posO.rotate(dr);
    pos = posO.copy().mult(tam);    
  }
  
}

ArrayList <Esfera> esferas;

void setup(){
  size(500,500,P3D);
  esferas = new ArrayList <Esfera>();
  for(int i = 0; i<100; i++){
    esferas.add(new Esfera());
  }
  
  for(Esfera e:esferas){
    e.mover();
    
  }
}

void draw(){
  lights();
  background(255);
  translate(width/2, height/2);
  rotateX(mouseX*0.01);
  rotateY(mouseY*0.01);
  
  for(Esfera e:esferas){
    e.mover();
    e.display();
    
  }
}
