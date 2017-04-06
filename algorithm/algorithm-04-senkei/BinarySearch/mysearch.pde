int mysearch(int[] a, int target, IntArrayViewer viewer) {
  int left = 0;
  int right = a.length - 1;
  while (right >= left) {
    int i = (left + right) / 2;
    viewer.setScope(left, right, i);

    if (a[i] == target) {
      // found
      return i;
    } else if (a[i] > target) {
      // take the left side
      right = i - 1;
    } else {
      // take the right side
      left = i + 1;
    }
    step();
  }
  viewer.unsetScope();
  return -1;
}