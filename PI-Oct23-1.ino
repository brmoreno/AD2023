int ledR = 3;
int ledG = 5;
int ledB = 6;

bool c130;
bool c131;
bool c132;

int v130;
int v131;
int v132;

int val; 

void setup(){
  pinMode(ledR,OUTPUT);
  pinMode(ledG,OUTPUT);
  pinMode(ledB,OUTPUT);
  Serial.begin(9600);
}

void loop(){

  if(Serial.available()){
    val = Serial.read();
    if(val>127){
      if(val == 130){
        c130 = true;
      }
      else{
        c130 = false;
      }
      if(val == 131){
        c131 = true;
      }
      else{
        c131 = false;
      }
      if(val == 132){
        c132 = true;
      }
      else{
        c132 = false;
      }
    }
    else{
      if(c130){
        v130 = val;
      }
      if(c131){
        v131 = val;
      }
      if(c132){
        v132 = val;
      }
    }
  }

  analogWrite(ledR,v130*2);
  analogWrite(ledG,v131*2);
  analogWrite(ledB,v132*2);
}
