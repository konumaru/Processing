import java.awt.*; //これが要る
TextField inputLine = new TextField("inputNunber");
IntList numList;

void setup() {
  size(200, 100);
  numList = new IntList();
  String [] data = loadStrings( "data.txt" );
  for (int i=0; i<data.length; i++) {
    numList.append( int(data[i]) );
  }
  numList.sort();
  println(numList);
  setLayout(null);
  inputLine.setBounds(30, 37, 125, 25);
  add(inputLine);
} 

void mousePressed() {
  String iLine = inputLine.getText();
  int sosu = int(iLine);
  int flag = 0;
  if ( numList.hasValue( sosu ) ) {// 記憶にあるか確かめる
    numList.append( sosu );
    println(iLine + " a Prime Number!!");
  } else {// なかったら、思考
    for (int i=1; i<=sosu; i++) {
      if (sosu%i==0) flag++;
    }
    if (flag==2) {
      numList.append( sosu );
      println(iLine + " is a Prime Number!!");
      numSave();
    } else {
      println(iLine + " is not a Prime Number...");
    }
    flag = 0;
  }
}
/*
void keyPressed() {
 if (keyCode==ENTER) {
 String iLine = inputLine.getText();
 int sosu = int(iLine);
 int flag = 0;
 if ( numList.hasValue( sosu ) ) {// 記憶にあるか確かめる
 numList.append( sosu );
 println(iLine + " a Prime Number!!");
 } else {// なかったら、思考
 for (int i=1; i<=sosu; i++) {
 if (sosu%i==0) flag++;
 }
 if (flag==2) {
 numList.append( sosu );
 println(iLine + " is a Prime Number!!");
 numSave();
 } else {
 println(iLine + " is not a Prime Number...");
 }
 flag = 0;
 }
 }
 }
 */
void numSave() {
  //記憶する
  String [] saveData = new String[numList.size()];
  for (int i=0; i<numList.size (); i++) {
    saveData[i] = str( numList.get(i) );
  }
  saveStrings("./data.txt", saveData);
  println( "Done Saving" );
}

void draw() {
}