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
  size(1000,500);
  lorenz = new Lorenz(6000);
}

float r;
void draw(){
  background(0);
  pos = new PVector[lorenz.n];
  float factEscala = 500/lorenz.magMax;
  for(int i = 0; i<lorenz.n;i++){
    pos[i] = lorenz.pvs.get(i).copy();
    pos[i].mult(factEscala);
    //pos[i].x*=i*0.001;
    //pos[i].add(new PVector(width/2,height/2));
    pos[i].add(new PVector((i*0.15), height/2));
  }
  
  for(int i= 0; i<pos.length-2; i++){
    noStroke();
    stroke(255);
    strokeWeight(2);
    noFill();
    PVector a = pos[i];
    PVector b = pos[i+1];
    PVector c = pos[i+2];
    PVector a1 = PVector.lerp(a,b,0.5);
    PVector a2 = PVector.lerp(b,c,0.5);
    bezier(a1.x,a1.y,b.x,b.y,b.x,b.y,a2.x,a2.y);
  }
}
