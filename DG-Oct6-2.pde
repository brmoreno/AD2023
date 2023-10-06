class Tartan{
  float fase;
  float freq;
  float val; 
  float lim;
  int c;
  
  Tartan(){
    fase = random(TWO_PI);
    freq = random(0.01,0.1);
    lim = random(1);
    val = random(0,70);
    c = floor(random(3));
  }
  
  float getVal(int p_){
    float v1 = 0; 
    float v2 = sin(fase + freq*p_);
    if(v2>lim){
      v1 = val;
    }
    return v1;
  }
}

ArrayList <Tartan> v;
ArrayList <Tartan> h;
int n = 20;

void setup(){
  size(800,800);
  v = new ArrayList <Tartan>();
  h = new ArrayList <Tartan>();
  for(int i = 0; i<n; i++){
    v.add(new Tartan());
    h.add(new Tartan());
  }

  background(0);
  loadPixels();
  for(int i = 0; i<width;i++){
    for(int j = 0; j<height; j++){
      color a = pixels[i+j*width];
      float r = red(a);
      float g = green(a);
      float b = blue(a);
      for(int k = 0; k<n; k++){
        if(v.get(k).c == 0){
          r+= v.get(k).getVal(i);
        }
        if(v.get(k).c == 1){
          g+= v.get(k).getVal(i);
        }
        if(v.get(k).c == 2){
          b+= v.get(k).getVal(i);
        }
      }
      
      for(int k = 0; k<n; k++){
        if(h.get(k).c == 0){
          r+= h.get(k).getVal(j);
        }
        if(h.get(k).c == 1){
          g+= h.get(k).getVal(j);
        }
        if(h.get(k).c == 2){
          b+= h.get(k).getVal(j);
        }
      }
    pixels[i+j*width] = color(r,g,b);
    }
  }
  updatePixels();
}
