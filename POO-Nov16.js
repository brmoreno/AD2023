let particulas = [];

function setup() {
  createCanvas(windowWidth, windowHeight);
  for(let i = 0; i<1000; i+=1){
    particulas[i] = new Particula()
  }
  background(255)
}

function draw() {
 for(let i = 0; i<1000; i++){
   particulas[i].display()
   particulas[i].mover()
 }
}

class Particula{ 
  constructor(){
    this.x = random(width);
    this.y = random(height);
    this.t = random(2,10);
    this.c = color(random(255),random(255),random(255));
    this.vidaMax = random(20,50);
    this.vA = 0;
    this.cambioT = random(-0.5,0.5);
  }
  
  display(){
    if(this.vA<this.vidaMax){
    noStroke();
    fill(this.c);
    ellipse(this.x,this.y,this.t,this.t);
  }
    this.vA+=1;
  }
  
  mover(){
    this.t+=this.cambioT;
    let angulo = noise(this.x*0.01,this.y*0.01)*TWO_PI;
    let dx = sin(angulo)*2;
    let dy = cos(angulo)*2;
    this.x+=dx;
    this.y+=dy;
  }
}
