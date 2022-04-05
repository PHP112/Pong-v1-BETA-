private class Ball {
  //Variables
  private int ballX, ballY, ballMoveX, ballMoveY, directionX=0, directionY=0;
  private int ballSpeedX, ballSpeedY;
  private int ballStartX, ballStartY, ballDiameter; //Will be final variables
  private color colour, colourFillReset=#FFFFFF;
  private int scorePlayer1, scorePlayer2;
  private Boolean ballXGoal;
  //
  //int ballCount = 5; //requires pure java class for true static varaibles (does not need instantiated object)
  //needs to be coded first in Processing
  //
  //Constructor, populates the variables
  public Ball(float widthParameter, float heightParameter) { //Passsing Geometry
    ballStartX = int(widthParameter/2); //will begin as one varaible, but might change b/c easter egg
    ballStartY = int(heightParameter/2); //see above
    this.ballX = ballStartX; //ALways starts in middle
    this.ballY = ballStartY;
    this.ballXGoal = false;
    ballDiameter = int(widthParameter/70); //Will soon need a procedure for this or a choice of code
    float smallerNumber, largerNumber; //Geometry estimate of size
    if (widthParameter>=heightParameter) { // Speed multiplier
      largerNumber = widthParameter;
      smallerNumber = heightParameter;
    } else {
      largerNumber = heightParameter;
      smallerNumber = widthParameter;
    }//End larger number
    float geometryMultiplier = round ( largerNumber/1000 ); //Note: floor, round, ceiling
    if ( geometryMultiplier < 1 ) geometryMultiplier = 1;
    println(smallerNumber, largerNumber, geometryMultiplier);
    ballSpeedX = int( random (1, 5) ) * int ( geometryMultiplier ); //Not best practice to repeat code, but OK
    ballSpeedY = int( random (1, 5) ) * int ( geometryMultiplier ); //Here b/c "next line"
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
    //Background here will cover each individual ball
    fill(colour);
    ellipse(ballX, ballY, ballDiameter, ballDiameter);
    fill(colourFillReset); //Reset fill
  }//End ballDraw
  //
  private void gamePlay() {
    //Scoring on Left and Right Goals, resetting variables to decrease system resourses
    if ( ballX < (width*0)+ballDiameter || ballX > width - ballDiameter) { //Net Detection
      ballXGoal = true;
      if (ballX < (width*0)+ballDiameter ) { //Goal for left player
        ballX = (width*0)+(ballDiameter/4);
        ballY = ballY; //Variable becomes "final" here
      }
      if ( ballX > width - ballDiameter ) { //Goal for right player
        ballX = (width)-(ballDiameter/4);
        ballY = ballY; //Variable becomes "final" here
      }
    } //End Net Detection
    //
    //Top and Bottom Boundary Bounce, accounting for increased ball movement per "step"
    // Bounce of Top and Bottom: bounce is a range and we move the ball if out-of-bounds
    if ( (ballY >= height*0 && ballY <= height*0+ballDiameter) || ( ballY <= height && ballY >= height-ballDiameter ) ) directionY =  directionY * (-1);
    if ( ballY < 0 || ballY > height ) {
      directionY =  directionY * (-1);
      if (ballY < 0) ballY = height*0 - (ballDiameter/2);
      if (ballY > height) ballY = height - (ballDiameter/2);
    }
    //
    //Ball "Step"
    if (ballXGoal == true) { //EMPTY IF to skip ball arithmetic, when score happens
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
  void directionYSetter(int paddleXLeft, int paddleYLeft, int paddleXRight, int paddleYRight, int paddleWidth, int paddleHeight) {
    if (ballX <= width*1/4) { //Left Paddle Only
      if ( ballY >= paddleYLeft && ballY <= paddleYLeft+paddleHeight ) {
        if (ballX <= paddleXLeft+paddleWidth+ballDiameter ) directionX = directionX * (-1); //Could be one line, see below
      }//End ballY IF
    }
    //Right Paddle Only, one line example, cascading if
    if (ballX >= width*3/4) if ( ballY >= paddleYRight && ballY <= paddleYRight+paddleHeight ) if (ballX >= paddleXRight - ballDiameter) directionX = directionX * (-1); 
    //Simlified Further by &&, single conditional
    //Note: Prototype with if's, then simply conditional
  }//End directionYSetter
  //
}//End Ball
