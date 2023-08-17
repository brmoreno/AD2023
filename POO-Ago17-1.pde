float z;
float y;
void setup(){
  size(500,500);
  background(255);
  
}

void draw(){
  noFill();
  noStroke();
  z+=0.01;
  y+=0.02;
  for(int i = 0;i<width;i+= 10){
    for(int j = 0; j<height; j+=10){
      float r = noise(i*0.01+y,j*0.01,z)*255;
      float g = noise(i*0.01+y,j*0.01 +6,z+2)*255;
      float b = noise(i*0.01+y,j*0.01 +9,z+5)*255;; 
      fill(r,g,b);
      rect(i,j,20,20);
    }
  } 
}
