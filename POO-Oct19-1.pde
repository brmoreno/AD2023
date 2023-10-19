class Foo{
  float x,y,t;
  Foo(float x_,float y_,float t_){
    x = x_;
    y = y_;
    t = t_;
  }
  
  void display(){
    ellipse(x,y,t,t);
  }
}

class Bar extends Foo{
  Bar(float x_, float y_, float t_){
    super(x_,y_,t_);
  }
}

class Baz extends Foo{
  Baz(float x_, float y_, float t_){
    super(x_,y_,t_);
  }
}

class Qux extends Bar{
  Qux(float x_, float y_, float t_){
    super(x_,y_,t_);
  }
}


Foo unFoo;
Foo unBar;
Foo unBaz;
Foo unQux;


void setup(){
  unFoo = new Foo(100,100,50);
  unBar = new Bar(100,200,50);
  unBaz = new Baz(100,300,50);
  unQux = new Qux (300,300,20);
}
