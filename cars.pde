Cloud minCloud1;

MinCar minCar1;

int timer;

Car myCar1;
Car myCar2;
Car myCar3;

// state 1: gaming
// state 2: explosion
int state;

PImage maln2;

void setup() {
  size(1200, 1000);

 minCloud1 = new Cloud(color(255,255,255),random(12,100),random(12,100));
    
  minCar1 = new MinCar(color(255, 150, 150), 10, 200, 0, 0);

  myCar1 = new Car(color(255, 0, 0), 50, 200, 1);
  myCar2 = new Car(color(255, 255, 0), 70, 250, 2);
  myCar3 = new Car(color(255, 0, 250), 70, 300, 3);

  state = 1;

maln2 = loadImage("maln2");

}


void draw() {

  // State 1: gaming
  if (state == 1) {
    background(0, 255, 255);

    myCar1.update();
    myCar1.render();

    myCar2.update();
    myCar2.render();

    myCar3.update();
    myCar3.render();

    minCar1.update();
    minCar1.render();

    minCloud1.update();
    minCloud1.render();
    
    // State 2 : explosion
  } else if (state == 2) {
    background(0, 255, 255);
    
    minCar1.explode();

    myCar1.update();
    myCar1.render();

    myCar2.update();
    myCar2.render();

    myCar3.update();
    myCar3.render();
    
    minCloud1.update();
    minCloud1.render();

    if (millis() - timer > 2000) {
      state = 1;
    }
  }
}

void keyPressed() {
  if (key == 'w') {
    minCar1.yspeed = minCar1.yspeed - 1;
  }
  if (key == 's') {
    minCar1.yspeed = minCar1.yspeed + 1;
  }
  if (key == 'a') {
    minCar1.xspeed = minCar1.xspeed - 1;
  }
  if (key == 'd') {
    minCar1.xspeed = minCar1.xspeed + 1;
  }

  if (key == 'e') {
    state = 2;
    timer = millis();
  }
}
