PVector p;
PVector pos[];
int n = 5000;

void setup(){
  size(500,500);
  background(255);
  p = new PVector(0,0);
  pos = new PVector[n];
  for(int i = 0; i<n; i++){
    pos[i] = p.copy();
    PVector v = PVector.random2D();
    p.add(v);    
  }
}

float escala = 1;
float rota = 0;

void draw(){
 background(255);
 PVector posT[] = new PVector[n];
 for(int i = 0; i< pos.length; i++){
   posT[i] = pos[i].copy();
   posT[i].rotate(rota);
   posT[i].mult(escala);
   posT[i].add(new PVector(mouseX,mouseY));
   
 }
 
 for(int i = 1; i<n; i++){
   
   noStroke();
   fill(255,0,0,10);
   ellipse(posT[i].x,posT[i].y,30,30);
   //stroke(0);
   //strokeWeight(0.5);
   //line(posT[i].x,posT[i].y,posT[i-1].x,posT[i-1].y);
 }  
}

void keyPressed(){
  switch(key){
    case 'a':
    escala+=0.1;
    break;
    case 's':
    escala-=0.1;
    break;
    case 'z':
    rota+=0.1;
    break;
    case 'x':
    rota-=0.1;
    break;
    
  }
}
