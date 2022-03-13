/* Note: uses Ball Subprogram Variables
 rigthGoalScore
 leftGoalScore
 */
//
void scoreBoardSetup() {
  textSetup();
}//End scoreBoardSetup()
//
void scoreBoardDraw() {
  //scoreBoardRect();
  if ( leftGoal == true ) {
    leftGoalScore=1;
    textDraw(height, purpleInk, CENTER, CENTER, titleFont, str(leftGoalScore), xLeftScore, yLeftScore, widthScore, heightScore);
  } else {
    textDraw(height, purpleInk, CENTER, CENTER, titleFont, str(leftGoalScore), xLeftScore, yLeftScore, widthScore, heightScore);
  }
  if ( rightGoal == true ) rightGoalScore=1;
  textDraw(height, purpleInk, CENTER, CENTER, titleFont, str(rightGoalScore), xRightScore, yRightScore, widthScore, heightScore);
}//End scoreBoardDraw
//
void scoreBoardRect() {
  rect(xLeftScore, yLeftScore, widthScore, heightScore);
  rect(xRightScore, yRightScore, widthScore, heightScore);
}//End scoreBoardRect
