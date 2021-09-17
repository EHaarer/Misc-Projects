// Code and methods used to make the genetic algorithm

void calcFit() {
  for (int i = 0; i < population.length; i++) {
    fitness[i] = 1 / (calcDist(positions, population[i]) + 1);//add 1 later if it doesnt work at all
    //^plus one^ is to make sure the math doesn't mess up, so fitness works in all situations (IE calcDist = 0)
  }
}

void normalizeFit() {
  int sum = 0;
  for (int i = 0; i < fitness.length; i++) {
    sum += fitness[i];
  }

  for (int i = 0; i < fitness.length; i++) {
    fitness[i] /= sum;
  }
}

void nextGen() {
  currentGen++;

  int[][] newPop = new int[populationSize][numDots];

  //newPop[0] = bestEver;
  for (int i = 0; i < population.length; i++) {
    int[] example1 = poolSelect(population, fitness);
    int[] example2 = poolSelect(population, fitness);
    int[] example = crossover(example1, example2);
    mutate(example, .15);
    newPop[i] = example;
  }

  population = newPop;
}

void calcBest() {
  float popBest = Integer.MAX_VALUE;
  for (int i = 0; i < population.length; i++) {
    if (calcDist(positions, population[i]) < recordDist) {
      recordDist = calcDist(positions, population[i]);
      bestEver = population[i];
      println(recordDist);
      println("Current Generation: " + currentGen);
      println();
    }

    if (calcDist(positions, population[i]) < popBest) {
      popBest = calcDist(positions, population[i]);
      currentBest = population[i];
    }
  }
}

void mutate(int[] a, float rate) {
  float chooser = random(1);
  float randomChoose = random(1);
  if (chooser > 0.5) {
    for (int i = 0; i < numDots; i++) {
      if (rate > randomChoose) {
        int pos1 = (int)(random(a.length));
        int pos2 = (int)(random(a.length));
        swap(a, pos1, pos2);
      }
    }
  }
}



int[] poolSelect(int[][]group, float[] prob) {
  int index = 0;
  float ran = random(1);

  for (int i = 0; i < prob.length; i++) {
    if (ran > 0) {
      ran -= prob[i];
      if (ran <= 0) {
        index = i;
      }
    }
  }

  //while (ran > 0) {
  //  ran -= prob[index];
  //  index ++;
  //}
  //if (index > 0) {
  //  index--;
  //}

  int[] temp = new int[group[index].length];
  arrayCopy(group[index], temp);
  return temp;
}

int[] crossover(int[] a, int[] b) {
  int startInd = (int)(random(a.length));
  int stopInd = (int)(random(startInd+1, a.length));
  //int[] crossFront = new int[(stopInd - startInd)];
  int[] crossFront = subset(a, startInd, stopInd - startInd);

  int[] crossBack = new int[numDots - crossFront.length];

  int tempIndex = 0;
  for (int i = 0; i < b.length; i++) {
    if (notInArray(b[i], crossFront)) {
      crossBack[tempIndex] = b[i];
      tempIndex++;
    }
  }

  int[] finalCross = concat(crossFront, crossBack);

  return finalCross;
}

boolean notInArray(int num, int[] list) {

  for (int i = 0; i < list.length; i++) {

    if (list[i] == num)
      return false;
  }

  return true;
}

//void addToNextOpen(int num, int[] list) {

//  int i  = 0;

//  while (list[i] != null) {

//    i++;

//  }

//}
