class Nodo{
  PVector pos;
  float r;
  float f;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    r = random(30,100);
    f = random(-1,1);
  }
  
  Nodo(PVector pos_, float r_, float f_){
    pos = pos_;
    r = r_;
    f = f_;
  }
  
  void display(){
    noStroke();
    fill(0,0,255,50);
    ellipse(pos.x,pos.y,r*2,r*2);
    stroke(255,0,0);
  }
  
}

float[][] mapa = new float[500][500];
ArrayList <Nodo> nodos;
float max = 0;
float min = 1000;
void setup(){
  size(500,500);
  nodos = new ArrayList <Nodo>();
  for(int i = 0 ; i<100; i++){
    nodos. add(new Nodo());
  }
  
  for(int i = 0; i<width; i++){
    for(int j = 0; j<height; j++){
      for(int k = 0; k<nodos.size(); k++){
        Nodo n = nodos.get(k);
        float dist = dist(i,j,n.pos.x,n.pos.y);
        if(dist < n.r){
          float factor = map(dist,0,n.r,1,0)*n.r;
          mapa[i][j]+=factor;
        }
      }
      if(mapa[i][j]>max){
        max = mapa[i][j];
      }
      if(mapa[i][j]<min){
        min = mapa[i][j];
      }
    }
  }
  
  
  loadPixels();
  for(int i = 0; i<pixels.length; i++){
    int x = i%width;
    int y = i/width;
    float f = mapa[x][y];
    float fn = map(f,min,max,0,TWO_PI*10);
    color c = color(sin(fn)*127+127);
    pixels[i] = c;
  }
  updatePixels();
}
