int logsize = 32;
int[] logX;
int[] logY;
int loghead;
int logtail;

void setup() {
  size(800, 600);

  logX = new int[logsize];
  logY = new int[logsize];
  loghead = 0;
  logtail = 1;

  frameRate(30);
}

void draw() {
  background(192);

  updateLog(mouseX, mouseY);
  stroke(0);

  fill(128);
  for (int i = 0; i < logsize; i += 8) {
    int p = (loghead + logsize - i) % logsize;
    ellipse(logX[p], logY[p], 20, 20);
  }
  fill(255);
  ellipse(logX[loghead], logY[loghead], 20, 20);
}

void updateLog(int headX, int headY) {
  loghead = logtail;

  logX[loghead] = headX;
  logY[loghead] = headY;

  logtail++;
  if (logtail >= logsize) {
    logtail = 0;
  }
}