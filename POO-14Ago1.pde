//variable globales
int x;
int y;
int t;
color c;
int dx;

void setup(){
  size(550,550);
  x = width/2;
  y = height/2;
  t = 80;
  dx = 3;
  c = color(255,0,0);
  background(255);
  //frameRate(10);
}


void draw(){
  background(255);
  noStroke();
  fill(c);
  ellipse(x,y,t,t);
  x+= dx;
  if(x>width-t/2){
    dx *= -1;
  }
  if(x<0+t/2){
    dx *= -1;
  }
}
