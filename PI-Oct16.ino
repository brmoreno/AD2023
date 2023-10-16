int pinLed = 7;
int pot = A0;
int del = 1000;
int boton = 6;

void setup() {
  // put your setup code here, to run once:
  pinMode(pinLed,OUTPUT);
  pinMode(boton,INPUT_PULLUP);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (digitalRead(boton) == HIGH){
    del = analogRead(pot*5);
    digitalWrite(pinLed,HIGH);
    delay(del);
    digitalWrite(pinLed,LOW);
    delay(del);
  }
  else{
    digitalWrite(pinLed, HIGH);
  }
}
