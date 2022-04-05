private class Ball {
  //Variables
  private int ballX, ballY, ballMoveX, ballMoveY, directionX=0, directionY=0;
  private int ballSpeedX, ballSpeedY;
  private int ballStartX, ballStartY, ballDiameter;
  private color colour, colourFillReset=#FFFFFF;
  private int scorePlayer1, scorePlayer2;
  private Boolean ballXLeftGoal=false, ballXRightGoal=false;
  //
  //int ballCount = 5; //requires pure java class for true static varaibles (does not need instantiated object)
  //needs to be coded first in Processing
  //
  public Ball(float widthParameter, float heightParameter) { //Passsing Geometry
    ballStartX = int(widthParameter/2); 
    ballStartY = int(heightParameter/2);
    this.ballX = ballStartX; 
    this.ballY = ballStartY;
    this.ballXLeftGoal = false;
    this.ballXRightGoal = false;
    ballDiameter = int(widthParameter/70); 
    float smallerNumber, largerNumber; 
    if (widthParameter>=heightParameter) {
      largerNumber = widthParameter;
      smallerNumber = heightParameter;
    } else {
      largerNumber = heightParameter;
      smallerNumber = widthParameter;
    }//End larger number
    float geometryMultiplier = round ( largerNumber/1000 );
    ballSpeedX = int( random (1, 5) ) * int ( geometryMultiplier );
    ballSpeedY = int( random (1, 5) ) * int ( geometryMultiplier ); 
    colour = color(int( random(50, 200) ), int( random(50, 200) ), int( random(50, 200) ));
    while ( directionX == 0 ) { 
      directionX = int (random (-2, 2) );
    }//End WHILE
    while ( directionY == 0 ) { 
      directionY = int (random (-2, 2) );
    }//End WHILE
  }//End Constructor
  //
  public void draw() {
    ballDraw();
    gamePlay();
  }//End draw
  //
  private void ballDraw() {
    fill(colour);
    ellipse(ballX, ballY, ballDiameter, ballDiameter);
    fill(colourFillReset);
  }//End ballDraw
  //
  private void gamePlay() {
    if ( ballX < (width*0)+ballDiameter || ballX > width - ballDiameter) { //Net Detection
      if (ballX < (width*0)+ballDiameter ) { //Goal for left player
        ballXLeftGoal = true;
        ballX = (width*0)+(ballDiameter/4);
        ballY = ballY;
      }
      if ( ballX > width - ballDiameter ) { //Goal for right player
        ballXRightGoal = true;
        ballX = (width)-(ballDiameter/4);
        ballY = ballY;
      }
    } //End Net Detection
    //
    if ( (ballY >= height*0 && ballY <= height*0+ballDiameter) || ( ballY <= height && ballY >= height-ballDiameter ) ) directionY =  directionY * (-1);
    if ( ballY < 0 || ballY > height ) {
      directionY =  directionY * (-1);
      if (ballY < 0) ballY = height*0 - (ballDiameter/2);
      if (ballY > height) ballY = height - (ballDiameter/2);
    }
    //
    //Ball "Step"
    if (ballXLeftGoal == true || ballXRightGoal == true) { 
    } else {
      ballMoveX = ballSpeedX*directionX;
      ballMoveY = ballSpeedY*directionY;
      ballX += ballMoveX;
      ballY += ballMoveY;
    }
    //
  }//End gamePlay
  //
  int ballXGetter() {
    return ballX;
  }//End ballXGetter
  int ballYGetter() {
    return ballY;
  }//End ballYGetter
  int ballDiameterGetter() {
    return ballDiameter;
  }//End ballDiameterGetter
  Boolean ballLeftGoalGetter() { //Score Communication
    return ballXLeftGoal;
  }
  Boolean ballRightGoalGetter() { //Score Communication
    return ballXRightGoal;
  }
  void directionYSetter(int paddleXLeft, int paddleYLeft, int paddleXRight, int paddleYRight, int paddleWidth, int paddleHeight) {
    if (ballX <= width*1/4) { //Left Paddle Only
      if ( ballY >= paddleYLeft && ballY <= paddleYLeft+paddleHeight ) {
        if (ballX <= paddleXLeft+paddleWidth+ballDiameter ) directionX = directionX * (-1); 
      }//End ballY IF
    }
    if (ballX >= width*3/4) if ( ballY >= paddleYRight && ballY <= paddleYRight+paddleHeight ) if (ballX >= paddleXRight - ballDiameter) directionX = directionX * (-1); 
  }//End directionYSetter
  //
}//End Ball
