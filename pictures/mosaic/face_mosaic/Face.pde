class Face {
  
  // A Rectangle
  Rectangle r;
  
  // Am I available to be matched?
  boolean available;
  
  // Should I be deleted?
  boolean delete;
  
  // How long should I live if I have disappeared?
  int timer = 127;
  
  // Assign a number to each face
  int id;
  
  // Make me
  Face(int newID, int x, int y, int w, int h) {
    r = new Rectangle(x,y,w,h);
    available = true;
    delete = false;
    id = newID;
  }

  // Show me
  void display() {
    fill(0,0,255,timer);
    stroke(0,0,255);
    rect(r.x,r.y,r.width, r.height);
    fill(255,timer*2);
    text(""+id,r.x+10,r.y+30);
  }

  // Give me a new location / size
  // Oooh, it would be nice to lerp here!
  void update(Rectangle newR) {
    r = (Rectangle) newR.clone();
  }

  // Count me down, I am gone
  void countDown() {
    timer--;
  }

  // I am deed, delete me
  boolean dead() {
    if (timer < 0) return true;
    return false;
  }
}