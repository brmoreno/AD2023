import processing.sound.*;
AudioIn mic;
Amplitude amp;
FFT fft;
float [] bandas = new float[16];
float amp1;
float amp2;

void setup(){
  size(300,300);
  mic = new AudioIn(this,0);
  amp = new Amplitude(this);
  amp.input(mic);
  fft = new FFT(this,16);
  fft.input(mic);
}

void draw(){
  background(255);
  fill(255,0,0);
  amp1 = amp.analyze();
  amp2 = map(amp1,0,0.5,0,100);
  ellipse(width/2,height/2,amp2,amp2);
  fft.analyze(bandas);
  for(int i = 0; i<16; i++){
    float tam = map(bandas[i],0,1,0,-height);
    rect(i*width/16f,height,width/16f,tam);
  }
}
