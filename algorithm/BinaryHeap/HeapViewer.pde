class HeapViewer {
  /* FIXME: This class is specialized for ascending order */
  int circle_r;
  int branch_h;

  int deepest_lmn;
  int[] array;
  int array_size;

  void draw(int [] a, int size) {
    if (size <= 0) {
      return;
    }
    array = a;
    array_size = size;

    int depth = 31 - Integer.numberOfLeadingZeros(a.length - 1);
    deepest_lmn = 1<<depth;

    int t = deepest_lmn * 2 - 1;
    if (t < 3) {
      t = 3;
    }
    circle_r = width / t;

    t = depth + 1;
    if (t < 2) {
      t = 2;
    }
    branch_h = height / t;

    stroke(0);
    textAlign(CENTER, CENTER);
    textSize(circle_r / 2);

    drawLine(1, 0);
    drawElement(1, 0);
  }

  int drawLine(int i, int depth) {
    if (i >= deepest_lmn) {
      return elementPosition(i);
    }

    int x1 = drawLine(i * 2, depth + 1);
    int x2 = drawLine(i * 2 + 1, depth + 1);

    int x = (x1 + x2) / 2;
    int y = depth * branch_h + branch_h / 2;

    if (i * 2 <= array_size) {
      if (array[i] > array[i*2]) {
        stroke(255, 0, 0);
        strokeWeight(3);
      } else {
        stroke(0);
        strokeWeight(1);
      }
      line(x, y, x1, y + branch_h);
    }
    if (i * 2 + 1 <= array_size) {
      if (array[i] > array[i*2+1]) {
        stroke(255, 0, 0);
        strokeWeight(3);
      } else {
        stroke(0);        
        strokeWeight(1);
      }
      line(x, y, x2, y + branch_h);
    }

    return x;
  }

  int drawElement(int i, int depth) {
    int x;

    stroke(0);
    strokeWeight(1);
    if (i >= deepest_lmn) {
      x = elementPosition(i);
    } else {
      int x1 = drawElement(i * 2, depth + 1);
      int x2 = drawElement(i * 2 + 1, depth + 1);
      x = (x1 + x2) / 2;
    }

    int y = depth * branch_h + branch_h / 2;

    if (i <= array_size) {
      fill(255);
      ellipse(x, y, circle_r, circle_r);
      fill(0);
      text(array[i], x, y);
    }

    return x;
  }

  int elementPosition(int i) {
    if (deepest_lmn < 2) {
      return circle_r + circle_r / 2;
    }

    return (i - deepest_lmn) * 2 * circle_r + circle_r / 2;
  }
}
