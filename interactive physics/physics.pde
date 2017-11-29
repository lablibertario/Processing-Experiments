Ball b;
PVector knob;
boolean lol;
float knobLen = 150; //length of the knob bar
int spacing = 70;

void setup() {
  size(600, 600);
  knob = new PVector(19*width/24, height/15); //controls the location of the knob
  b = new Ball(new PVector(width/2, height/2), new PVector(0, 0), new PVector(0, 0), 50);
}

void draw() {
  background(255);
  
  println(pauseOn, resetOn, tornado);

  ui();
  b.borderCheck();
  b.display();
  b.update();
  forceApply();
}