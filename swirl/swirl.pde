int circles = 100;
PVector[] loc;
float[] amp;
float angle[];

void setup() {
  fullScreen();
  surface.setResizable(true);
  noStroke();
  fill(100, 100);

  amp = new float[circles];
  angle = new float[circles];
  loc = new PVector[circles];

  for (int i =0; i <circles; i++) {
    amp[i] = 150+i*10;
    angle[i] = i*5;
  }
}

void draw() {
  background(255); 
  translate(width/2, height/2); 

  for (int i =0; i <circles; i++) {
    angle[i] -= 0.1; 
    loc[i] = new PVector(amp[i]*sin(angle[i]), amp[i]*cos(angle[i]));
    ellipse(loc[i].x, loc[i].y, 40, 40);
  }
}