import peasy.*;

PeasyCam cam;

//positions are the set positions of each 'city' that the path must take
PVector[] positions;
int numDots = 8;

float radius = 16;

//Sequence
int populationSize = 10000;

int[] sequence;
int[][] population;
float[] fitness;
int currentGen = 0;

PVector start;// = new PVector(.75 * random(-width/2, width/2), .75 * random(-height/2, height/2));//, .75 * random(0, 0));
PVector end;// = new PVector(.75 * random(-width/2, width/2), .75 * random(-height/2, height/2));//, .75 * random(0, 0));

//color c;

//int totalPermutations;
//int count = 0;


float recordDist = Integer.MAX_VALUE;
int[] bestEver;
int[] currentBest;
float popBestEnd = Integer.MAX_VALUE;

void setup() {
  size(800, 800, P3D);
  frameRate(100);
  cam = new PeasyCam(this, 1100);

  positions = new PVector[numDots];
  sequence = new int[numDots];
  bestEver = new int[numDots];
  population = new int[populationSize][numDots];
  fitness = new float[populationSize];
  start = new PVector(.95 * random(-width/2, width/2), .95 * random(-height/2, height/2)/*, .75 * random(-500, 500)*/);
  end = new PVector(.95 * random(-width/2, width/2), .95 * random(-height/2, height/2)/*, .75 * random(-500, 500)*/);
  for (int i = 0; i < numDots; i++) {
    positions[i] = new PVector(.95 * random(-width/2, width/2), .95 * random(-height/2, height/2)/*, random(-500, 500)*/);
    sequence[i] = i;
  }
//copies base array {0,1,2,3,4} and then makes copies of it, then shuffles!
  for (int i = 0; i < populationSize; i++) {
    arrayCopy(sequence, population[i]);
    shuffleSeq(population[i], 100);
  }
  
  for (int i = 0; i < populationSize; i++) {
    fitness[i] = 1 / calcDist(positions, population[i]);
    if (calcDist(positions, population[i]) < recordDist) {
      recordDist = calcDist(positions, population[i]);
      bestEver = population[i];
    }
  }

  //frameRate(5);

  recordDist = calcDist(positions, sequence);
  arrayCopy(sequence, bestEver);

  int totalPermutations = factorial(numDots);
  println(totalPermutations);
}

void draw() {
  background(0);

  //translate(width/2, height/2);

  //Genetic Algorithm Code
  calcFit();
  normalizeFit();
  //calcBest();
  nextGen();
  calcBest();

    noFill();
    stroke(50, 255, 50);
    strokeWeight(5);
    pushMatrix();
    translate(start.x, start.y/*, start.z*/);
    sphere(radius);
    popMatrix();

    stroke(255, 50, 50);
    pushMatrix();
    translate(end.x, end.y/*, end.z*/);
    sphere(radius);
    popMatrix();

    for (int i = 0; i < positions.length; i++) {
      noFill();
      stroke(255);
      pushMatrix();
      translate(positions[i].x, positions[i].y/*, positions[i].z*/);
      sphere(radius);
      popMatrix();
    }
  //Draws the current Best sequence
    stroke(50, 255, 255);
    strokeWeight(6);
    noFill();
    beginShape();
    vertex(start.x, start.y/*, start.z*/);
    for (int i = 0; i < sequence.length; i++) {
      int n = bestEver[i];
      vertex(positions[n].x, positions[n].y/*, positions[n].z*/);
    }
    vertex(end.x, end.y/*, end.z*/);
    endShape();
    
    textSize(25);
    fill(255);
    text("Overall Best:" + recordDist, -600, height / 2 + 100 );
    text("Current Generation: " + currentGen, -600, height / 2 + 125);
    
    //text("This Population's Best : " + popBestEnd,  -600, height / 2 + 150);
    
    //translate(0, height / 2);
  //Draws the current best path generated
    //stroke(180);
    //strokeWeight(1);
    //noFill();
    //beginShape();
    //vertex(start.x, start.y, start.z);
    //for (int i = 0; i < currentBest.length; i++) {
    //  int n = currentBest[i];
    //  vertex(positions[n].x, positions[n].y, positions[n].z);
    //}
    //vertex(end.x, end.y, end.z);
    //endShape();



  //  textSize(32);
  //  fill(255);
  //  float percent = 100 * ((float) count / (float) totalPermutations);
  //  if (percent >= 100) {
  //    percent = 100;
  //    text("completed", -600, height / 2 + 100);
  //}

//pushMatrix();
//translate(-400, height / 2);
//noFill();
//stroke(255);
//strokeWeight(5);
//box(100 * 4, 50, 50);
//popMatrix();

//pushMatrix();
//translate(-600+map(percent, 0, 100, 0, 200), height / 2);
//stroke(255);
//strokeWeight(5);
//fill(0, 255, 0);
//box(percent * 4, 50, 50);
//popMatrix();
}

void shuffleSeq(int[] a, int num) {
  for (int i = 0; i < num; i++) {
    int posA = (int)random(a.length);
    int posB = (int)random(a.length);
    swap(a, posA, posB);
  }
}


void swap(int[] a, int i, int j) {
  int temp = a[i];
  a[i] = a[j];
  a[j] = temp;
}

//calculates distance for a desired path
float calcDist(PVector[] points, int[] sequence) {
  float sum = 0;
  sum += dist(start.x, start.y, points[sequence[0]].x, points[sequence[0]].y/*, start.z, points[sequence[0]].z*/);
  for (int i = 0; i < sequence.length - 1; i++) {
    PVector planetA = points[sequence[i]];
    PVector planetB = points[sequence[i + 1]];
    float d = dist(planetA.x, planetA.y, planetB.x, planetB.y/*, planetA.z, planetB.z*/);
    sum += d;
  }
  sum += dist(points[sequence.length - 1].x, points[sequence.length - 1].y, end.x, end.y/*, points[sequence.length - 1].z, end.z*/);
  return sum;
}

int factorial(int n) {
  if (n == 1) {
    return 1;
  } 
  else {
    return n * factorial(n - 1);
  }
}
