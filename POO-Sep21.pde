class Letra{
  
  float x,y,r,dx,dy;
  int comportamiento;
  color c;
  char l; 
  int fuente;
  
  Letra(char l_,float x_, float y_,float r_,int comp_){
    x = x_;
    y = y_;
    r = r_;
    comportamiento = comp_;
    float dir = random(TWO_PI);
    dx = cos(dir);
    dy = sin(dir);
    c = color(random(255),0,0);
    l = l_;
    fuente = floor(random(30));
  }
  
  void display(){
    fill(c);
    textFont(fuentes.get(fuente));
    textSize(r*2);
    textAlign(CENTER,CENTER);
    text(l,x,y);
  }
  
  void mover(){
    switch(comportamiento){
      case 0:
        estatico();
      break;
      case 1:
        erratico();
      break;
      case 2:
        constante();
      break;
    }
  }
  
  void estatico(){
  }
  
  void erratico(){
    x+= random(-3,3);
    y+= random(-3,3);
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  
  void constante(){
    //por determinar
    x+= dx;
    y+= dy;
    if(x<r){
    dx = abs(dx);
    }
    if(x>width-r){
      dx = -abs(dx);
    }
    if(y<r){
      dy = abs(dy);
    }
    if(y>height-r){
      dy = -abs(dy);
    }
  }
}

ArrayList <Letra> letras;
ArrayList <PFont> fuentes;

void setup(){
  size(500,500);
  letras = new ArrayList <Letra>();
  fuentes = new ArrayList <PFont>();
  String [] lista = PFont.list();
  for(int i = 0; i<30; i++){
    PFont pf = createFont(lista[floor(random(lista.length))],20);
    fuentes.add(pf);  
}

}

void draw(){
  background(255);
  for(int i = 0; i<letras.size();i++){
    letras.get(i).display();
    letras.get(i).mover();
  }
}


void keyPressed(){
  Letra l = new Letra(key,mouseX,mouseY,random(20,40),floor(random(3)));
  letras.add(l);
}
