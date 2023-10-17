class Nodo{
  PVector pos;
  float r;
  PVector f;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    r = random(30,100);
    f = PVector.random2D().mult(random(1,50));
  }
}


class Nodo2{
  PVector pos;
  float r;
  float f;
  
  Nodo2(){
    pos = new PVector(random(width),random(height));
    r = random(30,100);
    f = random(-10,10);
  }
  
  Nodo2(PVector pos_, float r_, float f_){
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
  color c;
  
  Agente(){
    pos = new PVector(random(width),random(height));
    r = 4;
    c = gatoT.get(round(pos.x),round(pos.y));
  }
  Agente(float x_, float y_){
    pos = new PVector(x_,y_);
    r = 1;
  }
  
  void display(){
    strokeWeight(0.5);
    noStroke();
    color actual = gatoT.get(round(pos.x),round(pos.y));
    c = lerpColor(c,actual,0.04);
    fill(c);
    ellipse(pos.x,pos.y,r*2,r*2);
  }
  
  void mover(ArrayList <Nodo2> nodos){
    PVector v = new PVector (0,0);
    for(Nodo2 n: nodos){
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

PImage gato;
PImage gatoT;
ArrayList <Nodo> nodos;
ArrayList <Nodo2> nodos2;
ArrayList <Agente> agentes;
void setup(){
  size(450,450);
  nodos = new ArrayList <Nodo>();
  nodos2 = new ArrayList <Nodo2>();
  for(int i = 0; i<100; i++){
    nodos.add(new Nodo());
    nodos2.add(new Nodo2());
  }
  
  gato = loadImage("gatocubrebocas.png");
  gatoT = gato.copy();
  for(int i = 0; i<gatoT.pixels.length;i++){
    int x = i%width;
    int y = i/width;
    PVector np = new PVector(0,0);
    for(Nodo n:nodos){
      float dist = dist(n.pos.x,n.pos.y,x,y);
      if(dist<n.r){
        float factor = map(dist,0,n.r,1,0);
        PVector f = n.f.copy();
        f.mult(factor);
        np.add(f);
      }
    }
    x+=round(np.x);
    y+=round(np.y);
    gatoT.pixels[i] = gato.get(x,y);
  }
  gatoT.updatePixels(); 
  
  agentes = new ArrayList <Agente>();
  for(int i = 0; i<4000; i++){
    agentes.add(new Agente());
  }
  background(255);
}

void draw(){
    
  for(Agente a: agentes){
    a.display();
  }  
  for(Agente a: agentes){
    a.mover(nodos2);
  }
  
}
