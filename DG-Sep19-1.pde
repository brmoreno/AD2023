PVector epi;
PVector epi2;
PVector epi3;
PGraphics fondo;
float pos[] = new float[500];

void setup(){
  size(500,500);
  epi = new PVector(150,0);
  epi2 = new PVector(50,0);
  epi3 = new PVector(25,0);
  fondo = createGraphics(500,500);
  fondo.beginDraw();
  fondo.background(255);
  fondo.endDraw();
}

void draw(){
  image(fondo,0,0);
  translate(width/2,height/2);
  noFill();
  ellipse(0,0,300,300);
  ellipse(epi.x,epi.y,3,3);
  epi.rotate(0.01);
  epi2.rotate(0.04);
  epi3.rotate(0.08);
  ellipse(epi.x,epi.y,100,100);
  line(0,0,epi.x,epi.y);
  line(0,0,epi.x,0);
  line(epi.x,epi.y,epi.x,0);
  pos[499] = epi.y;
  for(int i = 0; i<499;i++){
   pos[i] = pos[i+1];
  }
  line(epi.x,epi.y,150,epi.y);
  ellipse(epi.x+epi2.x,epi.y+epi2.y,50,50);
  translate(150,0);
  for(int i = 0; i<500; i++){
    ellipse(500-i,pos[i],3,3);
  }
  fondo.beginDraw();
  fondo.translate(width/2,height/2);
  fondo.noStroke();
  fondo.fill(255,0,0);
  fondo.ellipse(epi.x+epi2.x+epi3.x,epi.y+epi2.y+epi3.y,5,5);
  fondo.endDraw();
}
