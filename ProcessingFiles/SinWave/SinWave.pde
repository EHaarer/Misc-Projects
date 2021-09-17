import peasy.*;
PeasyCam cam;
//default is 14440, 50
int boxNum = 1440;
float boxWid = 50;
boolean circle = false;
float botate = 0.00;

Section[] boxes = new Section[boxNum];

color c = color(0);

void setup() {

  size(1000, 1000, P3D);
  background(0);
  for (float i = 0; i < boxNum; i++) {
    boxes[(int)i] = new Section(0, 0, 0);
  }

  cam = new PeasyCam(this, 1000);
}

float x = 0, xoff = 0;

void draw() {

  background(0);

  for (float i = 0; i < boxNum; i++) {

    rotateX(botate * map(i, 0, boxNum, 0, 360));

    rotateX(map(mouseX, 0, width, 0, 360));
    noStroke();
    boxes[(int)i].setCord(500 * sin(i), 0, 500 * cos(i));

    float u = dist(500 * cos(0), 500 * cos(0), boxes[(int)i].x, boxes[(int)i].x);


    //3 is last var or can be TWO_PI
    xoff = map(u, 0, 1000, 0, 3);

    float h = map(sin(x + xoff), -1, 1, 0, 400);

    c = color(map(h, 0, 400, 250, 0), map(h, 0, 400, 0, 50), map(h, 0, 400, 255, 250));
    //c = color(map(h, 0, 400, 0, 255), map(h, 0, 400, 0, 255), map(h, 0, 400, 0, 255));

    boxes[(int)i].create(h, boxWid, c);
  }

  x += .04;

  if (circle && botate < 1) {
    botate += .0000001;
  }
  if (!circle && botate > 0) {
    botate -= .0000001;
  }
}

void keyReleased() {

  if (key == TAB) {

    if (circle)
      circle = false;
    else
      circle = true;
  }
}
