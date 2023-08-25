float x = 0.01;
float y = 0;
float z = 0;
float a = 10;
float b = 28;
float c = 2.5;
float s;
void setup() {
  size(400, 400);
  background(0);
  s = 6;
}

void draw() {
 
  float dt = 0.01;
  float dx = (a * (y - x))*dt;
  float dy = (x * (b - z) - y)*dt;
  float dz = (x * y - c * z)*dt;
  x += dx;
  y += dy;
  z += dz;
  translate(width/2, height/2);
  noStroke();
  fill(255);
  ellipse(x*s,y*s,3,3);
}
