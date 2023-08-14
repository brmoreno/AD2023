//variable globales
int x;
int y;
int t;
color c;
int dx;
int dy;
color c2;
void setup(){
  size(550,550);
  x = width/2;
  y = height/2;
  t = 80;
  dx = 3;
  dy = 2;
  c = color(255,0,0);
  background(255);
  c2 = color(0,0,255);
  //frameRate(10);
}


void draw(){
  background(255);
  noStroke();
  fill(c);
  ellipse(x,y,t,t);
  //x+= dx;
  //y+=dy;
  
  fill(c2);
  ellipse(mouseX,mouseY,t,t);
  
  if(mousePressed == true){
    c2 = color(random(255),random(255),random(255));
  }
  
  if(keyPressed){
    if(key == 'd'){
      x++;
    }
    if(key == 'a'){
      x--;
    }
  }
  
  if(x>width-t/2){
    dx *= -1;
  }
  
  if(x<0+t/2){
    dx *= -1;
  }
  if(y>height-t/2){
    dy*=-1;
  }
  if(y<0+t/2){
    dy*=-1;
  }
}
