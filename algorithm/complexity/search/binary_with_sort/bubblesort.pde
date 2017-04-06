void bubblesort(int[] a) {
  for (int i = 0; i < a.length - 1; i++) {
    for (int j = a.length - 1; j >= 1; j--) {
      if (a[j] < a[j-1]) {
        int tmp = a[j];
        a[j] = a[j-1];
        a[j-1] = tmp;
      }
    }
  }
}