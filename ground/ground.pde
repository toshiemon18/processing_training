final float DETAIL = 100;
float cam_x = width/2.0, cam_y = height/2.0, cam_z = -256;

void setup() {
  size(500, 500, P3D);
  // size(displayWidth, displayHeight, P3D);
  background(0);
}

void update() {
  background(0);
}

void draw() {
  update();
  // camera(cam_x, cam_y, -256, 0, 0, 0, 1, 1, 1);
  translate(width/2, height/2, -512);
  rotateX(radians(map(mouseY, 0, height-1, 90, -90)));
  rotateY(radians(map(-mouseX, 0, width-1, -90, 90)));
  // rotateZ(radians(cam_z));

  for (int y = -height; y < height; y += 4) {
    for (int x = -width; x < width; x += 4) {
      int z = (int) (150 * noise(x / DETAIL, y / DETAIL));
      stroke(0, 255, 255);
      point(x, y, z);
    }
  }
}

void keyPressed() {
  switch (key) {
    case 'h':
      cam_x -= 5;
      break;
    case 'j':
      cam_y += 5;
      break;
    case 'k':
      cam_y -= 5;
      break;
    case 'l':
      cam_x += 5;
      break;
    default:
      break;
  }
}