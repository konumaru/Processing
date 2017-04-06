int trials = 100000;
int search_per_sort = 10000;
long compare_counter = 0;

void setup() {
  println("N, count, time(msec)");

  for (int N = 10; N <= 1000000; N = N * 10) {
    int[] array = new int[N];
    for (int i = 0; i < N; i++) {
      array[i] = (int)random(N);
    }
    bubblesort(array);
    int num_search = 0;

    int last_millis = millis();
    compare_counter = 0;

    for (int t = 0; t < trials; t++) {
      if (num_search >= search_per_sort) {
        for (int i = 0; i < N; i++) {
          array[i] = (int)random(N);
        }
        bubblesort(array);
        num_search = 0;
      }
      num_search++;
      int target = (int)random(N);
      binsearch(array, target);
    }
    System.out.printf("%8d, %12d, %8d\n", N, compare_counter, millis() - last_millis);
  }

  println("done.");
}
