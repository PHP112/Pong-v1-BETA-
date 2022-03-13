void gameOn() {
  //Objects use variables to ID purpose of function
  ball();
  leftPaddleDraw(); //Another Purpose of developer-written functions
  rightPaddleDraw();
  line(x1LeftNet, y1LeftNet, x2LeftNet, y2LeftNet);
  line(x1RightNet, y1RightNet, x2RightNet, y2RightNet);
  line(x1MiddleLine, y1MiddleLine, x2MiddleLine, y2MiddleLine); //Needs to be dotted
  scoreBoardDraw();
}//End gameOn
