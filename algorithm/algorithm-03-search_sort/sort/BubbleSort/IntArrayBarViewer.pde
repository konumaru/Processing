class IntArrayBarViewer {
  int[] array;
  int[] prev;
  int screen_w;
  int screen_h;
  int bar_w;
  int value_max;
  int bar_margin_top;
  int bar_height_max;
  int focus = 0;

  IntArrayBarViewer(int screen_w, int screen_h, int bar_w, int value_max) {
    this.screen_w = screen_w;
    this.screen_h = screen_h;
    this.bar_w = bar_w;
    this.value_max = value_max;

    bar_height_max = screen_h * 8 / 10;
    bar_margin_top = (screen_h - bar_height_max) / 2;
  }

  void setArray(int [] a) {
    array = a;
    prev = new int[a.length];
    arrayCopy(a, prev);
  }

  void draw(int ox, int oy) {
    pushMatrix();
    translate(ox, oy);

    // draw bars
    noStroke();
    for (int i=0; i<array.length; i++) {
      int h = bar_height_max * array[i] / value_max;
      int x = bar_w * i;
      int y = bar_margin_top + bar_height_max - h;
      if (array[i] != prev[i]) {
        prev[i] = array[i];
        fill(255, 64, 64);
      } else {
        fill(0);
      }
      rect(x, y, bar_w - 1, h);
    }

    // draw focused point
    fill(255, 0, 0);
    ellipse(bar_w * focus + bar_w / 2, bar_margin_top + bar_height_max + bar_w / 2, bar_w, bar_w);
    fill(0);

    popMatrix();
  }
}

