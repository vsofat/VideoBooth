public class Screen extends PApplet{
   Video vid;
   public void settings() {
     size(600,500);
   }
   public void setup() {
     fill(255,204,0);
     background(255);
   }
   public void draw() {
     /*PFont font;
     font = loadFont("????");
     textFont(font, 20);
     String s = "Invert Horizontally";
     float tS = 50;
     while (textWidth(s) > 100) {
       tS -= 1;
       textSize(tS);
       println(textWidth(s));
     }
     fill(0);
     text(s,50+(100-textWidth(s))/2,75+tS/2);*/
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
     
     
     vid.translate(25,25);(,0);
     rect(25,25, 350, 350);
     String s8 = "CAMERA HERE";
     fill(50);
     text(s8,150,200,350,100);
   }
}
