import processing.pdf.*;
boolean record;

void setup() { 
  size(500, 500); 
  mh = new MouseHandler();
  kh = new KeyboardHandler();
  olo = new Olo();
  
  smooth();
  noCursor();
  //  noStroke();
}



void draw() {//         on | off
  //---------------- -------|
  background(120);      //|
  mh.update();          //|
  //  mh.console();         //|
  mh.display(10);       //|
  //  kh.console();         //|
  kh.display();         //|
  olo.console();        //|
  //------------ -----------|
  float size = 10;
  float a = 100;
  if(mh.a){
    record = true;
  }
  if (record) { 
    beginRecord(PDF, "frame-####.pdf");
  }
  if(kh.s1){
    if(kh.left){
      olo.updateLength(0,.1);
    }
    if(kh.right){
      olo.updateLength(0,-.1);
    }
    if(kh.up){
      olo.updateLength(1,0);
    }
    if(kh.down){
      olo.updateLength(-1,0);
    }
  }
  if(kh.s2){
    if(kh.up){
      olo.updateStrech(.1,0);
    }
    if(kh.down){
      olo.updateStrech(-.1,0);
    }
    if(kh.left){
      olo.updateStrech(0,.1);
    }
    if(kh.right){
      olo.updateStrech(0,-.1);
    }
  }
  if(kh.s3){
    if(kh.up){
      olo.updateHeight(1,0);
    }
    if(kh.down){
      olo.updateHeight(-1,0);
    }
    if(kh.left){
      olo.updateHeight(0,.1);
    }
    if(kh.right){
      olo.updateHeight(0,-.1);
    }
  }
  if(kh.s4){
    if(kh.up){
      olo.updatePosition(0,-1);
    }
    if(kh.down){
      olo.updatePosition(0,1);
    }
    if(kh.left){
      olo.updatePosition(-1,0);
    }
    if(kh.right){
      olo.updatePosition(1,0);
    }
  }
  olo.display();
  if(record){
    endRecord();
    record = false;
  }
}



///////////////////////////
class BezierSegment {
  float x1, y1, cx1, cy1, cx2, cy2, x2, y2;
  BezierSegment(float tempx1, float tempy1, float tempcx1,
                float temcy1){  
                  x1 = 0;
  y1 = height;
  cx1= mh.x;
  cy1= mh.y;
  cx2= mh.ix;
  cy2= mh.y;
  x2 = width;
  y2 = height;}
  void display(){
    float size = 10;
  float a = 100;
      if (kh.s1) { 
    x1=mh.x;
    y1=mh.y;   
    stroke(225, a);
    line(x1, y1, cx1, cy1);
    fill(255, 0, 0, a); 
    ellipse(x1, y1, size, size);
  }
  if (kh.s2) {    
    cx1=mh.x;
    cy1=mh.y;
    stroke(225, a);
    line(x1, y1, cx1, cy1);
    fill(255, 0, 0, a); 
    ellipse(cx1, cy1, size, size);
  }
  if (kh.s3) {
    cx2=mh.x;
    cy2=mh.y;
    stroke(255, a);
    line(cx2, cy2, x2, y2);
    fill(0, 0, 255, a);
    ellipse(cx2, cy2, size, size);
  }
  if (kh.s4) {
    x2=mh.x;
    y2=mh.y;
    stroke(255, a);
    line(cx2, cy2, x2, y2);
    fill(0, 0, 255, a);
    ellipse(x2, y2, size, size);
  }
  stroke(0);
  noFill();
  beginShape();
  vertex(x1, y1);
  bezierVertex(cx1, cy1, cx2, cy2, x2, y2);
  endShape();
  }
}

