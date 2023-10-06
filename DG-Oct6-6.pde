class Fourier{
  float [] f;
  float [] a;
  float [] v;
  int n;
  float amp;
  
  Fourier(int n_){
    n = n_;
    f = new float [n];
    a = new float [n];
    v = new float [n];
    for(int i = 0; i<n; i++){
      f[i] = random(TWO_PI);
      a[i] = random(1,3);
      amp+=a[i];
      v[i] = random(20);
      if(random(1)<0.5){
        v[i]*=-1;
      }
    }    
  } 
  
  float getVal(float v_){
    float val = 0;
    for(int i = 0; i<n; i++){
      val+= sin(f[i]+v[i]*v_)*a[i];
    }  
    return val;
  }  
}


float r = 10;
float t = 1;
float d = 30;

Fourier f;
Fourier g;

void setup(){
  f = new Fourier(10);
  g = new Fourier(10);
  size(500,500);
  background(255);
  fill(255);
  translate(width/2,height/2);
  float a = 0;
  float a2= 0;
  while(a<TWO_PI*5){
    float r2 = r + f.getVal(a2);
    float px = sin(a)*r+ f.getVal(a2);;
    float py = cos(a)*r+ g.getVal(a2);;
    ellipse(px,py,3,3);
    a+=t/r;
    r+=d/(TWO_PI*r)*t;
    a2+=0.005;
  }  
}
