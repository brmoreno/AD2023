class f{
  float amp[];
  int  pos[];
  int n;
  float ran;
  
  f(int n_, float ampm_, float ampM_, float ran_){
    amp = new float[n_];
    pos = new int [n_];
    n = n_;
    ran = ran_;
    for(int i = 0; i<n_; i++){
      amp[i] = random(ampm_,ampM_);
      pos[i] = ceil((ran/n_)*(i+1));
    }
  }
  
  float val(int v_){
    int r = 0;
    for(int i = 0; i< n; i++){
      if(pos[i]<v_){
        r++;
      }
      else{
        break;
      }
    }
    

    int anterior = r==0 ? 0:pos[r-1];
    float ampant = r==0 ? 0:amp[r-1];
    int distancia = v_ - anterior;
    float ip =1- distancia*1f/(ran/n);
    float val = lerp(amp[r],ampant,ip);
    return val;
  }
  
  
}

f r;

void setup(){
  size(400,400);
  r = new f(4,0,255,400);
  noStroke();
  for(int i = 0; i<400; i++){
    fill(0);
    rect(i,0,1,r.val(i));
  }  
}
