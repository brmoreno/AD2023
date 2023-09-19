class Epi{
  float f[];
  float a[];
  float v[];
  int n;
  
  Epi(int n_){
    n = n_;
    f = new float[n];
    a = new float[n];
    v = new float[n];
    for(int i = 0; i<n;i++){
      f[i] = random(TWO_PI); 
      a[i] = random(50,100);
      v[i] = random(-0.1,0.1);
    }
  }
  
  void mover(){
    for(int i = 0; i<n; i++){
      f[i]+= v[i];
    }
  }
  
  PVector getPos(int m_){
    PVector pos = new PVector(0,0);
    for(int i = 0; i<m_; i++){
      float x = sin(f[i])*a[i];
      float y = cos(f[i])*a[i];
      pos.x+=x;
      pos.y+=y;
    }
    return(pos);
  }
  
}

Epi epi;

void setup(){
  size(600,600);
  epi = new Epi(6);
  background(255);
}

float px;
void draw(){
  px+=0.5;
  translate(px,height/2);
  epi.mover();
  fill(0,50);
  strokeWeight(0.4);
  for(int i = 0; i<5; i++){
    PVector a = epi.getPos(i);
    PVector b = epi.getPos(i+1);
    line(a.x,a.y,b.x,b.y);
  }
  
}
