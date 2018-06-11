import processing.video.*;

Capture video;
PImage frame; 
int cols, rows;

void setup() {
  size(320, 240);  
  video = new Capture(this, 320, 240); 
  frameRate(5);
  video.start();
  frame = new PImage(320,240);
  cols = width/10;
  rows = height/10;
}

void captureEvent(Capture video) {
  if (video.available()) {
    video.read();
    //frame = video;
  }
  else {
    println("No camera found");
    System.exit(0);
  }
}

void draw() {
  imageMode(CENTER);
  frame = video;
  reverseDilate();
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

void reverseThreshold() {
  pushMatrix();
  scale(-1,1);
  frame.filter(THRESHOLD);
  image(frame, -frame.width/2, frame.height/2);
  popMatrix();
}

void reverse() {
  pushMatrix();
  scale(-1,1);
  image(frame, -frame.width/2, frame.height/2);
  popMatrix();
}

void chooseReverse(int val) {
  if (val == 0) {
    reverse();
  }
  if (val == 1) {
    reversePosterize();
  }
  if (val == 2) {
    reverseErode();
  }
  if (val == 3) {
    reverseBlur();
  }
  if (val == 4) {
    reverseDilate();
  }
  if (val == 5) {
    reverseInvert();
  }
  if (val == 6) {
    reverseGray();
  }
}
