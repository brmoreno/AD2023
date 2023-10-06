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
      a[i] = random(20,70);
      amp+=a[i];
      v[i] = random(2);
      if(random(1)<0.5){
        v[i]*=-1;
      }
    }    
  } 
  
  float getVal(float v_, int n_){
    float val = 0;
    for(int i = 0; i<n_; i++){
      val+= sin(f[i]+v[i]*v_)*a[i];
    }  
    return val;
  }  
}

Fourier x;
Fourier y;
Fourier z;
int n;
ArrayList <ArrayList<PVector>> pvs;
void setup(){ 
  size(500,500, P3D);
  x = new Fourier(10);
  y = new Fourier(10);
  z = new Fourier(10);
  n = 100;
  pvs = new ArrayList <ArrayList<PVector>>();
  for(int j = 0; j<11; j++){
    ArrayList <PVector> pvn = new ArrayList <PVector>();   
    for(int i = 0; i<n; i++){
      float px =  x.getVal(i*0.1,j);
      float py =  y.getVal(i*0.1,j); 
      float pz =  z.getVal(i*0.1,j);
      pvn.add(new PVector(px,py,pz));
    }
    pvs.add(pvn);
  } 
}

void draw(){
    lights();
  translate(width/2,height/2);
  rotateX(mouseX*0.1);
  rotateY(mouseY*0.1);
  background(255);
  fill(255,0,0);
  //noStroke();
  for(int i = 1; i<9; i++){
    for(int j = 0; j<n-1; j++){
      PVector a =pvs.get(i).get(j);
      PVector b =pvs.get(i+1).get(j);
      PVector c =pvs.get(i).get(j+1);
      PVector d =pvs.get(i+1).get(j+1);
      beginShape();
      vertex(a.x,a.y,a.z);
      
      vertex(c.x,c.y,c.z);
      
      vertex(d.x,d.y,d.z);
      vertex(b.x,b.y,b.z);
      endShape();
    }
  }
}
