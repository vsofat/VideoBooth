import processing.video.*;
  
import java.lang.*;
public class FullCam extends PApplet{
//Tinting

public Capture video;
public PImage frame;
public boolean invertH, invertV, tinted, grayscaled, clicked;
private int red = 0;
private int green = 153 ;
private int blue = 153;
private int cols, rows;
public void settings() {
  size(600,500);
}
public void setup() {
  //size(320, 240);  
  video = new Capture(this, 320, 240); 
  frameRate(5);
  video.start();
  frame = new PImage(320,240);
  cols = width/10;
  rows = height/10;
  invertH = true;
  invertV = false;
  tinted = false;
  grayscaled = false;
  clicked = false;
}

public void captureEvent(Capture video) {
  if (video.available()) {
    video.read();
  }
  else {
    println("No camera found");
    System.exit(0);
  }
}

public void draw() { 
     
     fill(255,204,0);
     rect(450,50, 125, 50);
     String s1 = "Invert Horizontally";
     fill(50);
     text(s1,460,65,350,25);
     //rect(350,50, 100, 50);
     fill(255,204,0);
     rect(450,125, 125, 50);
     String s2 = "Invert Vertically";
     fill(50);
     text(s2,465,140,350,25);
     fill(255,204,0);
     rect(450,200, 125, 50);
     String s3 = "Tint";
     fill(50);
     text(s3,490,215,350,25);
     fill(255,204,0);
     rect(450,275, 125, 50);
     String s4 = "Grayscale";
     fill(50);
     text(s4,480,290,350,25);
     fill(255,204,0);
     rect(450,350, 125, 50);
     String s5 = "Sticker";
     fill(50);
     text(s5,485,365,350,25);
     
     fill(255,0,0);
     rect(75,400, 150, 50);
     String s6 = "Record Vid";
     fill(50);
     text(s6,118,418,350,25);
     
     fill(255,0,0);
     rect(250,400, 150, 50);
     String s7 = "Take Pic";
     fill(50);
     text(s7,298,418,350,25);
     //loadPixels();
     //background(255);
     //tintify(red,green,blue);
     //video.loadPixels();
     //translate(width/2, height/2);  
     //translate(-100,-100);
     imageMode(CENTER); 
     frame = video;
     if (invertH) {
       reverse();
     }
     if (invertV) {
        reverse();
     }
     if (tinted) {
       tintify(225, 105, 180); 
     }
     if (grayscaled) {
       reverseGray();
     }
     mousedPressed();
     //reverseThreshold();
}
public void tintify(int r, int g, int b) {
   red = r;
   green = g;
   blue = b;
   tint(red,green,blue);
}
/*
public void grayscale() {
  for (int i = 0; i < cols; i ++) {
    for (int j = 0; j < rows; j ++) {
      color c = video.pixels[i + j*cols];
      float r = red(c);
      float b = blue(c);
      float g = green(c);
      int x = int(2989 * r + 5870 *g + 114*b);
      color cT = color(x);
      System.out.println(cT);
      set(j,i,cT);
     // video.pixels[i+j*cols] = cT;
      //System.out.print(video.pixels[i+j*cols]);
    }
  }
}
public void threshold() {
  //video.loadPixels();
  for (int i = 0; i < cols; i ++) {
    for (int j = 0; j < rows; j ++) {
      color c = video.pixels[i+j*cols];
      float val = saturation(c);
      if (val < .5) {
       // set(i,j,0);
        video.pixels[i+j*cols] = color(0);
      }
      else {
        //set(i,j,255);
        video.pixels[i+j*cols] = color(255);
      }
    }
  }
  video.updatePixels();
}
public void reverse() {
  pushMatrix();
  scale(-1,1);
  image(video, 0, 0);
  popMatrix();
}

*/
void reverseGray() {
  pushMatrix();
  scale(-1,1);
  frame.filter(GRAY);
  image(frame, -frame.width/2, frame.height/2);
  popMatrix();
}

void reverseInvert() {
  pushMatrix();
  scale(-1,1);
  frame.filter(INVERT);
  image(frame, -frame.width/2, frame.height/2);
  popMatrix();
}

void reverseDilate() {
  pushMatrix();
  scale(-1,1);
  frame.filter(DILATE);
  image(frame, -frame.width/2, frame.height/2);
  popMatrix();
}

void reverseBlur() {
  pushMatrix();
  scale(-1,1);
  frame.filter(BLUR,6);
  image(frame, -frame.width/2, frame.height/2);
  popMatrix();
}

void reverseErode() {
  pushMatrix();
  scale(-1,1);
  frame.filter(ERODE);
  image(frame, -frame.width/2, frame.height/2);
  popMatrix();
}

void reversePosterize() {
  pushMatrix();
  scale(-1,1);
  frame.filter(POSTERIZE,3);
  image(frame, -frame.width/2, frame.height/2);
  popMatrix();
}

void reverse() {
  pushMatrix();
  scale(-1,1);
  image(frame, -frame.width/2, frame.height/2);
  popMatrix();
}

void reverseThreshold() {
  pushMatrix();
  scale(-1,1);
  frame.filter(THRESHOLD);
  image(frame, -frame.width/2, frame.height/2);
  popMatrix();
}
/*
// Mirroring
int videoScale = 8;
// Number of columns and rows in the system
int cols, rows;
// Variable to hold onto Capture object
Capture video;

void setup() {  
  size(640, 480);  
  // Initialize columns and rows  
  cols = width/videoScale;  
  rows = height/videoScale;  
  background(0);
  video = new Capture(this, cols, rows);
  video.start();
}

// Read image from the camera
void captureEvent(Capture video) {  
  video.read();
}

void draw() {
  video.loadPixels();  
  // Begin loop for columns  
  for (int i = 0; i < cols; i++) {    
    // Begin loop for rows    
    for (int j = 0; j < rows; j++) {      
      // Where are you, pixel-wise?      
      int x = i*videoScale;      
      int y = j*videoScale;
      color c = video.pixels[video.width - i -1 + j*video.width];
      fill(c);   
      stroke(0);      
      rect(x, y, videoScale, videoScale);
    }  
  }
  reverse();
}

void reverse() {
  pushMatrix();
  scale(-1,1);
  image(video, 0, 0);
  popMatrix();
}

*/
/*
Capture video;
int rows, cols;

void setup() {
  size(320, 240);  
  video = new Capture(this, 320, 240); 
  video.start();
  cols = width;
  rows = height;
}

void captureEvent(Capture video) {
  if (video.available()) {
    video.read();
  }
  else {
    println("No camera found");
    System.exit(0);
  }
}
*/
public void mousedPressed() {
  println(mouseX + " " + mouseY);
  if (mousePressed &&
    mouseX >= 450 &&
    mouseX <= 575 &&
    mouseY >= 50 &&
    mouseY <= 100) {
      println("woo");
      invertH = !(invertH);
    }
    if (mousePressed &&
    mouseX >= 450 &&
    mouseX <= 575 &&
    mouseY >= 125 &&
    mouseY <= 175) {
      println("woo");
      invertH = !(invertV);
    }
    if (mousePressed &&
    mouseX >= 450 &&
    mouseX <= 575 &&
    mouseY >= 50 &&
    mouseY <= 100) {
      println("woo");
      invertH = !(invertH);
    }
    if (mousePressed &&
    mouseX >= 450 &&
    mouseX <= 575 &&
    mouseY >= 200 &&
    mouseY <= 250) {
      println("woo");
      invertH = !(tinted);
    }
    if (mousePressed &&
    mouseX >= 450 &&
    mouseX <= 575 &&
    mouseY >= 125 &&
    mouseY <= 175) {
      println("woo");
      invertH = !(grayscaled);
    }
    if (mousePressed &&
    mouseX >= 75 &&
    mouseX <= 225 &&
    mouseY >= 400 &&
    mouseY <= 450) {
      println("woo");
    }
    if (mousePressed &&
    mouseX >= 250 &&
    mouseX <= 400 &&
    mouseY >= 50 &&
    mouseY <= 100) {
      println("woo");
    }
}
}
