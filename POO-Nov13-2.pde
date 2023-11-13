class Cubo{
  float t;
  PVector pos;
  PVector rot;
  color c;
  
  Cubo(float x_, float y_, float t_){
    t = t_;
    pos = new PVector(x_,y_,0);
    rot = new PVector();
    c = color (random(255),random(255),random(255));
  }
  
  void display(){
    pushMatrix();
    noStroke();
    fill(c);
    translate(pos.x,pos.y,pos.z);
    rotateX(rot.x);
    rotateY(rot.y);
    box(t);
    popMatrix();
  }
  
  void oleaje(){
    pos.z = sin(delta+pos.y*0.01 + pos.x*0.01 )*100;
  }
   
  void voltea(){
    float dx = pos.x - mouseX;
    float dy = pos.y - mouseY;
    rot = new PVector(dx,dy).normalize();
  }
}

ArrayList <Cubo> cubos;

float delta; 
void setup(){
  size(500,500,P3D);
  background(0);
  cubos = new ArrayList <Cubo> ();
  for(int i = 0; i<width; i+=20){
    for(int j = 0; j<height; j+=20){
      cubos.add(new Cubo(i,j,20));
    }
  }
}

void draw(){
  delta+=0.05;
  lights();
  background(0);
  for(Cubo c:cubos){
    c.display();
    c.oleaje();
    c.voltea();
  }
}
