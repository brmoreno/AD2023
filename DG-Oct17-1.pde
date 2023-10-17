class Nodo{
  PVector pos;
  float r;
  float f;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    r = random(30,100);
    f = random(-10,10);
  }
  
  Nodo(PVector pos_, float r_, float f_){
    pos = pos_;
    r = r_;
    f = f_;
  }
  
  void display(){
    noStroke();
    fill(0,0,255,50);
    ellipse(pos.x,pos.y,r*2,r*2);
    stroke(255,0,0);
  }
  
}

class Agente{
  PVector pos;
  float r;
  
  Agente(){
    pos = new PVector(random(width),random(height));
    r = 3;
  }
  Agente(float x_, float y_){
    pos = new PVector(x_,y_);
    r = 3;
  }
  
  void display(){
    strokeWeight(0.5);
    stroke(0);
    fill(255);
    ellipse(pos.x,pos.y,r*2,r*2);
  }
  
  void mover(ArrayList <Nodo> nodos){
    PVector v = new PVector (0,0);
    for(Nodo n: nodos){
      float dist = dist(pos.x,pos.y,n.pos.x,n.pos.y);
      if(dist < n.r){
        PVector m = n.pos.copy().sub(pos);
        m.normalize();
        float factor = map(dist,0,n.r,1,0)*n.f;
        m.mult(factor);      
        v.add(m);
      }
    }
    v.normalize();
    pos.add(v);
  }
}

ArrayList <Nodo> nodos;
ArrayList <Agente> agentes;

void setup(){
  size(500,500);
  nodos = new ArrayList <Nodo> ();
  agentes = new ArrayList <Agente> ();
  for(int i = 0; i<200; i++){
    nodos.add(new Nodo());
  }
  
  for(int i = 0; i<5000; i++){
    agentes.add(new Agente());
  }
  background(255);
}

void draw(){
  

  
  for(Agente a: agentes){
    a.display();
  }  
  for(Agente a: agentes){
    a.mover(nodos);
  }
  
}
