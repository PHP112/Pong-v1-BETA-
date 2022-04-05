private class Paddle {
  //Variables
  private color colour;
  private int paddleXLeft, paddleXRight, paddleYLeft, paddleYRight, paddleWidth, paddleHeight;
  private int yMove; //Possible Easteregg to move paddles differently requires two vars
  private boolean upLeft=false, downLeft=false, stopLeft=false, upRight=false, downRight=false, stopRight=false;

  //Constructor, populates the variables
  public Paddle (float widthParameter, float heightParameter) { //Passsing Geometry
    this.colour = color (int(random(100, 255)), int(random(50, 255)), int(random(175, 255)));
    paddleWidth = int(heightParameter*1/80); //no "this" thus no change ever
    paddleXRight = int(widthParameter*39/40) - paddleWidth;
    paddleXLeft = int(heightParameter*1/40);
    paddleHeight = int(heightParameter*3/4);
    this.paddleYLeft = int(heightParameter*1/2) - paddleHeight*1/2;
    this.paddleYRight = paddleYLeft; 
    this.upLeft = false;
    this.downLeft = false;
    this.stopLeft=false;
    this.upRight = false;
    this.downRight = false;
    this.stopRight=false;
    int paddleSpeed = 5; //Previously a User initiated value
    this.yMove = int( (heightParameter / heightParameter) * paddleSpeed);
  }//End Constructor
  //
  void draw() {
    //Background here will cover each individual ball
    fill(colour);
    gamePlay(); //Arithmetic Code, Security Feature
    rect (paddleXLeft, paddleYLeft, paddleWidth, paddleHeight);
    rect (paddleXRight, paddleYRight, paddleWidth, paddleHeight);
    fill(0); //Reset fill
  }//End draw
  //
  void gamePlay() {
    // Moving Left Paddle
    if ( upLeft == true && downLeft == false) {
      paddleYLeft -= yMove;
      stopLeft = false;
    }
    if (upLeft == false && downLeft == true) {
      paddleYLeft += yMove;
      stopLeft = false;
    }
    if ( stopLeft== true ) {
      upLeft = false;
      downLeft = false;
    }
    // Moving Right Paddle
    if ( upRight == true && downRight == false) {
      paddleYRight -= yMove;
      stopRight = false;
    }
    if (upRight == false && downRight == true) {
      paddleYRight += yMove;
      stopRight = false;
    }
    if ( stopRight== true ) {
      upRight = false;
      downRight = false;
    }
    // Redrawing Paddle if too High
    if ( paddleYLeft < height * 0) paddleYLeft = 0;
    if (paddleYLeft  > height - paddleHeight ) paddleYLeft = height - paddleHeight;
    //
    // Redrawing Paddle if too Low
    if ( paddleYRight < height * 0) paddleYRight = 0;
    if (paddleYRight > height - paddleHeight ) paddleYRight = height - paddleHeight;
    //
  }//End gamePlay
  //
  // Getters and Setters
  int paddleXLeftGetter() {
    return paddleXLeft;
  }//End Paddle X Left Getter
  int paddleXRightGetter() {
    return paddleXRight;
  }//End Paddle X Left Getter
  int paddleWidthGetter() {
    return paddleWidth;
  }//End Paddle X Left Getter
  int paddleYLeftGetter() {
    return paddleYLeft;
  }//End Paddle X Left Getter
  int paddleYRightGetter() {
    return paddleYRight;
  }//End Paddle X Left Getter
  int paddleHeightGetter() {
    return paddleHeight;
  }//End paddleHeight Getter
}//End Ball
