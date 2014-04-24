Olo olo;
class Olo {
  float x, y, h, lengthValue, 
  lengthStep, hStepAmount, strechValue, strechRatio,
  lengthStepInc, lTop, lBottom, rTop, rBottom;
  
  Olo() { 
    x = width/2;
    y = height/2;
    h = 100;
    lengthStep = 7;
    hStepAmount = 15;
    lengthValue = 50;
    lengthStepInc = 1;
    strechValue = 7;
    strechRatio = 2;
    
  }
  void updateLength(float incValue, float incStep, float incStepInc){
    lengthValue += incValue;  
    lengthStep += incStep;
    lengthStepInc += incStepInc;

  }
  void updateStrech(float incValue, float incRatio){
    strechValue += incValue;
    strechRatio += incRatio;
  }
  void updateHeight(float incH, float incHStep){
    h += incH;
    hStepAmount += incHStep;
  }
  void updatePosition(float incX, float incY){
    x = incX;
    y = incY;
  }
  
  //directly set values, allows for change in l/r top/bottom shift
  void setValues(float h,
                 float lengthStep, 
                 float hStepAmount,
                 float lengthValue,
                 float lengthStepInc, 
                 float strechValue,
                 float strechRatio, 
                 float lTop, 
                 float lBottom, 
                 float rTop, 
                 float rBottom)
  {
    this.h = h;
    this.lengthStep = lengthStep;
    this.hStepAmount = hStepAmount;
    this.lengthValue = lengthValue;
    this.lengthStepInc = lengthStepInc;
    this.strechValue = strechValue;
    this.strechRatio = strechRatio;    
    this.lTop = lTop;
    this.lBottom = lBottom;
    this.rTop = rTop;
    this.rBottom = rBottom;
  }
  
  void display() {
    //style
    pushStyle();
    stroke(255, 0, 0);
//    ellipse(x+lengthStep*6+rStrechTop, y+h/2, 10, 10);
    noFill();    
    stroke(0);
    
    //TEMPS (cleaner)
    float hStep = 0;
    float lengthStepIncValue = lengthStepInc;
    float lengthStepValue = lengthStep;
    float hStepValue = hStepAmount; 
    //streches are how far over each loops control points go. 
     // uses the strechValue*strechratio   
    float lStrechTop = lTop*(lengthStep*(strechValue)); //-70
    float lStrechBottom = lBottom*(lengthStep*(strechValue)); //-35
    float rStrechTop = rTop*(lengthStep*(strechValue*strechRatio)); //-70
    float rStrechBottom = rBottom*(lengthStep*(strechValue*strechRatio)); //-35
    
    beginShape();
    //have to have one regular vertex to start
    vertex(x+lStrechTop, y+h/2);
    //i is used for x cordinates, it increases by the lengthStep
    for (float i = x; i <= x+lengthValue ; i += lengthStep) {
      //check if i is more than half way, 
      if (i >= x+lengthValue/2) {
        //if so start shrinking loops
        hStepAmount = -hStepValue;
      } 
      //increment the height& length
      hStep+=hStepAmount;
      lengthStep+=lengthStepInc;
      
      //c1 southhwest, c2 southeast, vertex in center
      bezierVertex(i-lStrechBottom, y-hStep, 
                   i+rStrechBottom, y-hStep, 
                   i, y+h/2);
      //c1 northwest, c2 northeast, vertex in center, 
      //all inc by lengthstep, so they align with next point
      bezierVertex(i+lengthStep-lStrechTop, y+h+hStep, 
                   lengthStep+i+rStrechTop, y+h+hStep, 
                   lengthStep+i, y+h/2);     
                   
//      if (i >= x+lengthValue-lengthStep+1) {
////        ellipse(lengthStep+i+lStrechBottom, y+h/2, 10, 10);
//      }      
    }
    endShape();
    
    //reset changes
    lengthStep = lengthStepValue;
    hStepAmount = hStepValue;
    lengthStepInc = lengthStepIncValue;    
    popStyle();
  }
  
  void console(){
    println("length step: "+lengthStep+" - length: "+lengthValue);
    println("height step: "+hStepAmount+" - height: "+h);
    println("strech value:"+strechValue+" - strech ratio: "+strechRatio);
    println("x: " + x + " - y: "+y);
    println("length step inc: "+lengthStepInc);
  }
}
