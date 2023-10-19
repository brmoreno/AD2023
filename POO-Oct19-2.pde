interface Particula{
  
    void display();
    void mover();
}

class ParticulaA implements Particula{
  PVector pos;
  float t;
  color c;
  
  ParticulaA(){
    pos = new PVector(random(width),random(height));
    t = random(10,40);
    c = color(random(255),0,0);   
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(pos.x,pos.y,t,t);
  }
    void mover(){
      PVector v = PVector.random2D();
      pos.add(v);
  }
}

class ParticulaB implements Particula{
  PVector pos;
  float t;
  color c;
  PVector v;
  float dr;
  
  ParticulaB(){
    pos = new PVector(random(width),random(height));
    t = random(10,30);
    c = color(0,0,random(255));
    v = PVector.random2D();
    dr = random(-0.1,0.1);
  }
  
  void display(){
    rectMode(CENTER);
    noStroke();
    fill(c);
    rect(pos.x,pos.y,t,t);
  }
  
  void mover(){
    pos.add(v);
    v.rotate(dr);
  }
}

class ParticulaC implements Particula{
  PVector pos;
  float t;
  color c;
  PVector v;
  PVector fl;
  float dr;
  
  ParticulaC(){
    pos = new PVector(random(width),random(height));
    t = random(10,30);
    c = color(0,random(255),0);
    v = PVector.random2D();
    fl = PVector.random2D().mult(random(10,50));
    dr = random(-0.1,0.1);
  }
  
  void display(){
    rectMode(CENTER);
    noStroke();
    stroke(c);
    strokeWeight(3);
    line(pos.x,pos.y,pos.x+fl.x,pos.y+fl.y);
  }
  
  void mover(){
    pos.add(v);
    if(pos.x<0 || pos.x>width){
      v.x*=-1;
    }
    if(pos.y<0 || pos.y>height){
      v.y*=-1;
    }
    fl.rotate(dr);
  }
}

ArrayList <Particula> particulas;

void setup(){
  size(500,500);
  particulas = new ArrayList <Particula> ();
  for(int i = 0; i<200; i++){
    float r = random(1);
    if(r<0.3){
      particulas.add(new ParticulaA());
    }
    else if (r<0.6){
      particulas.add(new ParticulaB());
    }
    else{
      particulas.add(new ParticulaC());
    }
  }
 background(255);
}

void draw(){
 
  for(Particula p:particulas){
    p.mover();
    p.display();
  }
}
