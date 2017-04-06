import java.util.Arrays;

class Validator {
  int[] a;
  int value_max;

  Validator(int size, int value_max) {
    if (size < 20) size = 20;
    a = new int[size];
    this.value_max = value_max;
  }

  boolean runTestSuite() {
    if (!case_sorted()) return false;
    if (!case_reversed()) return false;
    if (!case_oneelement()) return false;
    if (!case_primelength()) return false;
    if (!case_powerof2()) return false;
    if (!case_allsame()) return false;
    if (!case_periodic()) return false;
    return true;
  }

  boolean case_oneelement() {
    println("Array contains only one element.");
    int[] a = new int[1];
    a[0] = 0;
    int[] origin = sort(a);
    mysort(a);
    return validateArray(origin, a);
  }

  boolean case_primelength() {
    println("The length is prime number (19).");
    int[] a = new int[19];
    for (int i=0; i<a.length; i++) {
      a[i] = (i * 503) % 1000;
    }
    int[] origin = sort(a);
    mysort(a);
    return validateArray(origin, a);
  }

  boolean case_powerof2() {
    println("The length is power-of-two (16).");
    int[] a = new int[16];
    for (int i=0; i<a.length; i++) {
      a[i] = (i * 503) % 1000;
    }
    int[] origin = sort(a);
    mysort(a);
    return validateArray(origin, a);
  }

  boolean case_allsame() {
    println("All elements have the same number.");
    TestDataSetters.set_allsame(a);
    int[] origin = sort(a);
    mysort(a);
    return validateArray(origin, a);
  }

  boolean case_sorted() {
    println("Array is already sorted.");
    TestDataSetters.set_sorted(a, 19);
    int[] origin = sort(a);
    mysort(a);
    return validateArray(origin, a);
  }

  boolean case_reversed() {
    println("Array is already sorted in descending order.");
    TestDataSetters.set_reversed(a, 19);
    int[] origin = sort(a);
    mysort(a);
    return validateArray(origin, a);
  }

  boolean case_periodic() {
    println("Various periodic tables.");
    for (int period = 2; period < 11; period++) {
      for (int i=0; i<a.length; i++) {
        a[i] = (i * 97 % period) * 97;
      }
      int[] origin = sort(a);
      mysort(a);
      if (!validateArray(origin, a)) return false;
    }
    return true;
  }

  boolean monkeyTest() {
    TestDataSetters.set_random(a, value_max);
    int[] origin = sort(a);
    mysort(a);
    return validateArray(origin, a);
  }

  boolean validateArray(int [] origin, int[] subject) {
    boolean result = true;
    for (int i=0; i<origin.length; i++) {
      if (origin[i] != subject[i]) {
        result = false;
        break;
      }
    }
    if (!result) {
      println("!!! Invalid result !!!");
      println("Result  : " + Arrays.toString(subject));
      println("Expected: " + Arrays.toString(origin));
    }
    return result;
  }
}