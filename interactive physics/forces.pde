boolean pauseOn, windOn, gravityOn, tornadoOn, resetOn; //switches for the forces

float windI =1; // initial variables
float gravityI = 9.8;
float tornadoI = 0.1;

float windS, gravityS, tornadoS;
float theta = 0;
PVector wind = new PVector(windI, 0);
PVector gravity = new PVector(0, gravityI);
float tornado = 0;


void forceApply() {
  theta += 0.01;
  if (pauseOn) {
    b.vel.mult(0);
  }
  if (windOn) {
    b.applyForce(wind);
  }
  if (gravityOn) {
    b.applyForce(gravity);
  }
  if (tornadoOn) {
    
  }
  if (resetOn) {
    b.acc.mult(0);
    wind.set(0, 0);
    gravity.set(0, 0);
    tornado = 0;
  } else {
    wind.set(windS, 0);
    gravity.set(0, gravityS);
    tornado = tornadoS;
  }
}