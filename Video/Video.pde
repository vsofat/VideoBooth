public class Video {
import processing.video.*;
  
import java.lang.*;
//Tinting

Capture video;

int red = 0;
int green = 153 ;
int blue = 153;
int cols, rows;

void setup() {
  size(350, 250);  
  video = new Capture(this, 350, 350); 
  video.start();
  cols = width/10;
  rows = height/10;
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

void draw() { 
  loadPixels();
  //background(255);
  //tintify(red,green,blue);
  video.loadPixels();
  translate(width/2, height/2);  
  imageMode(CENTER); 
  threshold();
  //grayscale();
  reverse();
  //updatePixels();
}
void tintify(int r, int g, int b) {
   red = r;
   green = g;
   blue = b;
   tint(red,green,blue);
}

void grayscale() {
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
void threshold() {
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
void reverse() {
  pushMatrix();
  scale(-1,1);
  image(video, 0, 0);
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

void draw() {
  background(255); 
  translate(width/2, height/2);  
  imageMode(CENTER);  
  invert();
  reverse();
}

void invert() {
  for (int i = 0; i < rows; i ++) {
    for (int j = 0; j < cols; j++) {
      video.pixels[j + i*cols] = 255-video.pixels[j + i*cols];
    }
  }
}
void reverse() {
  pushMatrix();
  scale(-1,1);
  image(video, 0, 0);
  popMatrix();
}
*/
}
