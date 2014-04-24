
class Tug{
  float x,y,speed,heading, curvature,  
        centerX, centerY, centerWidth, centerHeight, centerLag, centerHeading,  
        rope, delay;
  boolean stopped, draw;
  float[][] points = new float[10000][2];
  int pointsIndex, circleIndex, arraySize;
  Tug(float x, float y){
    //tug
    this.x = x;
    this.y = y;
    speed = 10;
    heading = random(360);

    //center
    centerX = x;
    centerY = y;
    centerWidth = 4;
    centerHeight = 4;
    centerLag = 4;    
    centerHeading = heading;
    //other 
    rope = 50;
    delay = 0;
    pointsIndex = 0;    
    circleIndex = 0;
    arraySize = 100;
    curvature = 10;
    //point array
    for(int i = 0; i < arraySize; i++){
      for(int j = 0; j < 2; j++){
        points[i][j] = 0;
      }
    }
      
  }
  
  void update(){
    float dist = dist(x,y,centerX,centerY);
    heading = heading%360;
    centerHeading = centerHeading%360;
    if (pointsIndex >= arraySize){
      pointsIndex = 0;
    }
    checkBoundries();
    if(!stopped){
      float angle = radians(heading%360);
      x += speed/curvature*sin(angle);
      y += speed/curvature*cos(angle);
      pull(); 
      //rope += speed/100;
      heading += speed/50;
      if(delay<=0){
      float angle2 = radians(circleIndex);
      points[pointsIndex][0] = centerX+((dist/centerWidth)*sin(angle2));
      points[pointsIndex][1] = centerY+((dist/centerHeight)*cos(angle2));
      delay = 1;
      pointsIndex += 1;
      circleIndex += 30;
      delay -= (delay>0)? 1:0;
    }
  } 
}
    
   
  


  void checkBoundries(){
    if(x>width-20||x<20){
      heading += random(-360,360);
    }
    if(y>height-20||y<20){
      heading += random(-360,360);
    }
  }
  void pause(){
    stopped = !stopped;
  }
  void pull(){    
    float dist = (dist(x,y,centerX,centerY))/rope*speed/(centerLag*10);    
    centerX += (x>centerX)? dist:-dist;
    centerY += (y>centerY)? dist:-dist;      
  }
  void clearArray(){
    for(int i = 0; i < arraySize; i++){
      points[i][0] = 0;
      points[i][1] = 0;
    }      
  }
  void randomise(){
    x = random(20,width-20);
    y = random(20,height-20);
    centerX = x+random(-100,100);
    centerY = y+random(-100,10);
    heading=random(360);
  }
  void display(){
    float dist = dist(x,y,centerX,centerY);
    float angle = radians(circleIndex-60);    
    //langoller
    beginShape();
    noFill();
    stroke(0);
    for(int i = 0; i < arraySize; i++){
      if(points[i][0] != 0){
        curveVertex(points[i][0],points[i][1]);
      }
    }
    endShape();
    
    //tug
    stroke(220,200);
    fill(220,200);
    ellipse(x,y,10,10);
    
    //towlines
    stroke(255,100);
    noFill(); 
    curve(centerX-dist*sin(angle/2),centerY-dist*cos(angle/2),
          centerX+(dist/centerWidth)*sin(angle),centerY+(dist/centerHeight)*cos(angle),
          x,y,
          x+5*sin(angle/2),y+5*cos(angle/2)
    );
    curve(centerX-dist*cos(angle/2),centerY-dist*sin(angle/2),
          centerX+(dist/centerWidth)*sin(angle),centerY+(dist/centerHeight)*cos(angle),
          x,y,
          x+5*cos(angle/2),y+5*sin(angle/2)
    );    
  }
  
  //methods to access and set variables.
  float arraySize(){
    return arraySize;
  }
  void arraySize(int n){
    arraySize = n;
  }
  float rope(){
    return rope;
  }
  void rope(int n){
    rope = n;
  }
  float speed(){
    return speed;
  }
  void speed(float n){
    if(n<0){n=0;}
    speed = n;
  }
  float centerLag(){
    return centerLag;
  }
  void centerLag(int n){
    if(n<1){n=1;}
    centerLag = n;
  }
  float centerWidth(){
    return centerWidth;
  }
  void centerWidth(float n){
    centerWidth = n;
  }
  float centerHeight(){
    return centerHeight;
  }
  void centerHeight(float n){
    centerHeight = n;
  }
}
    
