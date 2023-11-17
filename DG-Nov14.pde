import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList <Caja> cajas;

void setup(){
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  size(500,500);
  cajas = new ArrayList <Caja>();
}

void draw(){
  background(255);
  box2d.step();
  if(mousePressed){
    Caja c = new Caja(mouseX,mouseY,random(10,30),random(10,30));
    cajas.add(c);  
  }
  
  for(Caja c:cajas){
    c.display();
  }
}

void keyPressed(){
  if(key == 'q'){
    box2d.setGravity(0,-10);
  }
  
  if(key == 'w'){
    box2d.setGravity(0,10);
  }
  
  if(key == 'e'){
    box2d.setGravity(0,0);
  }
}

class Caja{
  float w;
  float h;
  color c;
  Body b;
  
  Caja(float x_, float y_, float w_, float h_){
    w = w_;
    h = h_;
    c = color(random(255),random(255),random(255));
    makeBody(new Vec2(x_,y_),w_,h_);
  }
  
  void makeBody(Vec2 centro, float w_, float h_){
    PolygonShape ps = new PolygonShape();
    float AnchoEnBox2D = box2d.scalarPixelsToWorld(w_/2);
    float AltoEnBox2D = box2d.scalarPixelsToWorld(h_/2);
    ps.setAsBox(AnchoEnBox2D,AltoEnBox2D);
    
    FixtureDef fd = new FixtureDef();
    fd.density = 1;
    fd.restitution = 1 ;
    fd.friction = 0;
    fd.shape = ps;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(centro));
    b = box2d.createBody(bd);
    b.createFixture(fd);
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(b);
    float a = b.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    rectMode(CENTER);
    fill(c);
    noStroke();
    rect(0,0,w,h);
    popMatrix();
  }  
}
