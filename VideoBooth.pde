import controlP5.*;
import processing.video.*;
//savewithtint
ControlP5 controlP5;
int red, blue, green;
PImage frame, framePrev;
Capture video;
ColorPicker pick;
<<<<<<< HEAD
Toggle tint, invert, gray,threshold, dilate, erode, mirror, posterize;
int val = 0;
Button demo;
Bang takePic;
Knob transparency;
=======
Toggle tint, invert, gray, blur,threshold,dilate,paint;
Button demo;
Knob blurKnob;
>>>>>>> 94c8e4aa1c49172d88565d764b9f4f78f9ca6990
void setup() {
  background(220);
  controlP5 = new ControlP5(this);
  size(640,600);
  video = new Capture(this,640,450);
  frame = new PImage(640,450);
  imageMode(CENTER);
  //frameRate(12);
  video.start();
  pick = controlP5.addColorPicker("Choose a Color").setPosition(400,460).setColorValue(color(255));
<<<<<<< HEAD
  tint = controlP5.addToggle("Tint",false,570,540,40,40).setLabel("Tint").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  transparency = controlP5.addKnob("Transparency",1,255,255,500,540,40).setLabel("Transparency");
  invert = controlP5.addToggle("Invert",false,10,470,40,40).setLabel("Invert").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  gray = controlP5.addToggle("Gray",false,60,470,40,40).setLabel("Gray").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  erode = controlP5.addToggle("Erode",false,110,470,40,40).setLabel("Erode").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  threshold = controlP5.addToggle("Threshold",false,210,470,40,40).setLabel("B&W").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  dilate = controlP5.addToggle("Dilate",false,160,470,40,40).setLabel("Dilate").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  takePic = controlP5.addBang("Take Pic",270,540,100,30).setLabel("Take Picture").setColorBackground(color(0));
  posterize = controlP5.addToggle("Posterize",false,10,540,40,40).setLabel("Peachy").setColorBackground(color(255,0,0)).setColorActive(color(127,255,0));
  
  PFont font1 = createFont("Arial",20,true);
  ControlFont font = new ControlFont(font1,241);
  tint.getCaptionLabel().setFont(font).setSize(12);
  tint.getCaptionLabel().getStyle().marginLeft = 3;
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
  threshold.getCaptionLabel().getStyle().marginLeft = 3;
  threshold.getCaptionLabel().getStyle().marginTop = 0;
  erode.getCaptionLabel().setFont(font).setSize(12);
  erode.getCaptionLabel().getStyle().marginLeft = 1;
  erode.getCaptionLabel().getStyle().marginTop = 0;
  takePic.getCaptionLabel().setFont(font).setSize(12);
  takePic.getCaptionLabel().getStyle().marginLeft = 1;
  takePic.getCaptionLabel().getStyle().marginTop = 0;
  transparency.getCaptionLabel().setFont(font).setSize(12);
  transparency.getCaptionLabel().getStyle().marginLeft = 3;
  transparency.getCaptionLabel().getStyle().marginTop = 0;
  posterize.getCaptionLabel().setFont(font).setSize(12);
  posterize.getCaptionLabel().getStyle().marginLeft = 1;
  posterize.getCaptionLabel().getStyle().marginTop = 0;
}

void draw() {
  framePrev = frame;
=======
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
>>>>>>> 94c8e4aa1c49172d88565d764b9f4f78f9ca6990
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
  else if (theEvent.isFrom(takePic)) {
    takePic();
  }
  else {
    if (theEvent.isFrom(tint)) {
      if (theEvent.getController().getValue() == 1) {
        frameRate(12);
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
<<<<<<< HEAD
  if (posterize.getValue() == 1) {
    reversePosterize();
    frameRate(12);
  }
}

void takePic() {
  PImage newImg =framePrev;
  tint(pick.getColorValue(), transparency.getValue());
  newImg.save("Output" + val + ".jpg");
  val ++;
=======
  //stroke(5);
  //smooth();
  if (paint.getValue() == 1) {
    color c = pick.getColorValue();
    paint(c);
    
  }
  
>>>>>>> 94c8e4aa1c49172d88565d764b9f4f78f9ca6990
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
  
