class Palabra{
  String text;
  float x,y;
  PFont pf;
  int t;
  PGraphics mascara;
  PGraphics textura;
  float r,g,b;
  
  
  Palabra(String text_, float x_, float y_, int t_){
    text = text_;
    x = x_;
    y = y_;
    t = t_;
    String[] fuentes = PFont.list();
    pf = createFont(fuentes[floor(random(fuentes.length))],t);
    textFont(pf);
    textSize(t);
    float ancho = textWidth(text);
    mascara = createGraphics(round(ancho),t);
    textura = createGraphics(round(ancho),t);
    r = random(255);
    g = random(255);
    b = random(255);
    mascara();
  }
  
  void display(){
    textura();
    textura.mask(mascara);
    image(textura,x,y-t);
   
  }
  
  void textura(){
    textura.beginDraw();
    textura.noStroke();
    for(int i = 0; i<textura.width;i+=10){
      for( int j = 0; j<textura.height; j+=10){
        textura.fill(r+random(-100,100),g+random(-100,100),b+random(-100,100));
        textura.rect(i,j,10,10);
      }
    }
    textura.endDraw();
  }
  
  void mascara(){
    mascara.beginDraw();
    mascara.background(0);
    mascara.fill(255);
    mascara.textFont(pf);
    mascara.textSize(t);
    mascara.text(text,0,t);
    mascara.endDraw();
  }
}


String [] lineas; 
ArrayList <Palabra> palabras;
int verso = 2;
void setup(){
  size(500,500);
  lineas = loadStrings("piedradesol.txt");
  palabras = new ArrayList <Palabra> ();
  String pSeparadas [] = split(lineas[verso], ' ');
  printArray(pSeparadas);
  for(int i = 0; i<pSeparadas.length;i++){
    float tam = height/pSeparadas.length;
    Palabra una = new Palabra(pSeparadas[i],0,tam+tam*i,round(tam));
    palabras.add(una);
  }
  
  
}

void draw(){
  background(255);
  for(Palabra p:palabras){
    p.display();
  }
}

void keyPressed(){
  ActualizarTexto();
}

void ActualizarTexto(){
  verso++;
  palabras = new ArrayList <Palabra> ();
  String pSeparadas [] = split(lineas[verso], ' ');
  printArray(pSeparadas);
  for(int i = 0; i<pSeparadas.length;i++){
    float tam = height/pSeparadas.length;
    Palabra una = new Palabra(pSeparadas[i],0,tam+tam*i,round(tam));
    palabras.add(una);
  }
}
