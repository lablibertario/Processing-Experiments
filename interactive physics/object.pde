class Ball {
  PVector loc; //location
  PVector vel; //velocity
  PVector acc; //acceleration
  float a; //angle
  float aVel; //angluar velocity;
  float aAcc; //angular acceleration
  float mass;

  Ball(PVector loc, PVector vel, PVector acc, float mass) {
    this.loc = loc;
    this.vel = vel;
    this.acc = acc;
    this.mass = mass;

    a = 0;
    aVel = 0;
    aAcc = 0;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass); //according to Newton's 2nd Law F=ma
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);

    aAcc = acc.x/10;
    aVel += aAcc;
    a += aVel;
  }

  void display() {
    float r = map(mass, 0, 100, 0, 80); //set the radius relative to how heavy the ball is
    pushMatrix();
    noStroke();
    fill(51);
    translate(loc.x, loc.y);
    rotate(tornado);
    rect(loc.x, loc.y, r, r);
    popMatrix();
  }

  void borderCheck() {
    if (loc.x>width) {
      loc.x = width;
      vel.x *= -1;
    } else if (loc.x < 0) {
      loc.x = 0;
      vel.x *= -1;
    }

    if (loc.y>height) {
      vel.y *= -1;
      loc.y = height;
    } else if (loc.y < width/8) {
      loc.y = width/8;
      vel.y *= -1;
    }
  }
}