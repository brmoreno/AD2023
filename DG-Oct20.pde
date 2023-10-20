class NodoC{
  PVector pos;
  float ra;
  float r,g,b;
  float dr;
  
  
  NodoC(){
    pos = PVector.random3D().mult(100);
    ra = random(10,70);
    r = random(40);
    g = random(40);
    b = random(40);
    dr = random(-0.05,0.05);
  }
  
  void mover(){
    pos.rotate(dr);
  }
}

class NodoT{
  PVector pos;
  float t;
  float f;
  float dr;
  
  NodoT(){
    pos = PVector.random3D().mult(100);
    t = random(20,60);
    f = random(-20,20);
    dr = random(-0.05,0.05);
  }
  
  void mover(){
    pos.rotate(dr);
  }
  
}


PShape modelo;
ArrayList <NodoC> nodosc;
ArrayList <NodoT> nodost;
void setup(){
  size(500,500,P3D);
  modelo = loadShape("ico.obj");
  nodosc = new ArrayList <NodoC>();
  nodost = new ArrayList <NodoT>();
  for(int i = 0; i <100; i++){
    nodost.add(new NodoT());
  }
  for(int i = 0; i<100;i++){
    nodosc.add(new NodoC());
  }
}

void draw(){
  background(0);
  lights();
  translate(width/2,height/2);
  rotateX(mouseX*0.01);
  rotateY(mouseY*0.01);
  for(NodoC n:nodosc){
    n.mover();
  }
  for(NodoT n:nodost){
    n.mover();
  }
  int np = modelo.getChildCount();
  for(int i = 0; i<np; i++){
    PShape ps = modelo.getChild(i);
    int nv = ps.getVertexCount();
    float rojo = 0;
    float verde = 0; 
    float azul = 0;
    for(int j = 0; j<nv; j++){
      PVector p = ps.getVertex(j);
      for(NodoC n:nodosc){
        float dist = p.dist(n.pos);
        if(dist < n.ra){
          float factor = map(dist,0,n.ra,1,0);
          rojo += n.r*factor;
          verde += n.g*factor;
          azul += n.b*factor;
        }
      }
    }
    fill(rojo,verde,azul);
    beginShape();
    for(int j = 0; j<nv; j++){
      PVector p = ps.getVertex(j);
      float acum = 0;
      for(NodoT n:nodost){
        float dist = p.dist(n.pos);
        if(dist<n.t){
          float factor = map(dist,0,n.t,n.f,0);
          acum+=factor;
        }
      }
      float tam = p.mag();
      tam+=acum;
      p.setMag(tam);
      vertex(p.x,p.y,p.z);
    }
    endShape();
  }  
}
