void nextsequence() {
  //count++;
  
  //Credit to Professor Michal Forišek, who came up with this lexicographic algorithm for permutations of a given sequence
  //I got this permutation algorithm from:
    // https://www.quora.com/How-would-you-explain-an-algorithm-that-generates-permutations-using-lexicographic-ordering
  
  // STEP 1: find int in sequence in such a way that the next int is larger than it, but the int after that is smallerthan the one before.
  //If no int is found that meets such criteria, then all permutations have run their course. (think: 1,2,3 -> 3,2,1 should be last permutation)
  int largestI = -1;
  for (int i = 0; i < sequence.length - 1; i++) {
    if (sequence[i] < sequence[i + 1]) {
      largestI = i;
    }
  }
  if (largestI == -1) {
    println("finished");
  }
  if (largestI != -1) {
    // STEP 2 next, find the next largest number so that this new number 
    int largestJ = -1;
    for (int j = 0; j < sequence.length; j++) {
      if (sequence[largestI] < sequence[j]) {
        largestJ = j;
      }
    }
    // STEP 3
    swap(sequence, largestI, largestJ);

    // STEP 4: reverse from largestI + 1 to the end
    int size = sequence.length - largestI - 1;
    int[] endArray = new int[size];
    arrayCopy(sequence, largestI + 1, endArray, 0, size);
    endArray = reverse(endArray);
    arrayCopy(endArray, 0, sequence, largestI+1, size);
    println(sequence);
  }
}
