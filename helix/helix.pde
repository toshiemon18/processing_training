float dth = 0.05;
float radius = 200;
float y_rot = 0;
float dr = 0.3;
float dy = 0.5;

void setup() {
  size(500, 500, P3D);
  background(0);
}

void update() {
  background(0);
  y_rot += 0.1;
}

void draw() {
  update();
  translate(width / 2.0, 0);
  rotateY(y_rot);

  float y = 0;

  for(float ang = 0; ang <= 360 * 40; ang += 10){
    if ((y > 0 && y < height * 0.25) || (y > height * 0.5 && y < height * 0.75)) {
      radius += dr;
    } else if ((y > height * 0.25 && y < height * 0.5) || (y > height * 0.75 && y < height)) {
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