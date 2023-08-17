//variable globales
int x[] = new int[100];
int y[] = new int[100];;
int t[] = new int[100];;
color c[] = new color[100];;
int dx[] = new int[100];;
int dy[] = new int[100];;



void setup(){
  size(550,550);
  for(int i = 0; i<100; i++){
  x[i] = round(random(width));
  y[i] = round(random(height));
  t[i] = round(random(50,100));
  dx[i] = round(random(-3,3));
  dy[i] =  round(random(-3,3));;
  c[i] = color(random(255),random(255),random(255));
  }
  background(255);
}


void draw(){
  background(255);
  noStroke();
  for(int i = 0; i<100; i++){
  fill(c[i]);
  ellipse(x[i],y[i],t[i],t[i]);
  x[i]+=dx[i];
  y[i]+=dy[i]; 
  if(x[i]>width-t[i]/2){
    dx[i] *= -1;
  }
  
  if(x[i]<0+t[i]/2){
    dx[i] *= -1;
  }
  if(y[i]>height-t[i]/2){
    dy[i]*=-1;
  }
  if(y[i]<0+t[i]/2){
    dy[i]*=-1;
  }
  }  
}
