import java.util.Arrays;

static class TestDataSetters {
  static void set_allsame(int[] array) {
    for (int i=0; i<array.length; i++) {
      array[i] = 500;
    }
  }

  static void set_sorted(int[] array, int scale) {
    for (int i=0; i<array.length; i++) {
      array[i] = i * scale;
    }
  }

  static void set_sorted(int[] array) {
    set_sorted(array, 1);
  }

  static void set_reversed(int[] array, int scale) {
    for (int i=0; i<array.length; i++) {
      array[i] = (array.length - i) * scale;
    }
  }

  static void set_reversed(int[] array) {
    set_reversed(array, 1);
  }

  static void set_periodic_data(int[] array, int period) {
    for (int i=0; i<array.length; i++) {
      array[i] = (i * 97 % period) * 97;
    }
  }

  static void set_random(int[] array, int value_max) {
    for (int i=0; i<array.length; i++) {
      array[i] = (int)(Math.random() * value_max);
    }
  }
}