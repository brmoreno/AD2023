color c;
int paso ; 
void setup(){
  size(500,500);
  frameRate(10);
}

void draw(){
  paso++;
  loadPixels();
  for(int i = 0; i<pixels.length; i++){
    if((i+paso)%2 == 0){
      pixels[i] = color(255,0,0);
    }
    else{
      pixels[i] = color(255);
    }
  }
  updatePixels();
 
  int posicion = (mouseY*width) + mouseX;
  int colorPix = pixels[posicion];
  int r = (colorPix >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (colorPix >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = colorPix & 0xFF;        
  
  println(r + " " + g + " " + b );
 
}
