void queue_init() {
  a = new int[16];
  queue_reset();
}

void queue_reset() {
  for (int i=0; i<a.length; i++) {
    a[i] = 0;
  }

  head = 0;
  tail = 0;
}

int queue_enqValue(int value) {
  head = head % a.length;
  a[head] = value;
  head++;
  // question #1

  return 0;
}

int queue_deqValue() {
  int value = 0; //question #2
  a[tail] = 0; //question #3
  //必要ないかも... リングバッファだと必要なのかも
  tail++;
  if (tail >= a.length) {
    tail = 0;
  }
  return value;
}