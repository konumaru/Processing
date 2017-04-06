class Validator {
  int[] a;
  IntArrayBarViewer viewer;

  Validator(int size, IntArrayBarViewer v) {
    if (size < 20) size = 20;
    a = new int[size];
    viewer = v;
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
    viewer.setArray(a);
    int[] origin = sort(a);
    mysort(a, viewer);
    step();
    return validateArray(origin, a);
  }

  boolean case_primelength() {
    println("The length is prime number (19).");
    int[] a = new int[19];
    for (int i=0; i<a.length; i++) {
      a[i] = (i * 503) % 1000;
    }
    viewer.setArray(a);
    int[] origin = sort(a);
    mysort(a, viewer);
    step();
    return validateArray(origin, a);
  }

  boolean case_powerof2() {
    println("The length is power-of-two (16).");
    int[] a = new int[16];
    for (int i=0; i<a.length; i++) {
      a[i] = (i * 503) % 1000;
    }
    viewer.setArray(a);
    int[] origin = sort(a);
    mysort(a, viewer);
    step();
    return validateArray(origin, a);
  }

  boolean case_allsame() {
    println("All elements have the same number.");
    for (int i=0; i<a.length; i++) {
      a[i] = 500;
    }
    viewer.setArray(a);
    int[] origin = sort(a);
    mysort(a, viewer);
    step();
    return validateArray(origin, a);
  }

  boolean case_sorted() {
    println("Array is already sorted.");
    for (int i=0; i<a.length; i++) {
      a[i] = i * 19;
    }
    viewer.setArray(a);
    int[] origin = sort(a);
    mysort(a, viewer);
    step();
    return validateArray(origin, a);
  }

  boolean case_reversed() {
    println("Array is already sorted in descending order.");
    for (int i=0; i<a.length; i++) {
      a[i] = 500 - i * 10;
    }
    viewer.setArray(a);
    int[] origin = sort(a);
    mysort(a, viewer);
    step();
    return validateArray(origin, a);
  }

  boolean case_periodic() {
    println("Various periodic tables.");
    for (int period = 2; period < 11; period++) {
      for (int i=0; i<a.length; i++) {
        a[i] = (i * 97 % period) * 97;
      }
      viewer.setArray(a);
      int[] origin = sort(a);
      mysort(a, viewer);
      step();
      if (!validateArray(origin, a)) return false;
    }
    return true;
  }

  boolean monkeyTest() {
    for (int i=0; i<a.length; i++) {
      a[i] = (int)random(value_max);
    }
    viewer.setArray(a);
    int[] origin = sort(a);
    mysort(a, viewer);
    step();
    return validateArray(origin, a);
  }

  boolean validateArray(int [] origin, int[] subject) {
    for (int i=0; i<origin.length; i++) {
      if (origin[i] != subject[i]) {
        return false;
      }
    }
    return true;
  }
}

