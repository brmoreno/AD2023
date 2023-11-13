PShape mono;

void setup(){
  size(500,500,P3D);
  mono = loadShape("mono.obj");
}

void draw(){
  background(0);
  lights();
  pushMatrix();
  translate(width/2,height/2);
  rotateX(mouseX*0.1);
  rotateY(mouseY*0.1);
  scale(150);
  mono.disableStyle();
  int nCaras = mono.getChildCount();
  for(int i = 0; i<nCaras;i++){
    PShape cara = mono.getChild(i);
    fill(random(255),random(255),random(255));
    shape(cara,0,0);
  }
  

  
  popMatrix();
}
