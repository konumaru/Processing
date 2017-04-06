int num_trials = 10000;

for (int n = 1; n<8; n++) {
  int length = (int)pow(10, n);
  println("Length: ", length);

  //initialize
  int[] array = new int[length];
  for (int i=0; i<length; i++) {
    array[i] = i;
  }
  
  // You may want to shuffle the array here.
  // Essentially it's meaningless for the purpose of this study, but try it.
  
  long sum = 0; // Use long, not int. Why? Try int.
  for(int i=0; i<num_trials; i++) {
    int target = (int)random(length);
    for(int x=0; x<length; x++) {
      if(array[x] == target) {
        sum += x;
        break;
      }
    }
  }
  println("Avg. cost: ", (float)sum / num_trials);
}

println("End.");