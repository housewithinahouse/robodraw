MouseHandler mh;
KeyboardHandler kh;

void keyPressed() {//   on | off
  //---------------- -------|
  kh.updateSwitchP ();  //|
  kh.updateDirectionP();//|
  //------------ -----------|
}

void keyReleased() {//  on | off
  //---------------- -------|
  kh.updateR ();  //|
  kh.ds = false;
  //------------ -----------|
}



class MouseHandler {
  // MouseHandler : cleans up the mouse interface in code
  // x,  y   =   mouse position         (float)
  // ix, iy  =   inverse mouse          (float)
  // a,  b   =   left + right buttons   (boolean)
  float x, y, ix, iy; 
  float oldx = 0;
  float oldy = 0; 
  boolean a, b;
  MouseHandler() {
  }
  void update() {  
    x = mouseX;
    y = mouseY;
    ix = width-mouseX;
    iy = height-mouseY;
    if (mousePressed == true) {
      if (mouseButton == LEFT) { 
        a = true;
      } 
      else if (mouseButton == RIGHT) {
        b = true;
      }
    } 
    else {
      a = false;
      b = false;
    }
  }
  void display(int n) {
    pushStyle();
    stroke(255, 120);
    float lengthx = map(x, 0, width, -1, 1);
    float lengthy = map(y, 0, height, -1, 1);
    line(0, y, (n*lengthx)+n, y);
    line(width, y, width+(n*lengthx)-n, y);
    line(x, 0, x, (n*lengthy)+n);
    line(x, height, x, height+(n*lengthy)-n);
    popStyle();
  } 
  void console() {
    // run this when you want a console output. 
    // old only updates when the mouse moves.
    //    if(x != oldx || y != oldy){
    //      println("\n\n\n\n\n\n\n\n");
    println("x - " + x + " :: " + y + " - y \n"+ 
      "    " +ix + " :: " +iy);
    println("a - " + a + " :: " + b + " - b");
    //    }
    oldx = mouseX;
    oldy = mouseY;
  }
  //notes: need to find a better way to clear the console, 
  //       scroll wheel, how do I handle?
}

class KeyboardHandler {
  boolean up, down, left, right, s1, s2, s3, s4, s5, b1,sLatch, ds;
  boolean[] latches, switches, buttons; 
  char[][] keys = { {'z','x','c','v','b','n','m'},
                    {'q','-','+','*','/','y','u'}};
  KeyboardHandler(int n, int m) {
    boolean ds, up, down, left, right, s1, s2, s3, s4,s5, b1, sLatch = false;
    latches = new boolean[m+1];
            println(latches[1]);
    switches = new boolean[n];
    buttons = new boolean[m];
    
  }
  void updateSwitchP() {
     //switches:
     if(!latches[0]){
       for(int i = 0; i < switches.length; i++){
         if(key == keys[0][i]){
           if(switches[i]){
             switches[i] = false;
           } else {
             switches[i] = true;
           }
         }
       }
              
     //buttons:
     for(int i = 0; i < buttons.length; i++){ //setting up search of keys array
      if (key == keys[1][i]) {     //look and see if key is index 1,i
        if(latches[i+1]==false){   //if  it's unlatched
          buttons[i]=true;         // set button to true
          latches[i+1]=true;       // set latch to true
          //println(latches[i+1]); //#  the latches for buttons are turned off 
        }                          //#  by the button(); var, when it's called. 
       }
      }
    latches[0] = true;  //set the switch latch back to on, to wait for keyReleased();
    }
  }
  
  
  void updateR() { //what happens when a key is released. 
    sLatch = false;  //reset sLatch >#kill.
    up    = false;   //reset directional keys
    down  = false; 
    left  = false;
    right = false;
    for(int i = 0; i < latches.length; i++){ 
      latches[i] = false;  //this resets all the latches
    }
    for(int i = 0; i < buttons.length; i++){
      buttons[i] = false; //and this does the buttons.
    
    }
  }
  
  //asks for status of button at n, returns value, resets button.
  //this means that we can press it, and it stays lit until we check 
  //it.
  boolean button(int n){
    boolean value = buttons[n];
    buttons[n] = false;
    return value;
  }
  
  //updates the direction when a key is pressed.
  void updateDirectionP() {
    if (key == CODED) {
      if (keyCode == UP) {
        up = true;
      }
      else if (keyCode == DOWN) {
        down = true;
      } 
      else if (keyCode == LEFT) {
        left = true;
      } 
      else if (keyCode == RIGHT) {
        right = true;
      }
    }
  }

  //displays the HUD. 
  void display() {
    pushStyle();
    noStroke();
    fill(255, 120);
    rect(0+4, height-11, 31, 7);
    if (s1) {
      fill(255, 0, 0, 120);
    }
    else {
      fill(50, 120);
    }
    rect(0+5, height-10, 5, 5);
    if (s2) {
      fill(0, 255, 0, 120);
    }
    else {
      fill(50, 120);
    }
    rect(0+11, height-10, 5, 5);
    if (s3) {
      fill(0, 0, 255, 170);
    }
    else {
      fill(50, 120);
    }
    rect(0+17, height-10, 5, 5);
    if (s4) {
      fill(255, 0, 255, 120);
    }
    else {
      fill(50, 120);
    }
    rect(0+23, height-10, 5, 5);
    if (s5) {
      fill(0, 255, 255, 120);
    }
    else {
      fill(50, 120);
    }
    rect(0+29, height-10, 5, 5);
    
    popStyle();
  }


  void console() {
    char direction = 'n';
    if (up) {
      direction = 'u';
    }
    else if (down) {
      direction = 'd';
    }
    else if (left) {
      direction = 'l';
    }
    else if (right) {
      direction = 'r';
    }
    println("direction: " + direction);
    println(s1 + "\t" + s2 + "\t"+ s3 + "\t"+ s4);
  }
}

