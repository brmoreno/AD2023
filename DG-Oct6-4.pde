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
      a[i] = random(50,100);
      amp+=a[i];
      v[i] = random(2);
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

Fourier x;
Fourier y;
int n;
int m;
ArrayList<PVector> pvs;
void setup(){ 
  n = 1000;
  m = 20;
  size(1000,500);
  x = new Fourier(20);
  y = new Fourier(20);
  
  pvs = new ArrayList<PVector>();
  
 for(int i = 0; i<n; i++){
      float px =  i+x.getVal(i*0.05);
      float py =  y.getVal(i*0.05); 
      pvs.add(new PVector(px,py));
  } 

  background(255);
  translate(0,height/2);
  
  for(int i = 0; i<n-1; i++){
   PVector centro  = new PVector(i,0);
   for(float j = 0; j<=1; j+=0.1){
     PVector a = pvs.get(i).copy();
     PVector b = pvs.get(i+1).copy();   
     PVector c = centro.copy().lerp(a,j);
     PVector d = centro.copy().lerp(b,j);
     PVector e = centro.copy().lerp(a,j+0.1);
     PVector f = centro.copy().lerp(b,j+0.1);
     stroke(0);
     strokeWeight(1);
     beginShape();
     vertex(c.x,c.y);
     vertex(e.x,e.y);
     
     vertex(f.x,f.y);
     vertex(d.x,d.y);
     endShape(CLOSE);
     
   }
  
  }
}
