int binsearch(int[] a, int target) {
  int left = 0;
  int right = a.length - 1;
  while (right >= left) {
    int i = (left + right) / 2;

    compare_counter++;
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
  }
  return -1;
}
