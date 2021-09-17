import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Processing_Practice extends PApplet {

float x = 0;
float y = 0;
float z = 0;
float sphereSize = 1150;

int colorC = color(0,0,0);


public void setup() {
  
  //size(800, 800, P3D);
  
  background(0);

}

public void draw() {
  
  translate(width/2, height/2);
  background(0);
  noFill();
  stroke(255);
  rotateX(x);
  rotateZ(z);
  sphere(sphereSize);
  
  for (int i  = 0; i < 12; i+=2) {
    fill(0);
    stroke(255);
    fill(colorC);
    rotateX(x + PI/4);
    rotateZ(z + PI/4);
    rotateY(y + PI/4);
    box(300, 300, 300);
  
  }
  
  x += (.1f *PI)/180;
  y += (.3f *PI)/180;
  z += (.2f *PI)/180;
  
}
  public void settings() {  fullScreen(P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Processing_Practice" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
