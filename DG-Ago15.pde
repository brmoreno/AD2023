class Particula{  
  PVector pos;
  PVector v;
  float dr;
  float t;
  float r;
  float g;
  float b;
  
  Particula(){
    pos = PVector.random2D().setMag(random(300));
    dr = random(-0.01,0.01);
    v = PVector.random2D();
    t = random(50,200);
    r = random(-50,150);
    g = random(-50,150);
    b = random(-50,150);
  }
  
  void display(){
    
    miCirculo(round(pos.x)+width/2,round(pos.y)+height/2,round(t),round(r),round(g),round(b));
  }
  
  void mover(){
    pos.rotate(dr);
  }
  
  void miCirculo(int x_, int y_, int t_, int r_,int g_, int b_){  
  if(pixels == null){
    loadPixels();
  }
  for(int i = x_-t_/2 < 0? 0:x_-t_/2; i<x_+t_/2 && i<width;i++ ){
    for(int j = y_-t_/2 <0? 0: y_-t_/2; j<y_+t_/2 && j<height;j++){
      float distancia = dist(x_,y_,i,j);
      if(distancia<t_/2){
        color original = pixels[i+j*width];
        int r = (original >> 16) & 0xFF;
        int g = (original >> 8) & 0xFF;
        int b = original & 0xFF;
        float factor = map(distancia,0,t_/2,1,0);
        r += r_*factor;
        g += g_*factor;
        b += b_*factor;
        pixels[i+j*width] = color(r,g,b);
      }
    }
  } 
 updatePixels();
}
}

ArrayList <Particula> particulas;
PImage gato;
void setup(){
  size(450,450);
  particulas = new ArrayList <Particula> ();
  gato = loadImage("gatocubrebocas.png");
  for(int i = 0; i<100; i++){
    particulas.add(new Particula());
  }
}

void draw(){
   
   loadPixels();
   for(int i = 0; i<pixels.length; i++){
     pixels[i] = gato.pixels[i];
   }
  
  for(Particula p:particulas){
    p.mover();
    p.display();
  }
  
  updatePixels();
}
