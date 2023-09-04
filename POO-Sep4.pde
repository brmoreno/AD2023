class Jugador {
  float x, y;
  color c;
  float r;
  float v;
  float a;
  
  Jugador(float v_){
    x = width/2;
    y = height/2;
    r = 30;
    v = v_;
    a = 0;
    c = color(255,0,0);
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(x,y,r*2,r*2);
  }
  
  void mover(){
    float dx = cos(a)*v;
    float dy = sin(a)*v;
    x+=dx;
    y+=dy;
    if(keyPressed){
      if(key == 'a'){
        a+=-0.1;
      }
      if(key == 'd'){
        a+= 0.1;
      }
    }
    x = constrain(x,r,width-r);
    y = constrain(y,r,height-r);
  }
  
  void captura(){
  }
  
  void colision(){
  }
  
}

class Item {
  float x,y;
  float r;
  color c;
  
  Item(float x_, float y_){
    x = x_;
    y = y_;
    r = 10;
    c = color(255,255,0);
  }
  
  
  void display(){
  }
  
  
  
}


class Enemigo {
  float x,y;
  float r;
  color c;
  int comp; //0 = estático, 1 = aleatorio,  2 = constante ;
  
  Enemigo(float x_, float y_, float r_, int comp_){
    x = x_;
    y = y_;
    r = r_;
    comp = comp_;
    c = color(0,0,255);
  }
  
  
  void mover(){
  }
  
  void display(){
  }
}

Jugador elJugador;

void setup(){
  size(500,500);
  elJugador = new Jugador(2);
}

void draw(){
  background(255);
  elJugador.display();
  elJugador.mover();
}
