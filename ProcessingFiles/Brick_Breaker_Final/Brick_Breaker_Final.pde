Ball bouncer;
Breakable[] b = new Breakable[20];
int lives = 3;
int score = 0;
Paddle movable;
String gameOver = "", finalScore = "";
int numTemp = 0;
tempBall temp;
boolean tempStarted = false;

int powPos = 2, newPos;

float tempX, tempY;

void setup() {
  size(620, 620, P3D); // y = 560: works
  background(0);
  //frameRate(5);

  b[0] = new Breakable(width/2-105, height/4, 100, 25, 1);
  b[1] = new Breakable(width/2, height/4, 100, 25, 1);
  b[2] = new Powerup(width/2+105, height/4, 100, 25, 1);
  b[3] = new Breakable(width/2+210, height/4, 100, 25, 1);
  b[4] = new Breakable(width/2-210, height/4, 100, 25, 1);

  b[5] = new Breakable(width/2-105, height/4-30, 100, 25, 2);
  b[6] = new Breakable(width/2, height/4-30, 100, 25, 2);
  b[7] = new Breakable(width/2+105, height/4-30, 100, 25, 2);
  b[8] = new Breakable(width/2+210, height/4-30, 100, 25, 2);
  b[9] = new Breakable(width/2-210, height/4-30, 100, 25, 2);

  b[10] = new Breakable(width/2-105, height/4-60, 100, 25, 3);
  b[11] = new Breakable(width/2, height/4-60, 100, 25, 3);
  b[12] = new Breakable(width/2+105, height/4-60, 100, 25, 3);
  b[13] = new Breakable(width/2+210, height/4-60, 100, 25, 3);
  b[14] = new Breakable(width/2-210, height/4-60, 100, 25, 3);

  b[15] = new Breakable(width/2-105, height/4-90, 100, 25, 4);
  b[16] = new Breakable(width/2, height/4-90, 100, 25, 4);
  b[17] = new Breakable(width/2+105, height/4-90, 100, 25, 4);
  b[18] = new Breakable(width/2+210, height/4-90, 100, 25, 4);
  b[19] = new Breakable(width/2-210, height/4-90, 100, 25, 4);

  bouncer = new Ball(3, 4, width/2, height/2, 20, color(255));
  movable = new Paddle (width/2, height/2 + height/3, 125, 25, 10);
  temp = new tempBall((int)(random(3, 10)), (int)(random(3, 10)), 10000, 10000, 20, color(255, 50, 50));

  //color((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
}


      //  Draw the Scene

void draw() {
  background(0);
  for (int i = 0; i < b.length; i++) {
    b[i].show();
    b[i].update();
    b[i].BounceBall(bouncer);
    b[i].BounceBall(temp);
  }
  b[2].Enactbreaking();

  movable.show();
  movable.update();
  movable.BounceBall(bouncer);
  movable.BounceBall(temp);

  bouncer.checkBoundries();
  temp.checkBoundries();

  if (lives > 0) {
    bouncer.move();
    bouncer.show();
    temp.move();
    temp.show();
    
  }
  if (lives == 0) {
    gameOver = "Game Over!";
    finalScore = "Final Score: " + score;
  }

  fill(255);
  textSize(50);
  text(gameOver, width/2 - 140, height/2 - 50); 
  textSize(32);
  text(finalScore, width/2 - 120, height/2 );
  
  textSize(25);
  text("Lives: " + lives, 50, height - 20);
  
  textSize(25);
  text("Score: " + score, width - 170, height - 20);
  
  int numNoDisplay = 0;
  
  for(int i = 0; i < b.length; i++) {
    if (b[i].display == false)
      numNoDisplay++;
  }
  
  if (numNoDisplay == b.length)
    reset();
    numNoDisplay = 0;
    
    if (tempStarted) {
    
      tempStarted = false;
      temp = new tempBall((int)(random(3, 10)), abs((int)(random(-10, -3))), width/2, height/2, 20, color(255, 50, 50));
      
    }
  }


          //  Movement of Blocks

void keyPressed() {
  if (key == 'd') {
    movable.moveLeft = true;
  }
  if (key == 'a') {
    movable.moveRight = true;
  }
}

void keyReleased() {

  if (key == 'd') {
    movable.moveLeft = false;
  }
  if (key == 'a') {
    movable.moveRight = false;
  }
}

         //  Advance to Next Level

void reset() {
    
  b[0] = new Breakable(width/2-105, height/4, 100, 25, 1);
  b[1] = new Breakable(width/2, height/4, 100, 25, 1);
  b[2] = new Powerup(width/2+105, height/4, 100, 25, 1);
  b[3] = new Breakable(width/2+210, height/4, 100, 25, 1);
  b[4] = new Breakable(width/2-210, height/4, 100, 25, 1);

  b[5] = new Breakable(width/2-105, height/4-30, 100, 25, 2);
  b[6] = new Breakable(width/2, height/4-30, 100, 25, 2);
  b[7] = new Breakable(width/2+105, height/4-30, 100, 25, 2);
  b[8] = new Breakable(width/2+210, height/4-30, 100, 25, 2);
  b[9] = new Breakable(width/2-210, height/4-30, 100, 25, 2);

  b[10] = new Breakable(width/2-105, height/4-60, 100, 25, 3);
  b[11] = new Breakable(width/2, height/4-60, 100, 25, 3);
  b[12] = new Breakable(width/2+105, height/4-60, 100, 25, 3);
  b[13] = new Breakable(width/2+210, height/4-60, 100, 25, 3);
  b[14] = new Breakable(width/2-210, height/4-60, 100, 25, 3);

  b[15] = new Breakable(width/2-105, height/4-90, 100, 25, 4);
  b[16] = new Breakable(width/2, height/4-90, 100, 25, 4);
  b[17] = new Breakable(width/2+105, height/4-90, 100, 25, 4);
  b[18] = new Breakable(width/2+210, height/4-90, 100, 25, 4);
  b[19] = new Breakable(width/2-210, height/4-90, 100, 25, 4);
  
  bouncer.moveX = abs(bouncer.moveX);
  bouncer.moveY = -1 * abs(bouncer.moveY);
  
  bouncer.x = bouncer.OGX;
  bouncer.y = bouncer.OGY;
  
  lives += 2;
  
  newPos = (int)(random(0, b.length));
  
  swapPos(b[powPos], b[newPos]);
  
}


 void swapPos(Block a, Block b) {
 
   tempX = a.x;
   a.x = b.x;
   b.x = tempX;
   
   tempY = a.y;
   a.y = b.y;
   b.y = tempY;
 
 }
