class Nodo{
  PVector pos;
  float r;
  int a;
  
  Nodo(){
    pos = new PVector(random(width), random(height));
    r = random(50,100);
    a = floor(2); 
  }
}


class Agente{
  PVector pos;
  color actual;
  int t;
  int ta;
  float tamMax;
  float tamMin;
  color ran;
  Agente(float x_, float y_, int t_){
    pos = new PVector(x_,y_);
    ran = color(random(255),random(255),random(255));
    actual = gato.get(round(pos.x),round(pos.y));
    t = t_;
    tamMax = random(10,30);
    tamMin = random(0,5);
  }
  
  void display(){
    if(ta < t){
      noStroke();
      color c = gato.get(round(pos.x),round(pos.y));
      actual = lerpColor(actual,c,0.1);
      
      fill(lerpColor(actual,ran,0.3));
      float tam = map(ta,0,t,tamMax,tamMin);
      ellipse(pos.x,pos.y,tam,tam);
    }
  }
  
  void mover(ArrayList <Nodo> nodos){
    PVector acum = new PVector(0,0);
    for(Nodo n:nodos){
      float dist = pos.dist(n.pos);     
      if(dist < n.r){
        PVector dir = pos.copy();
        dir.sub(n.pos);
        dir.normalize();
        if(n.a == 0){
          dir.rotate(HALF_PI);
        }
        else{
          dir.rotate(-HALF_PI);
        }
        acum.add(dir);
      }
    }
    acum.normalize();
    pos.add(acum);
    ta++;
  }
}


PImage gato;
ArrayList <Nodo> nodos;
ArrayList <Agente> agentes;
IntList orden;
void setup(){
  size(450,450);
  nodos = new ArrayList <Nodo>();
  agentes = new ArrayList <Agente>();
  orden = new IntList();
  gato = loadImage("gatocubrebocas.png");
  for(int i = 0; i<100; i++){
    nodos.add(new Nodo());
  }
  int k = 0;
  for(int i = 0; i<width; i+=15){
    for(int j = 0; j<height; j+=15){
      agentes.add(new Agente(i+random(-20,20),j+random(-20,20),round(random(10,90))));
      orden.append(k);
      k++;
    }
  }
  orden.shuffle();
  background(255);
  for(int i = 0; i<agentes.size();i++){
    Agente a = agentes.get(orden.get(i));
    for(int j = 0; j<a.t;j++){
      a.display();
      a.mover(nodos);
    }
  }  
}
