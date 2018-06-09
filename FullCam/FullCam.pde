import processing.video.*;
  
import java.lang.*;
public class FullCam extends PApplet{
//Tinting

public Capture video;
public PImage frame;
public boolean invertCol, invertV, tinted, grayscaled, dilated;
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
  frameRate(15);
  video.start();
  frame = new PImage(425,375);
  cols = width/10;
  rows = height/10;
  invertCol = false;
  invertV = false;
  tinted = false;
  grayscaled = false;
  dilated = false;
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
     String s1 = "Invert Colors";
     fill(50);
     text(s1,460,65,350,25);
     //rect(350,50, 100, 50);
     fill(255,204,0);
     rect(450,125, 125, 50);
     String s2 = "Dilated";
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
     reverse();
     if (invertCol) {
       reverseInvert();
     }
     if (tinted) {
       tintify(225, 105, 180); 
     }
     if (grayscaled) {
       reverseGray();
     }
     if (dilated) {
       reverseDilate();
     }
     mousedPressed();
     //reverseThreshold();
}

public void mousedPressed() {
  //println(mouseX + " " + mouseY);
  if (mousePressed &&          //Horizontal Invert
    mouseX >= 450 &&
    mouseX <= 575 &&
    mouseY >= 50 &&
    mouseY <= 100) {
      //println("woo");
      invertH = !(invertH);
    }
    if (mousePressed &&        //Dilate
    mouseX >= 450 &&
    mouseX <= 575 &&
    mouseY >= 125 &&
    mouseY <= 175) {
      //println("woo");
      dilated = !(dilated);
    }
    if (mousePressed &&     //Tint
    mouseX >= 450 &&
    mouseX <= 575 &&
    mouseY >= 200 &&
    mouseY <= 250) {
      //println("woo");
      //invertH = !(invertH);
      tinted = !(tinted);
    }
    if (mousePressed &&     //Grayscale
    mouseX >= 450 &&
    mouseX <= 575 &&
    mouseY >= 270 &&
    mouseY <= 350) {
      //println("woo");
      grayscaled = !(grayscaled);
    }
    if (mousePressed &&       //Sticker
    mouseX >= 450 &&
    mouseX <= 575 &&
    mouseY >= 350 &&
    mouseY <= 400) {
      println("woo");
      invertH = !(grayscaled);
    }
    if (mousePressed &&        //Record Video
    mouseX >= 75 &&
    mouseX <= 225 &&
    mouseY >= 400 &&
    mouseY <= 450) {
      println("woo");
    }
    if (mousePressed &&        //Take Picture
    mouseX >= 250 &&
    mouseX <= 400 &&
    mouseY >= 400 &&
    mouseY <= 450) {
      println("woo");
    }
}
public void tintify(int r, int g, int b) {
   red = r;
   green = g;
   blue = b;
   tint(red,green,blue);
}
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
}
