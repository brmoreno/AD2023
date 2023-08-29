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

void setup() {
  size(1000, 500); 
  background(255);
  noStroke();
  fill(255,0,0);
  for(int i = 0; i<20; i++){
    uno = new PenduloDoble(1000,0,0,0,i*0.1,i*0.5,0);  
    for(int j = 1; j<1000; j++){
      PVector inicial = uno.p2.get(j).copy();
      inicial.mult(0.1);
      ellipse(j,inicial.y+(height/20)*i,4,4);
    }
  }
}
