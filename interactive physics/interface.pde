void ui() {
  if (mouseY <height/8) {
    fill(200);
    rect(0, 0, width, height/8);// interface

    strokeWeight(3);
    stroke(0);
    line(2*width/3, height/15, 2*width/3+knobLen, height/15);// user-controlled bar
    line(19*width/24, height/15, 19*width/24, height/12); // center mark
    ellipse(knob.x, knob.y, 20, 20); //knob

    textSize(10);
    for (int i =0; i <width/2; i+=spacing) {
      fill(200);
      rect(i, 0, 50, 40);
      fill(0);
      if (i==0) {
        text("pause", i+10, 25);
      } else if (i==spacing) {
        text("wind", i+10, 25);
      } else if (i==2*spacing) {
        text("gravity", i+10, 25);
      } else if (i==3*spacing) {
        text("tornado", i+10, 25);
      } else if (i==4*spacing) {
        text("reset", i+10, 25);
      }
    }
  }
  fill(0);
  text("x: " + (int) b.loc.x + " y: " + (int) b.loc.y, 8.45*width/10, 9.75*height/10); //displays the location of the ball
}

void mouseDragged() {
  if (mouseY < height/8) {
    float dragged = constrain(mouseX, 2*width/3, 2*width/3+knobLen); // keep the knob on the bar
    knob.x = dragged;

    float change = map(dragged -2*width/3, 0, 150, -3, 3); // map the change in the knob location to the magitude of the forces
    windS = windI*change;
    gravityS = gravityI*change;
    tornadoS = tornadoI*change;
  }
}

void mouseClicked() {
  if (mouseY < height/8) {
    if (mouseX < spacing && mouseX > 0 && mouseY <40 && mouseY > 0) {
      if (pauseOn == true) {
        pauseOn = false;
      } else { 
        pauseOn = true;
      }
    }
    if (mouseX < 2*spacing && mouseX > 0 && mouseY <40 && mouseY > 0) {
      windOn = true;
    } else if (mouseX < 3*spacing && mouseX > 0 && mouseY <40 && mouseY > 0) {
      gravityOn = true;
    } else if (mouseX < 4*spacing && mouseX > 0 && mouseY <40 && mouseY > 0) {
      tornadoOn = true;
    } else if (mouseX < 5*spacing && mouseX > 0 && mouseY <40 && mouseY > 0) {
      if (resetOn == true) {
        resetOn = false;
      } else { 
        resetOn = true;
      }
    }
  }
}