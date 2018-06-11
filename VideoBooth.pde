import controlP5.*;
import processing.video.*;

ControlP5 controlP5;
int red, blue, green;
PImage frame;
Capture video;
ColorPicker pick;
Toggle tint, invert, gray, blur,threshold,dilate,paint;
Button demo;
Knob blurKnob;
void setup() {
  background(220);
  controlP5 = new ControlP5(this);
  size(640,600);
  video = new Capture(this,640,450);
  frame = new PImage(640,450);
  imageMode(CENTER);
  frameRate(12);
  video.start();
  pick = controlP5.addColorPicker("Choose a Color").setPosition(400,460).setColorValue(color(255));
  tint = controlP5.addToggle("Tint",false,360,470,40,40).setLabel("Tint").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  invert = controlP5.addToggle("Invert",false,10,470,40,40).setLabel("Invert").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  gray = controlP5.addToggle("Gray",false,60,470,40,40).setLabel("Gray").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  blurKnob = controlP5.addKnob("Blur Knob",1,10,6,110,470,40).setLabel("Blur Knob");
  blur = controlP5.addToggle("Blur",false,160,470,40,40).setLabel("Blur").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  threshold = controlP5.addToggle("Threshold",false,210,470,40,40).setLabel("Threshold").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  dilate = controlP5.addToggle("Dilate",false,260,470,40,40).setLabel("Dilate").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  paint = controlP5.addToggle("Paint",false, 310, 470, 40,40).setLabel("Paint").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
}

void draw() {
  ultimateChecker();
  frame = video;
  //image(frame,width/2-160,height/2-120);
  reverse();
  ultimateChecker();
}
  //System.out.println(tint.getName());

public void controlEvent(ControlEvent theEvent) {
  //if (!theEvent.isFrom(pick)) {
  //String x = theEvent.getController().getName();
  if (theEvent.isFrom(pick)) {
    System.out.println("Ignore this");
  }
  else {
    if (theEvent.isFrom(tint)) {
      if (theEvent.getController().getValue() == 1) {
        tintify();
        tint.setLabel("Tint On");
      }
      else {
        tintify(5);
        tint.setLabel("Tint Off");
      }
    }
}
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
public void tintify() {
   color c = pick.getColorValue();
   tint(c);
   //red = r;
   //green = g;
   //blue = b;
   //tint(red,green,blue);
}

public void tintify(int c) {
  tint(255);
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

void reverseBlur(int x) {
  pushMatrix();
  scale(-1,1);
  frame.filter(BLUR,x);
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


void ultimateChecker() {
  /*
  if (tint.getValue() == 1) {
    tintify();
  }
  */
  if (invert.getValue() == 1) {
        reverseInvert();
  }
  if (gray.getValue() == 1) {
        reverseGray();
  }
  if (blur.getValue() == 1) {
    int x = (int) blurKnob.getValue();
    reverseBlur(x);
  }
  
  if (threshold.getValue() == 1) {
    reverseThreshold();
  }
  if (dilate.getValue() == 1) {
    reverseDilate();
  }
  //stroke(5);
  //smooth();
  if (paint.getValue() == 1) {
    color c = pick.getColorValue();
    paint(c);
    
  }
  
}
void paint(int c) {
      pushMatrix();
      noStroke();
      fill(c);
      if (mouseY <= 450 && mousePressed) {
        fill(c);
        ellipse(mouseX, mouseY,10,10);
      }
      scale(-1,1);
      image(frame, -frame.width/2, frame.height/2);
      popMatrix();
      noStroke();
      fill(c);
      if (mouseY <= 450 && mousePressed) {
        fill(c);
        ellipse(mouseX, mouseY,10,10);
      }
}
/*
void lens() {
  video = new Capture(this,width/10,height/10);
  for (int i = 0; i < width/10; i ++) {
    for (int j = 0; j <height/10; j ++) {
      int t1 = i*10;
      int t2 = j *10;
      color c = video.pixels[video.width - i - 1 + j * video.height];
      rectMode(CENTER);
      fill(255);
      noStroke();
      float sz = brightness(c)/255 * 10;
      rect(t1 +5,t2 +5, sz,sz);
    }
  }
}
*/
  
