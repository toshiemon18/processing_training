int n = 6;
float dx = width / (2*PI);
float amplitude = 200;
float[] omg = new float[n];
float[] amp = new float[n];

void setup() {
  size(800, 800);
  background(0);

  for (int i = 0; i < n; i++) {
    amp[i] = amplitude / (i + 1);
    omg[i] = (2 * PI) / (width / pow(2, i));
  }
}

void draw() {
  translate(width / 2.0, 0);

  for (int i = 0; i < n; i++) {
    for (float x = 0; x <= width; x += 2) {
      float y = amp[i] * sin(omg[i] * x);

      stroke(255);
      strokeWeight(0.5);
      point(y, x);
    }
  }
}

color solv_color(float omega) {
  return color(255 * sigmoid(omega),
               255 * sigmoid(omega),
               255 * sigmoid(omega));
}

float sigmoid(float x) {
  return (2 / (1 + exp(-x))) - 1;
}

float inv_sigmoid(float x) {
  return 2 / (1 + exp(x));
}

float tanh(float x) {
  float sinh_x = (exp(x) - exp(-x)) / 2.0;
  float cosh_x = (exp(x) + exp(-x)) / 2.0;

  return (sinh_x / cosh_x);
}