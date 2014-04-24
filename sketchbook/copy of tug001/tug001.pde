import processing.pdf.*;
PFont font;
boolean record; //for PDF

Slider[] sliders = new Slider[6]; //creates an array of 7 sliders
int sliderIndex = 0; //Keeps track of what slider we're on


Tug tug;

void setup() { 
  size(720, 500);
  smooth();
  noCursor();  
  
  mh = new MouseHandler();
  kh = new KeyboardHandler(5,4);
  //font = loadFont("mono.vlw");
  //textFont(font);
  tug = new Tug(width/2,height/2);
   
  //labels to pass to sliders
  String[] labels = {"length", 
                     "spiral step", 
                     "constructer speed", 
                     "center lag", 
                     "strech spiral width", 
                     "strech spiral height"
                     };
  //loop though and generate sliders 
  for (int i = 0; i < sliders.length; i ++){
    int temppos = 60;
    if(i==2){
      temppos = 30;
    }
    if(i==3){
      temppos = 40;
    }
    if(i==4 || i==5){
      temppos = 0;
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

  
}

void draw() {//        on | off
 //---------------- ------|
  background(120);      //|
//  mh.update();          //|
//  mh.console();         //|
//  mh.display(10);       //|
//  kh.console();         //|
//  kh.display();         //|
//  olo.console();        //|
 //------------ ----------| 
 //------- PDF export ----|
  if(kh.button(0)){     //|
    record = true;  
    println("PDF export"); //|
  }                     //|
  if (record) {         //|
    beginRecord(PDF, "frame-####.pdf");
  } //--------------------|

 //tug stuff 
  tug.update();
  tug.display();

 //------ Clean Up for PDF ---- 
  if(record){
    endRecord();
    record = false;
  }    
 
 //do the slider-y update-y thing
  slidersHandler();
  
 //set switches
  if(kh.s1){
    ;
  } else {
    ;
  }
  
 //buttons
  if(kh.button(1)){
    tug.clearArray();
  }
  if(kh.button(2)){
    tug.pause();
  }
  if(kh.button(3)){
    tug.randomise();
  }
  
 //sliders to tug functions
  tug.arraySize(int(map(sliders[0].value(),0,1,50,5000)));
  tug.rope(int(map(sliders[1].value(),0,1,100,2)));
  tug.speed(map(sliders[2].value(),0,1,0,30));
  tug.centerLag(int(map(sliders[3].value(),0,1,0,20)));
  tug.centerWidth(map(sliders[4].value(),0,1,4,1));
  tug.centerHeight(map(sliders[5].value(),0,1,4,1));
}


   
