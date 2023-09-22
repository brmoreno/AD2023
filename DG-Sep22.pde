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
      a[i] = random(1/(n*10f),1/(n*0.5f));
      amp+=a[i];
      v[i] = random(0.1,0.75);
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


Fourier r;
Fourier g;
Fourier b;

void setup(){
  size(1000,500);
  r = new Fourier(50);
  g = new Fourier(50);
  b = new Fourier(50);
  background(255);
  for(int i = 0; i<width; i++){
    noStroke();
    float rojo = r.getVal(i*0.3);
    float verde = g.getVal(i*0.3);
    float azul = b.getVal(i*0.3);
    
    float rf = map(rojo,-r.amp*0.5,r.amp*0.5,0,255);
    float gf = map(verde,-g.amp*0.5,g.amp*0.5,0,255);
    float bf = map(azul,-b.amp*0.5,b.amp*0.5,0,255);
    fill(rf,gf,bf);
    rect(i,0,1,width);
  }
}
