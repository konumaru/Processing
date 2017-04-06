class IntArrayViewer {
  int[] prev;
  int screen_w;
  int box_w;
  int box_h;
  int columns;
  int scope_head;
  int scope_tail;
  int scope_center;

  IntArrayViewer(int screen_w, int box_w, int box_h, int[] a) {
    prev = new int[a.length];
    arrayCopy(a, prev);
    this.screen_w = screen_w;
    this.box_w = box_w;
    this.box_h = box_h;

    columns = screen_w / box_w;
    scope_head = -1;
    scope_tail = -1;
    scope_center = -1;
  }

  void setScope(int head, int tail, int center) {
    scope_head = head;
    scope_tail = tail;
    scope_center = center;
  }
  
  void unsetScope() {
    setScope(-1, -1, -1);
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
      stroke(0);
      if (i >= scope_head && i <= scope_tail) {
        fill(64, 255, 64);
      } 
      else {
        fill(255);
      }
      rect(x, y, box_w, box_h);
      if(i == scope_center) {
        rect(x + 2, y + 2, box_w - 4, box_h - 4);
      }
      fill(0);
      text(a[i], x + box_w - 1, y);
    }
    popMatrix();
  }
}