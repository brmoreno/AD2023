float x;
int y;
float t;
float r;
float g;
float b;

void setup(){
  size(400,400);
  x = 0;
  y = 200;
  t = 0;
  r = 0;
  g = 0;
  b = 0;
  background(255);
}

void draw(){
  r+=0.02;
  g+=0.04;
  b+=0.016;
  t+=0.003;
  float r2 =map(sin(r),-1,1,0,255);
  float g2 =map(sin(g),-1,1,0,255);
  float b2 =map(sin(b),-1,1,0,255);
  float t2 = map(sin(t),-1,1,0,400);
  noStroke();
  fill(r2,g2,b2);
  ellipse(x,y,t2,t2);
  x+=0.5;
  x%=400;
}
