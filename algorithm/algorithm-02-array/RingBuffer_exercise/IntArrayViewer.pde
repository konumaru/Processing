class IntArrayViewer {
  int[] prev;
  int screen_w;
  int box_w;
  int box_h;
  int columns;
  int value_max;

  IntArrayViewer(int screen_w, int box_w, int box_h, int[] a, int value_max) {
    prev = new int[a.length];
    arrayCopy(a, prev);
    this.screen_w = screen_w;
    this.box_w = box_w;
    this.box_h = box_h;
    this.value_max = value_max;

    columns = screen_w / box_w;
  }

  void draw(int[] a, int ox, int oy) {
    pushMatrix();
    translate(ox, oy);
    textSize(24);
    textAlign(RIGHT, TOP);

    stroke(0);
    for (int i=0; i<a.length; i++) {
      int x = (i % columns) * box_w;
      int y = (i / columns) * box_h;
      noStroke();
      fill(255);
      rect(x, y, box_w, box_h);
      fill(192, 192, 255);
      rect(x, y, box_w * a[i] / value_max, box_h);
      stroke(0);
      noFill();
      rect(x, y, box_w, box_h);
      fill(0);
      text(a[i], x + box_w - 1, y);

      if (prev[i] != a[i]) {
        prev[i] = a[i];
        strokeWeight(5);
        noFill();
        stroke(255, 0, 0);
        rect(x, y, box_w, box_h);
        strokeWeight(1);
      }
    }
    popMatrix();
  }

  void drawPointer(int idx, String label, int ox, int oy, int label_x) {
    stroke(0);
    pushMatrix();
    translate(ox, oy);
    textAlign(LEFT, BOTTOM);
    text(label, label_x, -10);
    int x = (idx % columns) * box_w;
    int y = (idx / columns) * box_h;
    line(label_x + 10, -10, x + box_w / 2, y + box_h / 2);
    popMatrix();
  }
}

