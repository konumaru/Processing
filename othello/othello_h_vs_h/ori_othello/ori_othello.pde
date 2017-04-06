final int BSIZE = 100;
int[][] field;
boolean bBlacksTurn;
 
void setup(){
  size(800, 800);
  bBlacksTurn = true;
  field = new int[8][8];
  for(int i=0; i<8; ++i){
    for(int j=0; j<8; ++j){
      if((i==3||i==4)&&(j==3||j==4)){
        field[i][j] = ((i+j)%2==0)?1:-1; // initial stones;
      }else{
        field[i][j] = 0;
      }
    }
  }
}
 
void draw(){
  //draw field
  background(0,160,0);
  stroke(0);
  for(int i=1; i<8; ++i){
    line(i*BSIZE,0,i*BSIZE,height);
    line(0, i*BSIZE, width, i*BSIZE);
  }
  noStroke();
  fill(0);
  ellipse(BSIZE*2,BSIZE*2,10,10);
  ellipse(BSIZE*6,BSIZE*2,10,10);
  ellipse(BSIZE*2,BSIZE*6,10,10);
  ellipse(BSIZE*6,BSIZE*6,10,10);
 
  // draw stones
  noStroke();
  for(int i=0; i<8; ++i){
    for(int j=0; j<8; ++j){
      if(field[i][j]==1){
        fill(0);
        ellipse((i*2+1)*BSIZE/2,(j*2+1)*BSIZE/2, BSIZE*0.8, BSIZE*0.8);
      }else if(field[i][j]==-1){
        fill(255);
        ellipse((i*2+1)*BSIZE/2,(j*2+1)*BSIZE/2, BSIZE*0.8, BSIZE*0.8);
      }
    }
  }
}
 
void mouseReleased(){
  int x = mouseX/BSIZE;
  int y = mouseY/BSIZE;
 
  boolean puttable = false;
  if(field[x][y]==0){
    puttable = checkDirection(x,y,-1,-1) | puttable;
    puttable = checkDirection(x,y,-1,0) | puttable;
    puttable = checkDirection(x,y,-1,1) | puttable;
 
    puttable = checkDirection(x,y,0,-1) | puttable;
    puttable = checkDirection(x,y,0,1) | puttable;
 
    puttable = checkDirection(x,y,1,-1) | puttable;
    puttable = checkDirection(x,y,1,0) | puttable;
    puttable = checkDirection(x,y,1,1) | puttable;
 
    if(puttable){
      field[x][y] = currentStone();
      bBlacksTurn = !bBlacksTurn;
    }
  }
}

boolean checkDirection(int x, int y, int directionX, int directionY){
  if(checkBound(x+directionX, y+directionY) && field[x+directionX][y+directionY] != currentStone()){
    return checkStones(x, y, directionX, directionY);
  }
  return false;
}

boolean checkStones(int x, int y, int directionX, int directionY){
  if(checkBound(x+directionX, y+directionY) && field[x+directionX][y+directionY]==currentStone()){ // find
    return true;
  }else if(checkBound(x+directionX, y+directionY) && field[x+directionX][y+directionY]==0){ // not find
    return false;
  }else if(checkBound(x+directionX, y+directionY) && checkStones(x+directionX, y+directionY, directionX, directionY)){ 
    field[x+directionX][y+directionY] = currentStone(); // reverse
    return true;
  }else{
    return false;
  }
}
 
boolean checkBound(int x, int y){
  return x>=0 && x<8 && y>=0 && y<8;
}
 
int currentStone(){
  return (bBlacksTurn)?1:-1;
}