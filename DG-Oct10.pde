class Nodo{
  PVector pos;
  float r;
  PVector f;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    r = random(30,100);
    f = PVector.random2D().mult(random(1,5));
  }
  
  void display(){
    noStroke();
    fill(0,0,255,50);
    ellipse(pos.x,pos.y,r*2,r*2);
    stroke(255,0,0);
    line(pos.x,pos.y,pos.x+f.x*3,pos.y+f.y*3);
  }
  
}

class Agente{
  PVector pos;
  float r;
  
  Agente(){
    pos = new PVector(random(width),random(height));
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
        PVector m = n.f.copy();
        float factor = map(dist,0,n.r,1,0);
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
  
  //for(Nodo n: nodos){
  //  n.display();
  //}
  
  for(Agente a: agentes){
    a.display();
  }  
  for(Agente a: agentes){
    a.mover(nodos);
  }
  saveFrame("frames/####.png");
}
