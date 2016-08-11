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

public class helix extends PApplet {

float dth = 0.05f;
float radius = 200;
float y_rot = 0;
float dr = 0.3f;
float dy = 0.5f;

public void setup() {
  
  background(0);
}

public void update() {
  background(0);
  y_rot += 0.1f;
}

public void draw() {
  update();
  translate(width / 2.0f, 0);
  rotateY(y_rot);

  float y = 0;

  for(float ang = 0; ang <= 360 * 40; ang += 10){
    if ((y > 0 && y < height * 0.25f) || (y > height * 0.5f && y < height * 0.75f)) {
      radius += dr;
    } else if ((y > height * 0.25f && y < height * 0.5f) || (y > height * 0.75f && y < height)) {
      radius -= dr;
    }
    float rad = radians(ang);
    float x = (radius * cos(rad));
    y += dy;
    float z = (radius * sin(rad));

    stroke(255);
    strokeWeight(2);
    point(x, y, z);
  }
  radius = 0;
}
  public void settings() {  size(500, 500, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "helix" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
