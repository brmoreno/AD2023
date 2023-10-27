class Nodo {
  PVector pos;
  float r;
  PVector f;
  PVector v;
  
  Nodo(){
    pos = new PVector(random(width), random(height));
    f = PVector.random3D().mult(random(1,10));
    v = PVector.random2D();
    r = random(50,150);
  }
  
  void mover(){
    pos.add(v);
  }
}


class Agente{
  PVector pos;
  ArrayList <PVector> ps;
  
  Agente(PVector pos_){
    pos = pos_;
    ps = new ArrayList <PVector>();
  }
  
  void f(ArrayList <Nodo> nodos){
    ps.add(pos.copy());
    PVector add = new PVector(0,0,0); 
    for(Nodo n: nodos){
      float dist = pos.dist(n.pos);
      if(dist < n.r){
        float factor = map(dist,0,n.r,1,0);
        PVector f = n.f.copy().mult(factor);
        add.add(f);
      }
    }
    pos.add(add);
  }
}


ArrayList <Nodo> nodos;
ArrayList <Agente> agentes;
int n = 100;
void setup(){
  background(255);
  size(600,600);
  nodos  = new ArrayList <Nodo> ();
  agentes = new ArrayList <Agente>();
  for(int i = 0; i<100; i++){
    nodos.add(new Nodo());
  }
  
  for(int i = 0; i<width; i+=10){
    for(int j = 0; j<height; j+=10){
      agentes.add(new Agente(new PVector(i,j)));
    }
  }
  
  
  for(int i = 0; i<n;i++){
    for(Agente a:agentes){
      a.f(nodos);
    }
  }
  
  //for(int i =0; i<n-1; i++){
  //  for(Agente a:agentes){
  //    PVector actual = a.ps.get(i);
  //    PVector siguiente = a.ps.get(i+1);
  //    line(actual.x,actual.y,siguiente.x,siguiente.y);
  //  }
  //}
  
  //for(Agente a: agentes){
  //  PVector pi = a.ps.get(0);
  //  PVector pf = a.ps.get(a.ps.size()-1);
  //  PVector dif = pf.copy().sub(pi);
  //  float rojo = 127 + dif.x;
  //  float verde = 127 + dif.y;
  //  float azul = 127 + dif.z;
  //  fill(rojo,verde,azul);
  //  float dist = pi.dist(pf)*0.1;
    
  //  rect(pi.x,pi.y,10,10);
  //}
  
  
   
   
   for(Agente a:agentes){
     PVector pi = a.ps.get(0);
     PVector pf = a.ps.get(a.ps.size()-1);
     PVector dif = pf.copy().sub(pi);
     float rojo = 127 + dif.x;
     float verde = 127 + dif.y;
     float azul = 127 + dif.z;
     stroke(rojo,verde,azul);
    
      for(int i = 0; i<a.ps.size()-1; i++){
      strokeWeight(i*0.3);
      PVector actual = a.ps.get(i);
      PVector siguiente = a.ps.get(i+1);
      line(actual.x,actual.y,siguiente.x,siguiente.y);
      }
    }
  
}
