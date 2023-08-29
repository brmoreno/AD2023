int t = 1;
float vpx = 0.02;
float vpy = 0.02;
float z;
float dx = 0;
float dy = 0;

void setup(){
  size(500,500);
}

void draw(){
  t = constrain(t,1,20);
  for(int i = 0; i<width; i+=t){
    for(int j = 0; j<height; j+=t){
      noStroke();
      float valorPerlin = noise(dx+i*vpx,dy+j*vpy,z);
      int vpi = round(valorPerlin*40);
      if(vpi%2==0){
        fill(0);
      }
      else{
        fill(255);
      }
      rect(i,j,t,t);
    }
  }
}

void keyPressed(){
  switch(key){
    case 'q': 
      t++;
    break;
    case 'w':
      t--;
    break;
    
    case 'a': 
      vpx+=0.001;
    break;
    case 's':
      vpx-=0.001;
    break;
    
    case 'z': 
      vpy+=0.001;
    break;
    case 'x':
      vpy-=0.001;
    break;
    
    case 'e': 
      z+=0.01;
    break;
    case 'r':
      z-=0.01;
    break;
    
    case 'd': 
      dx+=0.01;
    break;
    case 'f':
      dx-=0.01;
    break;
    
    case 'c': 
      dy+=0.01;
    break;
    case 'v':
      dy-=0.01;
    break;
    
  }
}
