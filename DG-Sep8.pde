class PenduloDoble{
  float largoP1 = 100;
  float largoP2 = 100; 
  float masa1 = 20; 
  float masa2 = 20; 
  float a1 = -HALF_PI; 
  float a2 = -HALF_PI; 
  float va1 = 0; 
  float va2 = 0; 
  float g = 1; 
  float cx = 0, cy = 0;
  ArrayList <PVector> p1;
  ArrayList <PVector> p2;
  
  PenduloDoble(int n_, float a_, float b_, float c_,float d_, float e_, float f_){
    largoP1+=a_;
    largoP2+=b_;
    masa1+=c_;
    masa2+=d_;
    a1+=e_;
    a2+=f_;
    p1 = new ArrayList <PVector>();
    p2 = new ArrayList <PVector>();
    for(int i = 0; i<n_; i++){
      avanza();
    }
  }
  
  void avanza(){
    float n1 = -g * (2 * masa1 + masa2) * sin(a1);
    float n2 = -masa2 * g * sin(a1-2*a2);
    float n3 = -2*sin(a1-a2)*masa2;
    float n4 = va2*va2*largoP2+va1*va1*largoP1*cos(a1-a2);
    float n5 = largoP1 * (2*masa1+masa2-masa2*cos(2*a1-2*a2));
    float na1 = (n1 + n2 + n3*n4) / n5;

    n1 = 2 * sin(a1-a2);
    n2 = (va1*va1*largoP1*(masa1+masa2));
    n3 = g * (masa1 + masa2) * cos(a1);
    n4 = va2*va2*largoP2*masa2*cos(a1-a2);
    n5 = largoP2 * (2*masa1+masa2-masa2*cos(2*a1-2*a2));
    float na2 = (n1*(n2+n3+n4)) / n5;
    float x1 = cx+largoP1 * sin(a1);
    float y1 = cy+largoP1 * cos(a1);
    float x2 = x1 + largoP2 * sin(a2);
    float y2 = y1 + largoP2 * cos(a2);
    va1 += na1;
    va2 += na2;
    a1 += va1;
    a2 += va2;
    p1.add(new PVector(x1,y1));
    p2.add(new PVector(x2,y2));
  }  
}



PenduloDoble uno; 

PVector pos [];
void setup(){
  size(500,500,P3D);
  uno = new PenduloDoble(2000,0,0,0,0,0,0);
}

float r;
void draw(){
  background(0);
  translate(mouseX,mouseY);
  r+=0.01;
  rotateX(r);
  pos = new PVector[uno.p2.size()];
  float factEscala = 1;
  for(int i = 0; i<uno.p2.size();i++){
    PVector p = uno.p2.get(i);
    pos[i] = new PVector(p.z,p.y,p.x);
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
