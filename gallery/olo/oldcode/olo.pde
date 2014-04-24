Olo olo;
class Olo {
  float x, y, h, lengthStepValue, hStepValue, lengthValue, 
  lengthStep, hStepAmount, strechValue, strechRatio,
  lStrechTop, lStrechBottom, rStrechTop, rStrechBottom;
  
  Olo() { 
    x = width/2;
    y = height/2;
    h = 100;
    lengthStepValue = 7;
    hStepValue = 15;
    lengthValue = 50;
    hStepAmount = hStepValue;
    lengthStep = lengthStepValue;
    strechValue = 7;
    strechRatio = 2;
    
    lStrechTop = -(lengthStep*(strechValue)); //-70
    lStrechBottom = -(lengthStep*(strechValue)); //-35
    rStrechTop = -(lengthStep*(strechValue*strechRatio)); //-70
    rStrechBottom = -(lengthStep*(strechValue*strechRatio)); //-35
  }
  void updateLength(float incLength, float incStep){
    lengthStepValue += incStep;
    lengthValue += incLength;    
    lengthStep = lengthStepValue;
    lStrechTop = -(lengthStep*(strechValue)); //-70
    lStrechBottom = -(lengthStep*(strechValue)); //-35
    rStrechTop = -(lengthStep*(strechValue*strechRatio)); //-70
    rStrechBottom = -(lengthStep*(strechValue*strechRatio)); //-35
  }
  void updateStrech(float incValue, float incRatio){
    strechValue += incValue;
    strechRatio += incRatio;
    lStrechTop = -(lengthStep*(strechValue)); //-70
    lStrechBottom = -(lengthStep*(strechValue)); //-35
    rStrechTop = -(lengthStep*(strechValue*strechRatio)); //-70
    rStrechBottom = -(lengthStep*(strechValue*strechRatio)); //-35
  }
  void updateHeight(float incH, float incHStep){
    h += incH;
    hStepValue += incHStep;
    hStepAmount = hStepValue;
  }
  void updatePosition(float incX, float incY){
    x += incX;
    y += incY;
  }
  void display() {
    stroke(255, 0, 0);
    ellipse(x+lengthStep*6+rStrechTop, y+h/2, 10, 10);
    noFill();
    beginShape();
    stroke(0);
    vertex(x+rStrechTop+lengthStep*6, y+h/2);
    float hStep = 0;
    for (float i = x; i <= x+lengthValue ; i += lengthStep) {
      if (i >= x+lengthValue/2) {
        hStepAmount = -hStepValue;
      }
      hStep+=hStepAmount;
      bezierVertex(i, y-hStep, 
                   i+rStrechTop, y-hStep, 
                   i+lStrechTop, y+h/2);

      bezierVertex(i+lengthStep, y+h+hStep, 
                   lengthStep+i+rStrechBottom, y+h+hStep, 
                   lengthStep+i+lStrechBottom, y+h/2);
      
      if (i >= x+lengthValue-lengthStep+1) {
        ellipse(lengthStep+i+lStrechBottom, y+h/2, 10, 10);
      }
    }
    endShape();
    hStepAmount = hStepValue;
  }
  void console(){
    println("length step: "+lengthStep+" - length: "+lengthValue);
    println("height step: "+hStepAmount+" - height: "+h);
    println("strech value:"+strechValue+" - strech ratio: "+strechRatio);
    println("x: " + x + " - y: "+y);
  }
}
