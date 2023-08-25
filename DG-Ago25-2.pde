class Browniano{
  PVector p;
  PVector v;
  ArrayList <PVector> pos;
  float minX, maxX, minY, maxY;
  int n;
  float ancho;
  float alto;
  float dr;
  float magMax;
  
  
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
    magMax = 0;
    for(int i = 0; i<n_; i++){
      pos.add(p.copy());
      float magA = p.mag();
      if(magA>magMax){
        magMax = magA;
      }
      Movimiento3();
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

Browniano r;
Browniano g;
Browniano b;

void setup(){
  size(1000,500);
  background(255);
  r = new Browniano(1000);
  g = new Browniano(1000);
  b = new Browniano(1000);
}

float escala = 1;
float rota = 0;

void draw(){
 background(255);
 float rescala = 255/r.magMax;
 float gescala = 255/g.magMax;
 float bescala = 255/b.magMax;
 for(int i = 0; i<r.n;i++){
   float rmag = r.pos.get(i).mag();
   float gmag = g.pos.get(i).mag();
   float bmag = b.pos.get(i).mag();
   noStroke();
   fill(rmag*rescala,gmag*gescala,bmag*bescala);
   rect(i,0,1,height);
 }
 
}
