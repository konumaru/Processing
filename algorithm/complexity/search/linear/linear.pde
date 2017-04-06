int trials = 100000;
long compare_counter = 0;

void setup() {
  println("N, count, time(msec)");

  for (int N = 100; N <= 1000000; N = N * 10) {
    int[] array = new int[N];
    for (int i = 0; i < N; i++) {
      array[i] = i;
    }

    int last_millis = millis();
    compare_counter = 0;

    for (int t = 0; t < trials; t++) {
      int target = (int)random(N);
      for (int i = 0; i < N; i++) {
        compare_counter++;
        if (array[i] == target) {
          break;
        }
      }
    }
    System.out.printf("%8d, %12d, %8d\n", N, compare_counter, millis() - last_millis);
  }

  println("done.");
}