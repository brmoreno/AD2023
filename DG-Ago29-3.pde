class Particula{
  PVector p;
  PVector v;
  
  Particula(float x_, float y_){
    p = new PVector(x_, y_);
  }
  
  void display(){
    noStroke();
    fill (0);
    ellipse(p.x,p.y,2,2);
  }
  
  void mover(){
    float angulo = noise(p.x*vpx,p.y*vpy)*TWO_PI;
    v = PVector.fromAngle(angulo);
    p.add(v);
  }
}


int t = 10;
float vpx = 0.01;
float vpy = 0.01;
float z;
float dx = 0;
float dy = 0;

ArrayList <Particula> particulas; 
void setup(){
  size(500,500);
  particulas = new ArrayList <Particula>();
  for(int i = 0; i<width; i+=t){
    for(int j = 0; j<height; j+=t){
      particulas.add(new Particula (i,j));
    }
  }
  background(255);
}

void draw(){
  for(Particula p:particulas){
    p.display();
    p.mover();
  }
  
}

void keyPressed(){
  switch(key){
    case 'q': 
      t++;
    break;
    case 'w':
      t--;
    break;
    
    case 'a': 
      vpx+=0.001;
    break;
    case 's':
      vpx-=0.001;
    break;
    
    case 'z': 
      vpy+=0.001;
    break;
    case 'x':
      vpy-=0.001;
    break;
    
    case 'e': 
      z+=0.01;
    break;
    case 'r':
      z-=0.01;
    break;
    
    case 'd': 
      dx+=0.01;
    break;
    case 'f':
      dx-=0.01;
    break;
    
    case 'c': 
      dy+=0.01;
    break;
    case 'v':
      dy-=0.01;
    break;
    
  }
}
