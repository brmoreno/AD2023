class Lorenz{
  float x = 0.01;
  float y = 0;
  float z = 0;
  float a = 10;
  float b = 28;
  float c = 2.5;
  ArrayList <PVector> pvs;
  int n;
  float magMax;
  
  Lorenz(int n_){
    pvs = new ArrayList <PVector>();
    for(int i = 0; i< n_; i++){
      PVector p = new PVector(x,y,z);
      pvs.add(p);
      float magAct = p.mag();
      if(magAct>magMax){
        magMax = magAct;
      }
      mover();
    } 
    n = n_;
    
  }
  
  void mover(){
    float dt = 0.01;
    float dx = (a * (y - x))*dt;
    float dy = (x * (b - z) - y)*dt;
    float dz = (x * y - c * z)*dt;
    x += dx;
    y += dy;
    z += dz;
  }
}

Lorenz lorenz;
PVector pos [];
void setup(){
  size(500,500,P3D);
  lorenz = new Lorenz(2000);
}

float r;
void draw(){
  background(0);
  translate(mouseX,mouseY);
  r+=0.01;
  rotateX(r);
  pos = new PVector[lorenz.n];
  float factEscala = 250/lorenz.magMax;
  for(int i = 0; i<lorenz.n;i++){
    pos[i] = new PVector(lorenz.pvs.get(i).z,lorenz.pvs.get(i).y,lorenz.pvs.get(i).x);;
    pos[i].mult(factEscala);
    pos[i].rotate(i*0.1);
    //pos[i].add(new PVector(mouseX,mouseY));
  }
  
  for(int i= 0; i<pos.length-1; i++){
    noStroke();
    stroke(255);
    PVector in = pos[i];
    PVector si = pos[i+1];
    strokeWeight(2);
    line(in.x,in.y,in.z,si.x,si.y,si.z);
    
  }
}
