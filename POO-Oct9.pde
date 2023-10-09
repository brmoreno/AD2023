class Jugador{
  int x,y;
  int jugada; //1: piedra, 2:papel, 3:tijeras;
  boolean yaJugo;
  
  Jugador(int x_, int y_){
    x = x_;
    y = y_;
    jugada = 0;
    yaJugo = false;
  }
  
  void display(){
     
    switch(jugada){
      case 0:
        text("esperando",x,y);
      break;
      case 1:
        text("Piedra",x,y);
      break;
      case 2:
      text("Papel",x,y);
      break;
      case 3:
      text("Tijeras",x,y);
      break;
    }
  }
  
  void jugar(int j_){
    if(!yaJugo){
      jugada = j_;
      yaJugo = true;
    }
  } 
  
  void idle(){
    if(yaJugo){
      text("esperando..." , x,y);
    }
    else{
      text("elige!", x,y);
    }
  }
  
}

class Partida{
  Jugador uno;
  Jugador dos;
  int resultado; //1:jugador 1 ganó, 2: j2 ganó, 3, empate; 
  boolean termino;
  
  Partida(){
    uno = new Jugador(150,250);
    dos = new Jugador(350,250);
    resultado  = 0;
    termino = false;
  }
  
  void display(){
    if(!termino){
      uno.idle();
      dos.idle();
    }
    else{
      uno.display();
      dos.display();
      switch(resultado){
        case 1:
          text("GANÓ J1",250,400);
        break;
        case 2:
          text("GANÓ J2",250,400);
        break;
        case 3:
          text("EMPATE",250,400);
        break;
      }
    }
  }
  
  void onKeyPressed(){
    switch(key){
    case 'a':
      uno.jugar(1);
    break;
    case 's':
      uno.jugar(2);
    break;
    case 'd':
      uno.jugar(3);
    break;
    case 'j':
      dos.jugar(1);
    break;
    case 'k':
      dos.jugar(2);
    break;
    case 'l':
      dos.jugar(3);
    break;    
    }
    
  }
  
  void operacion(){
    if(uno.yaJugo && dos.yaJugo){
      termino = true;
    }
    
    if(termino){
      if(uno.jugada == 1 && dos.jugada == 1){
        resultado = 3;
      }
      if(uno.jugada == 1 && dos.jugada == 2){
        resultado = 2;
      }
      if(uno.jugada == 1 && dos.jugada == 3){
        resultado = 1;
      }
      if(uno.jugada == 2 && dos.jugada == 1){
        resultado = 1;
      }
      if(uno.jugada == 2 && dos.jugada == 2){
        resultado = 3;
      }
      if(uno.jugada == 2 && dos.jugada == 3){
        resultado = 2;
      }
      if(uno.jugada == 3 && dos.jugada == 1){
        resultado = 2;
      }
      if(uno.jugada == 3 && dos.jugada == 2){
        resultado = 1;
      }
      if(uno.jugada == 3 && dos.jugada == 3){
        resultado = 3;
      }
    }
  }  
}


class PPT{
  Partida p;
  int PT1;
  int PT2;
  int GC1;
  int GC2;
  int pantalla ; // 0: inicio, 1: juego, 2:resultado
  
  PPT(){
    p = new Partida();
    PT1 = 0;
    PT2 = 0;
    GC1 = 0;
    GC2 = 0;
    pantalla = 0;
  }
  
  void display(){
    switch(pantalla){
      case 0:
        text("Presiona n para comenzar", 250,250);
      break;
      case 1:
        text(PT1,50,50);
        text(PT2,450,50);
        p.operacion();
        p.display();        
        if (p.termino){
          text("Presiona n para continuar", 250,450);
        }
      break;
      case 2:
        if(PT1 == 5 || GC1 == 3){
          text("GANÓ EL JUGADOR 1", 250, 250);
        }
         if(PT2 == 5 || GC2 == 3){
          text("GANÓ EL JUGADOR 2", 250, 250);
        }
      break;      
    }
  }
  
  void onKeyPressed(){
    switch(pantalla){
      case 0:
        if(key == 'n'){
          pantalla = 1;
        }
      break;
      case 1:
         p.onKeyPressed();
         if(key == 'n'){
           if(p.resultado == 1){
             PT1++;
             GC2 = 0;
             GC1++;
           }
           if(p.resultado == 2){
             PT2++;
             GC1 = 0;
             GC2++;
           }
           if(p.resultado == 3){
             GC1 = 0;
             GC2 = 0;
           }
           p = new Partida();
           if(PT1==5 || PT2 == 5 || GC1 == 3 || GC2 == 3){
             pantalla = 2;
           }
         }
      break;
      case 2:
         p = new Partida();
        PT1 = 0;
        PT2 = 0;
        GC1 = 0;
        GC2 = 0;
        pantalla = 0;
      break;
    
    }
  }
}

PPT ppt;

void setup(){
  size(500,500);
  textSize(30);
  textAlign(CENTER,CENTER);
   ppt = new PPT();
}

void draw(){
  background(255);
  fill(0);
  ppt.display();
}

void keyPressed(){
  ppt.onKeyPressed();
}
