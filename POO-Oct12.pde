class Boton{
   float x; 
   float y;
   float w;
   float h;
   boolean over;
   boolean pressed;
   
   Boton(float x_, float y_, float w_, float h_){
     x = x_;
     y = y_;
     w = w_;
     h = h_;
     over = false;
     pressed = false;
   }
   
   void display(){
     stroke(0);
     fill(255);
     rect(x,y,w,h);
   }
   
   void funcion(){
     if(mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+h){
       over = true;
       pressed = false;
       if(mousePressed){
         over = false;
         pressed = true;
       }
     }
     else{
       over = false;
       pressed = false; 
     }
   }
}

class BotonB extends Boton{
  
  BotonB(float x_, float y_, float w_, float h_){
    super(x_,y_,w_,h_);
  }
  
  void display(){
    funcion();
    fill(255);
    if(over){
      fill(0,0,255);
    }
    if(pressed){
      fill(0,255,0);
    }
    rect(x,y,w,h);
  }
}


Boton uno;
BotonB dos;
void setup(){
  size(500,500);
  uno = new Boton(200,200,100,50);
  dos = new BotonB(200,300,100,50);
}

void draw(){
  background(255);
  uno.display();
  uno.funcion();
  dos.display();
  println("over = " + uno.over + ", pressed = " + uno.pressed);
} 
