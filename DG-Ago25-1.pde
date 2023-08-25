class Browniano{
  PVector p;
  PVector v;
  ArrayList <PVector> pos;
  float minX, maxX, minY, maxY;
  int n;
  float ancho;
  float alto;
  float dr;
  
  
  Browniano(int n_){
    p = new PVector(0,0);
    pos = new ArrayList <PVector> ();
    v = PVector.random2D();
    n = n_;
    minX = 0;
    maxX = 0;
    minY = 0;
    maxY = 0;
    dr = 0;
    for(int i = 0; i<n_; i++){
      pos.add(p.copy());
      Movimiento1();
      if(p.x>maxX){
        maxX = p.x;
      }
      if(p.x<minX){
        minX = p.x;
      }
      if(p.y>maxY){
        maxY = p.y;
      }
      if(p.y<minY){
        minY = p.y;
      }
    }
    ancho = abs(maxX-minX);
    alto = abs(maxY-minY);
  }
  
  void Movimiento1(){
    v = PVector.random2D();
    p.add(v);
  }
  
  void Movimiento2(){
    v.rotate(random(-0.1,0.1));
    p.add(v);
  }
  
  void Movimiento3(){
    dr+= random(-0.01,0.01);
    v.rotate(dr);
    p.add(v);
  }
  
}

Browniano miParticula;

void setup(){
  size(500,500);
  background(255);
  miParticula = new Browniano(5000);
}

float escala = 1;
float rota = 0;

void draw(){
 background(255);
 PVector posT[] = new PVector[miParticula.n];
 float nAn = width/miParticula.ancho;
 float nAl = height/miParticula.alto;
 for(int i = 0; i< miParticula.pos.size(); i++){
   posT[i] = miParticula.pos.get(i).copy();
   posT[i].x*=nAn;
   posT[i].y*=nAl;
   posT[i].add(new PVector(-miParticula.minX*nAn,-miParticula.minY*nAl));
   
 }
 
 for(int i = 1; i<5000; i++){
   
   noStroke();
   
   stroke(0);
   strokeWeight(0.5);
   line(posT[i].x,posT[i].y,posT[i-1].x,posT[i-1].y);
 }  
}
