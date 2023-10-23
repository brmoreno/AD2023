import processing.sound.*;
SoundFile cancion;
SoundFile sample2;
float amp;
float vel;

void setup(){
  size(200,200);
  cancion = new SoundFile(this,"beat.aiff");
  amp = 1;
}

void draw(){
  // cuidado!!! nunca hacerlo.
  //cancion.play();
   
  amp = map(mouseX,0,width,0,1);
  vel = map(mouseY,0,height,0,2);
  cancion.amp(amp);
  cancion.rate(vel);
}

void keyPressed(){
  if(key == 'a'){
    if(!cancion.isPlaying()){
      cancion.play();
    }
  }
}
