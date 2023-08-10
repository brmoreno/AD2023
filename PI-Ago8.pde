//Requiere la biblioteca oscP5

import oscP5.*;
import netP5.*;
int x;
int y;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12001);
  x= width/2;
  y = height/2;
}


void draw() {
  background(0);  
  fill(255,0,0);
  ellipse(x,y,100,100);
}

void mousePressed() {
  OscMessage myMessage = new OscMessage("/test");
  myMessage.add(mouseX);
  oscP5.send(myMessage, myRemoteLocation); 
}


void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern("/x")==true) {
    x = theOscMessage.get(0).intValue();
  } 
  if(theOscMessage.checkAddrPattern("/y")==true) {
    y = theOscMessage.get(0).intValue();
  } 
}
