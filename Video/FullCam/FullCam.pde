import processing.video.*;
  
import java.lang.*;
public class Video extends PApplet{
//Tinting

public Capture video;

private int red = 0;
private int green = 153 ;
private int blue = 153;
private int cols, rows;
public void settings() {
  size(600,500);
}
public void setup() {
  video = new Capture(this, 320, 240); 
  video.start();
  cols = width/10;
  rows = height/10;
  background(255);
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
     loadPixels();
     //background(255);
     //tintify(red,green,blue);
     video.loadPixels();
     translate(width/2, height/2);  
     translate(-100,-100);
     imageMode(CENTER); 
     threshold();
     //grayscale();
     reverse();
}
public void tintify(int r, int g, int b) {
   red = r;
   green = g;
   blue = b;
   tint(red,green,blue);
}

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
