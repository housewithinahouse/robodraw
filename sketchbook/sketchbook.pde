
float[][] points = new float[1000][2];
int linesIndexA, linesIndexB, linesArrayLength, linesCount;
boolean paused, midway;
boolean testSwitch = false;
boolean[] s = new boolean[20];
JavaScript javascript;
float var1;
//StringList labels;

void setup() {
  size(720, 300);
  linesCount = 1;
  linesArrayLength = 30;
  linesIndexA = 10;
  linesIndexA = -1;
  linesIndexB = -1;
  for (int i = 0; i < 1000; i++) {
    points[i][0] = 0;
    points[i][1] = i*10%height;
  }
  //labels = new StringList();
}

void flipSwitch(String sName){
  //list of switch names and results of flipping it. 
  //exampleSwitch = sName=="example"? newValue:exampleSwitch;
  testSwitch = sName == "testing"? true:testSwitch;
}

void draw() {
  if(javascript!=null){
      javascript.showXYCoordinates(mouseX, mouseY);
    }
  if (!paused) {
    int vertexCount = linesArrayLength/linesCount;
//    background(120);
    noFill();
    //itteration
    linesIndexA = linesIndexA>linesArrayLength?0:linesIndexA+1;
    linesIndexB = linesIndexB>linesArrayLength?0:linesIndexB+1;
    
    // //asignment
    //  points[linesIndexA][0] += 10;
    //  points[linesIndexB][0] += random(0,2);
    int tempIndex = 0;
    for (int i = linesCount; i > 0; i--) { 
      beginShape(); 
      int indexStart = tempIndex;
      int n = 0;
      for (int j = indexStart+vertexCount; j > indexStart; j--) {
        float x = points[tempIndex][0];
        float y = points[tempIndex][1];
        if (x > width) {
          paused = true; //x = 0;
        } 
        else if (x < 0) {
          x = width;
        }
        if (y > height) {
          x+=50;
          y = 0;
        } 
        else if (y < 0) {
         // y = height;
        }
        curveVertex(x, y);
        s[0]=true; 
        s[1]=true;
        

        //labels.append("midway");
        midway = x>width/2&s[0]? true:midway;
                
        //labels.append("sin(raidans(y*3))");
        //n+=7;
        x+= midway&&s[1]? sin(radians((y+n)*2)):-sin(radians((y+n)*2));
        
        //basic step
        x+= midway&&s[1]? 4:4;
        
        //noise
        x += random(0,4);//midway? 1-random(0,2):2+random(-1,0);
        
        //write the new point to the array
        points[tempIndex][0]=x;
        points[tempIndex][1]=y; 
		
        //on to the next
        tempIndex++;
      }
      endShape();
    }
    var1++;
    showVarA(int(var1));
  }
}

interface JavaScript {
    void showXYCoordinates(int x, int y);
    void showVarA(int n);
  }

void bindJavascript(JavaScript js) {
    javascript = js;
  }
  

  


