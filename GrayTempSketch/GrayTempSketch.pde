import processing.video.*;

Capture video;
PImage frame; 
int cols, rows;
void setup() {
  size(320, 240);  
  video = new Capture(this, 320, 240); 
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
  //loadPixels();
  //translate(width/2,height/2);
  imageMode(CENTER);
  //reverse();
  frame = video;
  //image(frame,width/2,height/2);
  //scale(1,-1);
  reverseGray();
  /*
  pushMatrix();
  scale(-1,1);
  grayscale();
  image(frame,width/2,height/2);
  popMatrix();
  */
}
void reverseGray() {
  pushMatrix();
  scale(-1,1);
  frame.filter(GRAY);
  image(frame, -frame.width/2, frame.height/2);
  //translate(320,240);
  popMatrix();
}

void grayscale() {
  frame.filter(THRESHOLD);
  //reverse();
}
