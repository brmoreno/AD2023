class Particle {
  Body body;
  float r; 
  color col;

  Particle(float x, float y, float r_) {
    r = r_;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r); 
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 0.3;
    fd.friction = 0.3;
    fd.restitution = 1;    
    body.createFixture(fd);
    col = color(0);
    body.setFixedRotation(true);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }
  
  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(col);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    line(0,0,r,0);
    popMatrix();
  }
}

class Forma{
  ArrayList <Particle> parts;
  
  Forma(PVector pos[]){
    parts = new ArrayList<Particle>();
    for(int i = 0; i<pos.length;i++){
      PVector p = pos[i];
      parts.add(new Particle(p.x,p.y,3));
    }
    
    
   for(int i = 0; i<parts.size(); i++){
     for(int j = i+1; j<parts.size(); j++){
       DistanceJointDef djd = new DistanceJointDef();
       djd.bodyA = parts.get(i).body;
       djd.bodyB = parts.get(j).body;
       Vec2 posA = parts.get(i).body.getWorldCenter();
       Vec2 posB = parts.get(j).body.getWorldCenter();
       djd.length = dist(posA.x,posA.y,posB.x,posB.y);
       djd.frequencyHz = 10;
       djd.dampingRatio = 0;
       DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);       
     }
   }    
  }
  
  void display(){
    noFill();
    strokeWeight(5);
    beginShape();
   for(int i = 0; i<parts.size(); i++){
     Vec2 pos = box2d.getBodyPixelCoord(parts.get(i).body);
     vertex(pos.x,pos.y);
   }
   endShape();
 }
 
}

class Epi{
  float t[];
  float a[];
  float da[];
  int n;
  
  Epi(int n_, int min_, int max_ ){
    n = n_;
    t = new float [n];
    a = new float [n];
    da = new float [n];
    for(int i = 0; i<n; i++){
      t[i] = random(min_, max_);
      a[i] = random(TWO_PI);
      da[i] = random(-0.1,0.1);
    }
    
  }
  
  void rota(){
    for(int i = 0; i<n; i++){
      a[i] += da[i];
    }
  }
  
  
  float px(){
    float x = 0;
    for(int i = 0; i<n; i++){
      x+= cos(a[i])*t[i];
    }
    return x;
  }
  
  float py(){
    float y = 0;
    for(int i = 0; i<n; i++){
      y+= sin(a[i])*t[i];
    }
    return y;
  }
  
  float px(int pos_){
    float x = 0;
    for(int i = 0; i<pos_; i++){
      x+= cos(a[i])*t[i];
    }
    return x;
  }
  
  float py(int pos_){
    float y = 0;
    for(int i = 0; i<pos_; i++){
      y+= sin(a[i])*t[i];
    }
    return y;
  }
}

class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  
  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }

}

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Epi uno;

ArrayList <Forma> formas;
Forma una;
Boundary bd;

void setup() {
  uno = new Epi (10,5,20);
  formas  = new ArrayList <Forma>();
  size(640,360);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  PVector pvs[] = new PVector [100];
  
  for(int i = 0; i<100; i++){
    uno.rota();
    
    pvs[i] = new PVector((width/2)+uno.px(),(height/2)+uno.py());
  }
  
  
  una = new Forma(pvs);
  bd = new Boundary(width/2,height,width,30);
}

void draw(){
  background(255);
  box2d.step();
  bd.display();
  una.display();
  for(Forma f:formas){
    f.display();
  }
}

void mousePressed(){
  
  PVector pvs[] = new PVector [100];
  
  for(int i = 0; i<100; i++){
    uno.rota();
    uno.rota();
    pvs[i] = new PVector((mouseX)+uno.px(),(mouseY)+uno.py());
  }
  
  
 formas.add(new Forma(pvs));
  
}
