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
  kh.updateSwitchR ();  //|
  kh.updateDirectionR();//|
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
  //notes: need to find a better way to clear the screen, 
  //       scroll wheel, how do I handle?
}

class KeyboardHandler {
  boolean up, down, left, right, s1, s2, s3, s4, s5, sLatch;
  KeyboardHandler() {
    boolean up, down, left, right, 
    s1, s2, s3, s4, sLatch 
      = false;
  }
  void updateSwitchP() {
    if (sLatch == false) {
      if (key == 'z') {
        if (s1) {
          s1=false;
        }
        else {
          s1=true;
        }
      }
      if (key == 'x') {
        if (s2) {
          s2=false;
        }
        else {
          s2=true;
        }
      }  
      if (key == 'c') {
        if (s3) {
          s3=false;
        }
        else {
          s3=true;
        }
      } 
      if (key == 'v') {
        if (s4) {
          s4=false;
        }
        else {
          s4=true;
        }
      }
      if (key == 'q') {
        if(s5){
          s5=false;
        }
        else {
          s5=true;
        }
      }
    }
    sLatch = true;
  }
  void updateSwitchR() {
    sLatch = false;
  }
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
  void updateDirectionR() {
    up    = false;
    down  = false; 
    left  = false;
    right = false;
  }
  void display() {
    pushStyle();
    noStroke();
    fill(255, 120);
    rect(0+4, height-11, 25, 7);
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

