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

  void killBody() {
    box2d.destroyBody(body);
  }
  
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
    strokeWeight(1);
    beginShape();
   for(int i = 0; i<parts.size(); i++){
     Vec2 pos = box2d.getBodyPixelCoord(parts.get(i).body);
     vertex(pos.x,pos.y);
   }
   endShape();
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
import geomerative.*;

// Declare the objects we are going to use, so that they are accesible from setup() and from draw()
RFont f;
RShape grp;
RPoint[] points;
Box2DProcessing box2d;

ArrayList <Forma> formas;
Boundary bd;
void setup(){
  // Initilaize the sketch
  size(600,400);
  frameRate(24);
  formas = new ArrayList <Forma>();
  // Choice of colors
  background(255);
  fill(255,102,0);
  stroke(0);
  
  // VERY IMPORTANT: Allways initialize the library in the setup
  RG.init(this);
  
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER

  // Enable smoothing
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  bd = new Boundary(width/2,height,width,30);
  
}

void draw(){
  box2d.step();
  background(255);
  noFill();
   
  for(Forma f:formas){
    f.display();
  }
}

void keyPressed(){
  construyeLetra();
}

void construyeLetra(){
  grp = RG.getText("H", "FreeSans.ttf", 200, CENTER);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(10);
  points = grp.getPoints();
  PVector pos [] = new PVector[points.length];
  for(int i=0; i<points.length; i++){
    pos[i] = new PVector(points[i].x+mouseX, points[i].y+mouseY);  
  }
  formas.add(new Forma(pos));
}
