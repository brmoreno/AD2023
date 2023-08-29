float largoP1 = 100;
float largoP2 = 100; 
float masa1 = 20; 
float masa2 = 20; 
float a1 = -HALF_PI; 
float a2 = -HALF_PI; 
float va1 = 0; 
float va2 = 0; 
float g = 1; 
float cx, cy; 

void setup() {
  size(450, 400); 
  cx = width/2;
  cy = 100;
}

void draw() {
  background(255);
  fill(0);
  float n1 = -g * (2 * masa1 + masa2) * sin(a1);
  float n2 = -masa2 * g * sin(a1-2*a2);
  float n3 = -2*sin(a1-a2)*masa2;
  float n4 = va2*va2*largoP2+va1*va1*largoP1*cos(a1-a2);
  float n5 = largoP1 * (2*masa1+masa2-masa2*cos(2*a1-2*a2));
  float na1 = (n1 + n2 + n3*n4) / n5;

  n1 = 2 * sin(a1-a2);
  n2 = (va1*va1*largoP1*(masa1+masa2));
  n3 = g * (masa1 + masa2) * cos(a1);
  n4 = va2*va2*largoP2*masa2*cos(a1-a2);
  n5 = largoP2 * (2*masa1+masa2-masa2*cos(2*a1-2*a2));
  float na2 = (n1*(n2+n3+n4)) / n5;
  float x1 = cx+largoP1 * sin(a1);
  float y1 = cy+largoP1 * cos(a1);
  float x2 = x1 + largoP2 * sin(a2);
  float y2 = y1 + largoP2 * cos(a2);
  line(cx, cy, x1, y1);
  ellipse(x1, y1, masa1, masa1);
  line(x1, y1, x2, y2);
  ellipse(x2, y2, masa2, masa2);
  va1 += na1;
  va2 += na2;
  a1 += va1;
  a2 += va2;
}
