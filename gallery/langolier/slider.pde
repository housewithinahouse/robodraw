void slidersHandler(){
  //update slider index (kh.ds is "direction switch")
  if(kh.up&&!kh.ds){
    sliderIndex-=1;
    kh.ds = true;
  }
  if (kh.down&&!kh.ds){
    sliderIndex+=1;
    kh.ds = true;    
  }
  
  //keep the index inbounds
  if (sliderIndex > sliders.length-1){
    sliderIndex = sliders.length-1;
  } else if (sliderIndex < 0){
    sliderIndex = 0;
  }
  //update active sliders if left/right is pressed, display all
  for (int i = 0; i < sliders.length; i++){
    if(sliders[i].active){
     if(kh.right){
      sliders[i].update(1);
     } else if(kh.left){
      sliders[i].update(-1);
     }
    }
    
    sliders[i].display();
    //clear other active sliders
    sliders[i].activeSet(false);
  }
  sliders[sliderIndex].activeSet(true);
}
  


class Slider {
  //creates a settable slider
  float x,y,h,l,pos,maphigh,maplow;
  boolean active;
  String label;
  Slider(float x, float y,float l,float h,float pos, float maplow, float maphigh, String label){
    this.x = x;
    this.y = y;
    this.h = h;
    this.l = l;
    this.pos = pos;
    this.maphigh = maphigh;  //not in use
    this.maplow = maplow;    //not in use
    this.label = label;
    
  }
  void display(){
    stroke(255,120);
    fill(170,100);
    rect(x,y,l,h);
    noStroke();
    fill(255,170);
    if(active){
      fill(255,0,0);
    }
    rect(x+pos, y-1, 5, h+3);
    textSize(10);
    text(label,l+x+5, y+5);
  }
  
  void update(float incPos){
    pos += incPos;
    if(pos+x > l+x-5){
      pos = l-5;
    } else if (x+pos < x){
      pos = 0;
    }
  }
  
  void activeSet(boolean tempactive){
    active = tempactive;
  }
  float value(){
    return map(pos,0,x+l-10,maplow,maphigh);
  }
}
