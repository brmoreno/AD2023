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
    fd.density = 0.1;
    fd.restitution = 0.1 ;
    fd.friction = 0;
    fd.shape = ps;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(centro));
    b = box2d.createBody(bd);
    b.createFixture(fd);
    //b.setLinearVelocity(new Vec2(random(-2,2),random(-2,2)));
    //b.setAngularVelocity(random(-3,3));  
}
  
  void mover1(Vec2 d_){
    Vec2 pos = b.getWorldCenter();
    b.applyForce(d_,pos);
  }
  
  void mover2(Vec2 d_, float mag_){
    Vec2 posB2d = box2d.coordPixelsToWorld(d_);
    Vec2 pos = b.getWorldCenter();
    posB2d.subLocal(pos);
    posB2d.normalize();
    posB2d.mulLocal(mag_);
    b.applyForce(posB2d,pos);
  }
  
  
  PVector getPosPix(){
    Vec2 pos = box2d.getBodyPixelCoord(b);
    return new PVector(pos.x,pos.y);
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

class Nodo{
  PVector pos;
  float r;
  float f;
  PVector v;
  
  Nodo(){
    pos = new PVector(random(width),random(height));
    r = random(50,100);
    f = random(-200,200);
    v = PVector.random2D().mult(3);
  }
  
  void mover(){
    pos.add(v);
    if(pos.x<0 || pos.x>width){
      v.x*= -1;
    }
    if(pos.y<0 || pos.y>height){
      v.y*= -1;
    }
  }
  
  void display(){
    noFill();
    stroke(0);
    ellipse(pos.x,pos.y,r*2,r*2);
  }
  
}



import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList <Caja> cajas;
ArrayList <Nodo> nodos;

void setup(){
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  size(500,500);
  cajas = new ArrayList <Caja>();
  nodos = new ArrayList <Nodo>();
  for(int i = 0; i<30; i++){
    nodos.add(new Nodo());
  }
}

void draw(){
  background(255);
  box2d.step();
  for(Nodo n:nodos){
    //n.display();
    n.mover();
  }
  if(mousePressed){
    Caja c = new Caja(mouseX,mouseY,random(10,30),random(10,30));
    cajas.add(c);  
  }
  
  for(Caja c:cajas){
    c.display();
    c.mover2(new Vec2(width/2,height/2),50);
    for(Nodo n: nodos){
      float dist = c.getPosPix().dist(n.pos);
      if(dist<n.r){
        float factor = map(dist,0,n.r,1,0);
        c.mover2(new Vec2(n.pos.x,n.pos.y),n.f*factor);
      }
    }
  }  
}
