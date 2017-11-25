class Chased {
  PVector loc;
  float t;
  float r;
  float variationX;
  float variationY;


  Chased() {
    loc = new PVector(width/2, height/2);
    variationX = random(0, 10);
    variationY = random(10, 20);
    r = 20;
  }

  void update() {
    loc = new PVector((noise(t+variationX)*width), noise(t+variationY)*height);
    t += 0.008;
  }

  void display() {
    fill(255*noise(t+variationX), 255*noise(t+variationY), 255*noise(t));
    ellipse(loc.x, loc.y, r, r);
  }
}