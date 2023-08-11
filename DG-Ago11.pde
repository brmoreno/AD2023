int px;

void setup(){
  size(400,400);
  px = 200;

  loadPixels();
 for(int i = 0; i<pixels.length;i++){
   pixels[i] = color(0);
 }
 for(int i = 0; i<200; i++){
   int px = round(random(width));
   int py = round(random(height));
   int pt = round(random(50,200));
   int pr = round(random(105));
   int pg = round(random(105));
   int pb = round(random(105));
   
 miCirculo(px,py,pt,pr,pg,pb);
 
 }
 updatePixels();
}

void miRectangulo2(int x_, int y_, int w_, int h_, color c_){
  if(pixels == null){
    loadPixels();
  }
  int ancla = x_ + y_*width;
  for(int i = x_; i<x_+w_ && i<width; i++){
    for(int j = y_; j< y_+ h_ && j<height; j++){
      color original = pixels[i+j*width];
      int r = (original >> 16) & 0xFF;
      int g = (original >> 8) & 0xFF;
      int b = original & 0xFF;
      r+= (c_ >> 16) & 0xFF;
      g+= (c_ >> 8) & 0xFF;
      b+= c_ &  0xFF;      
      pixels[i+j*width] = color(r,g,b);;
    }
  }  
  updatePixels();
}

void miRectangulo1(int x_, int y_, int w_, int h_, color c_){
  if(pixels == null){
    loadPixels();
  }
  int ancla = x_ + y_*width;
  for(int i = x_; i<x_+w_ && i<width; i++){
    for(int j = y_; j< y_+ h_ && j<height; j++){
      
      
    }
  }  
  updatePixels();
}


void miCirculo(int x_, int y_, int t_, int r_,int g_, int b_){  
  if(pixels == null){
    loadPixels();
  }
  for(int i = x_-t_/2 < 0? 0:x_-t_/2; i<x_+t_/2 && i<width;i++ ){
    for(int j = y_-t_/2 <0? 0: y_-t_/2; j<y_+t_/2 && j<height;j++){
      float distancia = dist(x_,y_,i,j);
      if(distancia<t_/2){
        color original = pixels[i+j*width];
        int r = (original >> 16) & 0xFF;
        int g = (original >> 8) & 0xFF;
        int b = original & 0xFF;
        float factor = map(distancia,0,t_/2,1,0);
        r += r_*factor;
        g += g_*factor;
        b += b_*factor;
        pixels[i+j*width] = color(r,g,b);
      }
    }
  } 
 updatePixels();
}
