class IntArrayBarViewer {
  int[] prev;
  int screen_w;
  int screen_h;
  int bar_w;
  int value_max;
  int gap;
  int bar_margin_top;
  int bar_height_max;

  IntArrayBarViewer(int screen_w, int screen_h, int bar_w, int[] a, int value_max) {
    prev = new int[a.length];
    arrayCopy(a, prev);
    this.screen_w = screen_w;
    this.screen_h = screen_h;
    this.bar_w = bar_w;
    this.value_max = value_max;

    gap = 4;
    bar_height_max = screen_h * 8 / 10;
    bar_margin_top = (screen_h - bar_height_max) / 2;
  }

  void draw(int[] a, int ox, int oy) {
    pushMatrix();
    translate(ox, oy);

    noStroke();
    for (int i=0; i<a.length; i++) {
      int h = bar_height_max * a[i] / value_max;
      int x = (bar_w + gap) * i;
      int y = bar_margin_top + bar_height_max - h;
      if (a[i] != prev[i]) {
        prev[i] = a[i];
        fill(255, 64, 64);
      } else {
        fill(0);
      }
      rect(x, y, bar_w, h);
    }
    popMatrix();
  }

  void draw(int[] a, int ox, int oy, int focus) {
    draw(a, ox, oy);
    pushMatrix();
    translate(ox, oy);
    fill(255, 0, 0);
    ellipse((bar_w + gap) * focus + bar_w / 2, bar_margin_top + bar_height_max + bar_w / 2, bar_w, bar_w);
    fill(0);
    popMatrix();
  }
}

