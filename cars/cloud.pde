class Cloud {

  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float maxspeed = 4;


  Cloud(color tempC, float xpos, float tempYpos) {

    c = tempC;
    xpos = random(height, width);
    ypos = tempYpos;
    xspeed = random(0, maxspeed);
    yspeed = random(0, maxspeed);

    maln2 = loadImage("bilder\maln2.png");
  }

  void render() {
    stroke(0);
    fill(c);
    rectMode(CENTER);
    rect(xpos, ypos, 200, 100);

    image(maln2, xpos, ypos);
  }

  void update() {


    // Check for borders
    if (xpos > width) {
      xspeed = xspeed*(-1);
    }
    if (xpos < 0) {
      xspeed = xspeed*(-1);
    }
    if (ypos < 0) {
      yspeed = yspeed*(-1);
    }
    if (ypos > height) {
      yspeed = yspeed*(-1);
    }

    if ((frameCount % 240) == 0) {

      xspeed = random(0, maxspeed);
      yspeed = random(0, maxspeed);
    }

    // update position
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
  }
}
