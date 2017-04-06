int[] a;
int head;

void stack_init() {
  a = new int[16];
  for (int i=0; i<a.length; i++) {
    a[i] = 0;
  }

  head = 0;
}

int stack_pushValue(int value) {
  if (head<16){
    a[head] = value;
    // quesiton #1
    head++;
  }
  return 0;
}

int stack_popValue() {
  int value;

  head--;
  value = a[head];
  a[head] = 0; // question #2
  //値を初期化できない
  //valueを正しく追加することができない
  //値を取り出すのは tail 方からになるが、新しい値を代入するのは途中からになってしまう
  
  return value;
}