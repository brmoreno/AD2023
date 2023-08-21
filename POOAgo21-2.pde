float r;
int px;
int py;
float r2;
void setup(){
  size(400,400);
  px = 300;
  py = 300;
}

void draw(){
  r+= 0.01;
  background(255);
  koala(mouseX,mouseY,1,r);
  koala(px,py,0.5,r2);
  //if(mousePressed){
  //  r2 = random(6.28);
  //}
}

void koala(int x_, int y_, float scale_, float r_){
  pushMatrix();
  translate(x_, y_);
  rotate(r_);
  scale(scale_);
  translate(-200,-200);  
  fill(20);
  ellipse(200,200,200,200);
  ellipse(120,120,100,100);
  ellipse(400-120,120,100,100);
  fill(255,150,150);
  ellipse(120,120,50,50);
  ellipse(400-120,120,50,50); 
  fill(180);
  ellipse(200,250,100,100);
  fill(255,150,150);
  ellipse(200,200,50,50);
  fill(#215767);
  ellipse(250,200,30,30);
  ellipse(150,200,30,30);
  popMatrix();
}

void keyPressed(){
  switch(key){
    case 'a':
      px--;
    break;
    case 'd':
      px++;
    break;
    case 'w':
      py--;
    break;
    case 's':
     py++;
    break;
    
  }
}

void mousePressed(){
  r2 = random(6.28);
}
