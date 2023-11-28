class Mover {
  Body body;
  float r;
  int tipo;

  Mover(float r_, float x, float y, int tipo_) {
    tipo = tipo_;
    r = r_;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
  
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);

    
  }

   void mover2(Vec2 d_, float mag_){
    Vec2 posB2d = box2d.coordPixelsToWorld(d_);
    Vec2 pos = body.getWorldCenter();
    posB2d.subLocal(pos);
    posB2d.normalize();
    posB2d.mulLocal(mag_);
    body.applyForce(posB2d,pos);
  }
  
  void moverAlAtractor(){
    Vec2 posB2d = box2d.coordPixelsToWorld(atractores[tipo]);
    Vec2 pos = body.getWorldCenter();
    float dist = dist(posB2d.x,posB2d.y,pos.x,pos.y);
    mover2(atractores[tipo],dist);
  }
  
  


  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    if(tipo == 0){
      fill(255,0,0);
    }
    if(tipo == 1){
      fill(0,255,0);
    }
    if(tipo == 2){
      fill(0,0,255);
    }
    
    
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    line(0,0,r,0);
    popMatrix();
  }
}

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Vec2 atractores [] = new Vec2[3];

Box2DProcessing box2d;
ArrayList <Mover> movers;

void setup(){
  size(500,500);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  movers = new ArrayList <Mover>();
  atractores[0] = new Vec2(50,50);
  atractores[1] = new Vec2(width/2,height/2);
  atractores[2] = new Vec2(width-50,height-50);
}
int d;
void draw(){
  background(255);
  box2d.step();
  if(mousePressed){
    movers.add(new Mover(random(10,20),mouseX,mouseY,d%3));
    d++;
  }
  for(Mover m:movers){
    m.display();
  }
  for(Vec2 p: atractores){
    ellipse(p.x,p.y,5,5);
  }
  
  if(keyPressed){
    for(Mover m:movers){
      m.moverAlAtractor();
    }
  }
}
