class Trazo{
  PVector pos;
  PVector dir;
  PVector t;
  color c;
  float dd;
  float dt;
  int paso; 
  int max;
  
  Trazo(int x_, int y_){
    pos = new PVector(x_,y_);
    dir = PVector.random2D();
    t = PVector.random2D().mult(random(5,25));
    c = gato.get(x_,y_);
    dd = random(-0.05,0.05);
    dt = random(-0.1,0.1);
    paso = 0;
    max = round(random(50,100));
  }
  
  void mover(){
    pos.add(dir);
    dir.rotate(dd);
    t.rotate(dt);
    color actual = gato.get(round(pos.x),round(pos.y));
    c = lerpColor(c,actual,0.2);
  }
  
  void display(){
    if(paso<max){
      strokeWeight(3);
      stroke(c);
      line(pos.x,pos.y,pos.x+t.x,pos.y+t.y);
    }
    paso++;
  }
}

PImage gato;
PImage gatoOriginal;
ArrayList <Trazo> trazos;


void setup(){
  size(450,450);
  gato = loadImage("gatocubrebocas.png");
  gatoOriginal = gato.copy();
  trazos = new ArrayList <Trazo>();
  background(255);
  for(int i = 0; i<700; i++){
    trazos.add(new Trazo(round(random(width)),round(random(height))));
  }
}

//void draw(){
//  background(255);
//  image(gato,0,0,mouseX,mouseY);  
//}


//void draw(){
 
//  gato = gatoOriginal.copy();
//  gato.filter(THRESHOLD,random(1));
//  color fondo = color(random(255),random(255),random(255));
//  color fondo2 = color(random(255),random(255),random(255));
//  for(int i = 0; i<gato.width; i++){
//    for(int j = 0; j<gato.height; j++){
//      color c = gato.get(i,j);
//      if(c == color(0)){
//        gato.set(i,j, fondo);
//      }
//      else{
//        gato.set(i,j,fondo2);
//      }
//    }
//  }
//  image(gato,0,0,450,450);
//}

//void draw(){
//  gato = gatoOriginal.copy();
//  gato.filter(BLUR,2+round(mouseX/10));
//  image(gato,0,0);
  
//}

//void keyPressed(){
//  gato.save("gatoborroso.png");
//}


void draw(){
  for(Trazo t:trazos){
    t.mover();
    t.display();
  }
}

void mousePressed(){
  trazos.add(new Trazo(mouseX,mouseY));
}
