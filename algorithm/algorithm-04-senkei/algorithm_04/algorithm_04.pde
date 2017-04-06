int trials = 100000;

void setup() {
  println("N, count, time(msec)");

  for (int N=10; N<=1000000; N=N*10) {
    int [] array = new int[N];
    for (int i=0; i<N; i++) {//線形探索で大事なところ
      array[i] = i;
    }
    
    int last_millis = millis();
    long compare_counter = 0;
    
    for (int t=0; t<trials; t++){
      int target =(int)random(N);
      for (int i=0; i<N; i++){
        compare_counter++;
        if (array[i] == target) break;
      }
    }
    println(N, compare_counter, millis()-last_millis);
  }
  
  println("done.");
}

/*
N,      count,      time(msec)
10      550240       10
100     5034243      8
1000    49929843     82
10000   501595911    765
100000  5001083221   7725
1000000 50081932532  76420
done.

*/