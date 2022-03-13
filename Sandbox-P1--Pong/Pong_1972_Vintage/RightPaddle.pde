//Global Variables
int rightPaddleSpeed = 0;
Boolean rightPaddleUP=false, rightPaddleDOWN=false, singlePlayer=false;

void rightPaddleDraw() {
  rightPaddleStart();
  //
  if ( singlePlayer == true ) { //Single Player Mode
    yRightPaddle = yBall-heightPaddle*1/2; //try to use a more developed formula
  }//End Single Player  //
  if ( yRightPaddle < height*0) yRightPaddle = height*0;
  if ( yRightPaddle+heightPaddle > height) yRightPaddle = height-heightPaddle; //if yRightPaddle=height, hidden bug
  // 
  if ( rightPaddleUP==true ) yRightPaddle -= rightPaddleSpeed ; //yRightPaddle=yRightPaddle-1, yRightPaddle--
  if ( rightPaddleDOWN==true ) yRightPaddle += rightPaddleSpeed ;
  //
}//End rightPaddle

void rightPaddleKeyPressed() {
  //Left Paddle Speed, before Game Plays
  if ( rightPaddleSpeed==0 ) {
    if ( key=='J' || key=='j' ) { //For Single Player Mode
      singlePlayer = true;
      rightPaddleSpeed = 1; //Bug Exists: this is the gameOn() boolean
    }
    if ( key=='M' || key=='m' ) rightPaddleSpeed = 1;
    if ( key=='T' || key=='t' ) rightPaddleSpeed = 3;
    if ( key=='H' || key=='h' ) rightPaddleSpeed = 10;
  }
  //Right Paddle: UP, DOWN, LEFT Arrow Keys
  //Note: two variables true is a Logical Conflict for Paddle Movement
  //Paper & Pencil: true tables
  if ( key==CODED && keyCode==UP ) {
    rightPaddleUP=true;
    rightPaddleDOWN=false;
  }//End rightPaddleUP ; 
  if ( key==CODED && keyCode==DOWN ) {
    rightPaddleUP=false;
    rightPaddleDOWN=true;
  }//End rightPaddleDOWN
  if ( key==CODED && keyCode==LEFT ) {
    rightPaddleUP=false;
    rightPaddleDOWN=false;
  }//End rightsPaddleDOWN
  //
}//End rightPaddlekeyPressed

void rightPaddleStart() {
  rect(xRightPaddle, yRightPaddle, widthPaddle, heightPaddle);
}//End rightPaddleStart
