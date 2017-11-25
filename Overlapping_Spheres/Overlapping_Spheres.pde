import peasy.*;

int len = 40;
IntList nums = new IntList();
PeasyCam cam;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 100);
  noStroke();

  for (int i =len; i < width; i+=60) {
    nums.append(i);
  }
}

void draw() {
  background(51);

  for (int i =0; i <nums.size(); i++) {
    for (int y = len; y <height; y +=len) {
      int x = nums.get(i);
      float d = dist(x, y, width/2, height/2);
      float c = map(d, 0, 400, 255, 0);
      pushMatrix();
      translate(x, y);
      fill(c);
      sphere(c);
      popMatrix();
    }
  }
}