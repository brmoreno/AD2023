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
      v[i] = random(1);
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


PGraphics pg;
Fourier f;

void setup(){
  size(500,500);
  f = new Fourier(10);
  pg = createGraphics(200, 200);
  pg.beginDraw();
  pg.textSize(200);
  pg.fill(0);
  pg.textAlign(CENTER,CENTER);
  pg.text("A",100,100);
  pg.endDraw();
  
  
  background(255);
  loadPixels();
  int x = 100;
  int y = 100;
  for(int i = x; i<x+pg.width;i++){
    for(int j = y; j<y+pg.height;j++){
      int delta = round(f.getVal(j*0.2));
      pixels[i+delta+j*width] = pg.get(i-x,j-y);
    }
  }
  updatePixels();
}
