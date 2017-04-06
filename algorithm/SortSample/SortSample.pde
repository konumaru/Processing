int value_max = 1000;
int trials = 500;
boolean result;

void setup() {
  validation();
  benchmarking();
}

void validation() {
  int array_size = 30;
  Validator validator = new Validator(array_size, value_max);
  result = validator.runTestSuite();
  if (result) {
    println("Validation has been finished successfully.");
  } else {
    println("Validation failed.");
  }
}

void benchmarking() {
  for (int N = 128; N <= 10000; N = N * 2) {
    int[] array = new int[N];

    int last_millis = millis();

    for (int t = 0; t < trials; t++) {
      TestDataSetters.set_random(array, value_max);
      mysort(array);
    }
    System.out.printf("%8d, %8d\n", N, millis() - last_millis);
  }
  println("done.");
}
