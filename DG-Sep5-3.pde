float l = 3;
int ints = 15;

void setup() {
  size(700, 600);
  background(0, 0, 255);
  translate(width/2, height/2);
  stroke(255);
  turn_left(l, ints);
  turn_right(l, ints);
}

void turn_right(float l, int ints) {
  l = random(2,10);
  if (ints == 0) {
    line(0, 0, 0, -l);
    translate(0, -l);
  } else {
    turn_left(l, ints-1);
    rotate(radians(random(80,100)));
    turn_right(l, ints-1);
  }
}

void turn_left(float l, int ints) {
  l = random(2,10);
  if (ints == 0) {
    line(0, 0, 0, -l);
    translate(0, -l);
  } else {
    turn_left(l, ints-1);
    rotate(radians(-random(80,100)));
    turn_right(l, ints-1);
  }
}
