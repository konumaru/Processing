int logsize = 32;
int[] logX;
int[] logY;
int loghead;
int logtail;

IntArrayViewer viewerX, viewerY;

void setup() {
  size(800, 600);

  logX = new int[logsize];
  logY = new int[logsize];
  loghead = 0;
  logtail = 1;

  viewerX = new IntArrayViewer(width, 60, 30, logX, width);
  viewerY = new IntArrayViewer(width, 60, 30, logY, width);

  frameRate(15);
}

void draw() {
  background(192);

  updateLog(mouseX, mouseY);
  stroke(0);
  fill(255);
  ellipse(logX[loghead], logY[loghead], 20, 20);
  fill(128);
  ellipse(logX[logtail], logY[logtail], 20, 20);

  viewerX.draw(logX, 0, 400);
  viewerY.draw(logY, 0, 500);
}

void updateLog(int headX, int headY) {
  // Update 'loghead' to the apropriate position.
  loghead++;
  loghead = loghead % (logsize);
  
  logX[loghead] = headX;
  logY[loghead] = headY;
  
  // Then update 'logtail' to the apropriate position.
  logtail = (loghead+1) % logsize;
}