import processing.pdf.*;

PFont font;

Slider[] sliders = new Slider[7]; //creates an array of 7 sliders
int sliderIndex = 0; //Keeps track of what slider we're on
boolean record; //for PDF

void setup() { 
  size(720, 500);    
  mh = new MouseHandler();
  kh = new KeyboardHandler(5,1);
  font = loadFont("mono.vlw");
  textFont(font);
  
  olo = new Olo(); 
  
  //labels to pass to sliders
  String[] labels = {"height", 
                     "length step", 
                     "height step", 
                     "length", 
                     "length increment", 
                     "strech", 
                     "strech ratio"};
  //loop though and generate sliders 
  for (int i = 0; i < sliders.length; i ++){
    //we want "length inc", index[4], to be 0.
    int temppos;
    if(i==4){ 
      temppos = 0;
    } else {
      temppos = 60;
    }
    //creates a new Slider(x,y,length,height,pos,scalelow,scalehigh,label)
    sliders[i] = new Slider(4,
                           (i*9)+height-(9*sliders.length-1)-13,
                           120,
                           5,
                           temppos,
                           0,
                           1,
                           labels[i]);
  }

  smooth();
  noCursor();
  
  //  noStroke();
}

void draw() {//        on | off
 //---------------- ------|
  background(120);      //|
  mh.update();          //|
//  mh.console();         //|
  mh.display(10);       //|
//  kh.console();         //|
  kh.display();         //|
//  olo.console();        //|
 //------------ ----------| 
 //------- PDF export ----|
  if(kh.button(0)){             //|
    record = true;  
    println("PDF export");    //|
  }                     //|
  if (record) {         //|
    beginRecord(PDF, "frame-####.pdf");
  }                     //|
 //-------- code between here and endRecord() gets captured
 // ----- q to record 
 
  olo.display();

 //------ Clean Up for PDF ---- 
  if(record){
    endRecord();
    record = false;
  }    
  //////////////////////////////
  
  //Sliders & Switches
  //---------------------
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
  
  //set the skew switches
  int lTop, lBottom, rTop, rBottom;
  if(kh.s1){
    lTop = 1;
  } else {
    lTop = -1;
  }
  if(kh.s2){
    lBottom = 1;
  } else {
    lBottom = -1;
  }
  if(kh.s3){
    rTop = 1;
  } else {
    rTop = -1;
  }
  if(kh.s4){
    rBottom = 1;
  } else {
    rBottom = -1;
  }
  
  //get sliders' values and map them to olo
  olo.setValues(  
  map(sliders[0].value(),0,1, -250,350),  //decent (default h = 100)
  map(sliders[1].value(),0,1,  1,18), //lengthStepValue =7
  map(sliders[2].value(),0,1,  1,50), //hStepValue = 15
  map(sliders[3].value(),0,1,  1,400), //lengthValue = 50
  map(sliders[4].value(),0,1,  .01,4), //lengthStepInc = 1
  map(sliders[5].value(),0,1, -50,58), //good (StrechValue = 7  
  map(sliders[6].value(),0,1, -8,9),  //strechRatio = 2
  lTop,lBottom,rTop,rBottom
  );
  //slider range defa 0:, 1:, 2:, 3:, 4:, 5:-15,15, 6:
  
  //move to mouse:
  olo.updatePosition(mh.x,mh.y); 
  
  //update active sliders if left/right is pressed, display all
  for (int i = 0; i < sliders.length; i++){
    if(sliders[i].active()){
     if(kh.right){
      sliders[i].update(1);
     } else if(kh.left){
      sliders[i].update(-1);
     }
    }
    
    sliders[i].display();
    //clear other active sliders
    sliders[i].active(false);
  }
  sliders[sliderIndex].active(true);

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
  
  boolean active(){
    return active;
  }
  void active(boolean tempactive){
    active = tempactive;
  }
  float value(){
    return map(pos,0,x+l-10,maplow,maphigh);
  }
}
