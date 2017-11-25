class Car {
  PVector loc, vel, acc;
  float r;
  float maxForce, maxSpeed;

  Car(float x, float y) {
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
    loc = new PVector(x, y);
    r= 10;
    maxForce = 0.01;
    maxSpeed = 2;
  }

  void update() {
    loc.add(vel);
    vel.add(acc);
    vel.limit(maxSpeed);
    acc.mult(0);
  }

  //void applyFoce(PVector f) {
  //  acc.add(f);
  //}

  void follow(PVector target) {
    PVector path = PVector.sub(target, loc);
    path.setMag(maxSpeed);
    PVector steer = PVector.sub(path, vel);
    steer.limit(maxForce);
    acc.add(steer);
  } 

  void arrive(PVector target) {
    PVector path = PVector.sub(target, loc);
    float d = path.mag();
    if (d <15) {
      float m = map(d, 0, 100, 0, maxSpeed);
      path.setMag(m);
    } else {
      path.setMag(maxSpeed);
    }
  }

  void display() {
    float theta = vel.heading()+PI/2;
    fill(0);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*3);
    vertex(r, r);
    vertex(-r, r);
    endShape(CLOSE);
    popMatrix();
  }
}