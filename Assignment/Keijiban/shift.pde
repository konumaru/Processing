class shift {
  int boardflag = 0;

  void flag() {
    boardflag = 1 - boardflag;
  }

  void left() {
    if ( boardflag == 0 ) board1.shiftToLeft(); 
    else if ( boardflag == 1 ) board2.shiftToLeft();
  }

  void right() {
    if ( boardflag == 0 ) board1.shiftToRight();
    else if ( boardflag == 1 ) board2.shiftToRight();
  }
}

