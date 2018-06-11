import controlP5.*;
import processing.video.*;
//savewithtint
ControlP5 controlP5;
int red, blue, green;
PImage frame, framePrev;
Capture video;
ColorPicker pick;
Toggle tint, invert, gray,threshold, dilate, erode, mirror, posterize, paint, reset;
int val = 0;
Button demo;
Bang takePic;
Knob transparency;
boolean painted;
void setup() {
  background(220);
  painted = true;
  controlP5 = new ControlP5(this);
  size(640,600);
  video = new Capture(this,640,450);
  frame = new PImage(640,450);
  imageMode(CENTER);
  //frameRate(12);
  video.start();
  pick = controlP5.addColorPicker("Choose a Color").setPosition(400,460).setColorValue(color(255));
  tint = controlP5.addToggle("Tint",false,590,540,40,40).setLabel("Tint").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  transparency = controlP5.addKnob("Transparency",1,255,255,520,540,40).setLabel("Transparency");
  invert = controlP5.addToggle("Invert",false,10,470,40,40).setLabel("Invert").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  gray = controlP5.addToggle("Gray",false,60,470,40,40).setLabel("Gray").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  erode = controlP5.addToggle("Erode",false,60,540,40,40).setLabel("Erode").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  threshold = controlP5.addToggle("Threshold",false,110,470,40,40).setLabel("B&W").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  dilate = controlP5.addToggle("Dilate",false,110,540,40,40).setLabel("Dilate").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  takePic = controlP5.addBang("Take Pic",220,540,125,30).setLabel("Take Picture").setColorBackground(color(0));
  posterize = controlP5.addToggle("Posterize",false,10,540,40,40).setLabel("Peach").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  paint = controlP5.addToggle("Paint",false,400,540,40,40).setLabel("Paint").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  reset = controlP5.addToggle("Reset",false,450,540,40,40).setLabel("Reset").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  
  PFont font1 = createFont("Arial",20,true);
  ControlFont font = new ControlFont(font1,241);
  tint.getCaptionLabel().setFont(font).setSize(12);
  tint.getCaptionLabel().getStyle().marginLeft = 5;
  tint.getCaptionLabel().getStyle().marginTop = 0;
  invert.getCaptionLabel().setFont(font).setSize(12);
  invert.getCaptionLabel().getStyle().marginLeft = 1;
  invert.getCaptionLabel().getStyle().marginTop = 0;
  gray.getCaptionLabel().setFont(font).setSize(12);
  gray.getCaptionLabel().getStyle().marginLeft = 3;
  gray.getCaptionLabel().getStyle().marginTop = 0;
  dilate.getCaptionLabel().setFont(font).setSize(12);
  dilate.getCaptionLabel().getStyle().marginLeft = 1;
  dilate.getCaptionLabel().getStyle().marginTop = 0;
  threshold.getCaptionLabel().setFont(font).setSize(12);
  threshold.getCaptionLabel().getStyle().marginLeft = 4;
  threshold.getCaptionLabel().getStyle().marginTop = 0;
  erode.getCaptionLabel().setFont(font).setSize(12);
  erode.getCaptionLabel().getStyle().marginLeft = 1;
  erode.getCaptionLabel().getStyle().marginTop = 0;
  takePic.getCaptionLabel().setFont(font).setSize(12);
  takePic.getCaptionLabel().getStyle().marginLeft = 10;
  takePic.getCaptionLabel().getStyle().marginTop = 0;
  transparency.getCaptionLabel().setFont(font).setSize(12);
  transparency.getCaptionLabel().getStyle().marginLeft = 0;
  transparency.getCaptionLabel().getStyle().marginTop = 0;
  posterize.getCaptionLabel().setFont(font).setSize(12);
  posterize.getCaptionLabel().getStyle().marginLeft = 1;
  posterize.getCaptionLabel().getStyle().marginTop = 0;
  paint.getCaptionLabel().setFont(font).setSize(12);
  reset.getCaptionLabel().setFont(font).setSize(12);
}

void draw() {
  if (painted) {
  framePrev = frame;
  frame = video;
  //image(frame,width/2-160,height/2-120);
  reverse();
  }
  ultimateChecker();
}
  //System.out.println(tint.getName());

public void controlEvent(ControlEvent theEvent) {
  
  if (theEvent.isController()) {
  if (theEvent.isFrom(takePic)) {
    takePic();
  }
  else {
    if (theEvent.isFrom(tint)) {
      if (theEvent.getController().getValue() == 1) {
        frameRate(12);
        framePrev = frame;
        tintify();
       // tint.setLabel("Tint On");
      }
      else {
        tintify(5);
      }
    }
}
  }
}



public void captureEvent(Capture video) {
  if (video.available() && painted) {
    video.read();
  }
  else if (video.available() && !(painted)) {
    
  }
  else {
    println("No camera found");
    System.exit(0);
  }
}
public void tintify() {
  int x = (int) transparency.getValue();
   color c = pick.getColorValue();
   tint(c,x);
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
        frameRate(12);
  }
  if (gray.getValue() == 1) {
        reverseGray();
        frameRate(12);
  }
  if (erode.getValue() == 1) {
    reverseErode();
    frameRate(12);
  }
  
  if (threshold.getValue() == 1) {
    reverseThreshold();
    frameRate(12);
  }
  if (dilate.getValue() == 1) {
    reverseDilate();
    frameRate(12);
  }
  if (posterize.getValue() == 1) {
    reversePosterize();
    frameRate(12);
  }
  if (reset.getValue() == 1) {
    invert.setValue(0);
    gray.setValue(0);
    erode.setValue(0);
    threshold.setValue(0);
    dilate.setValue(0);
    posterize.setValue(0);
    paint.setValue(0);
    pick.setColorValue(color(255));
    tint.setValue(0);
    tintify();
    painted = true;
    video.start();
    reset.setValue(0);
  }
  if (paint.getValue() == 1) {
    color c = pick.getColorValue();
    fill(c);
    painted = false;
    if (mousePressed && mouseY <= 470) {
       video.stop();
       noStroke();
       ellipse(mouseX, mouseY, 10,10); 
    }
  }
}

void takePic() {
  video.stop();
  PImage t = framePrev.copy();
  PImage newImg = createImage(640,540,RGB);
  newImg = t.get();
  
  //System.out.println(newImg.get(0,0));
  //System.out.println(framePrev.get(0,0));
  //tint(pick.getColorValue(), transparency.getValue());
 // System.out.println(newImg.get(0,0));
  newImg.save("Output" + val + ".jpg");
  val ++;
  video.start();
  
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
  
