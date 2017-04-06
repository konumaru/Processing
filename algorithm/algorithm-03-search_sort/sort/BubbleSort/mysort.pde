void mysort(int[] a, IntArrayBarViewer viewer) {
  step();
  for (int i = 0; i < a.length - 1; i++) {
    for (int j = a.length - 1; j >= 1; j--) {
      viewer.focus = j; // only for visualization
      if (a[j] < a[j-1]) {
        // swap two elements
        int tmp = a[j];
        a[j] = a[j-1];
        a[j-1] = tmp;
        step();
      }
    }
  }
}

