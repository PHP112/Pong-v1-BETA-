private class Paddle {
  //Variables
  private color colour;
  private int paddleXLeft, paddleXRight, paddleYLeft, paddleYRight, paddleWidth, paddleHeight;
  private int yMove; //Possible Easteregg to move paddles differently requires two vars
  private boolean upLeft=false, downLeft=false, stopLeft=false, upRight=false, downRight=false, stopRight=false;

  //Constructor, populates the variables
  public Paddle (float widthParameter, float heightParameter) { //Passsing Geometry
    //Remember about night mode, no blue colour or increasing contrast or decreasing contrast
    this.colour = color (int(random(100, 255)), int(random(50, 255)), int(random(175, 255)));
    paddleWidth = int(widthParameter*1/80); //no "this" thus no change ever
    paddleXRight = int(widthParameter*39/40) - paddleWidth;
    paddleXLeft = int(widthParameter*1/40);
    paddleHeight = int(heightParameter*1/4);
    this.paddleYLeft = int(heightParameter*1/2) - paddleHeight*1/2;
    this.paddleYRight = paddleYLeft; 
    this.upLeft = false;
    this.downLeft = false;
    this.upRight = false;
    this.downRight = false;
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
    // Bouncing Off Left Paddle
    //
    // Bouncing off Right Paddle
    //
    // Moving Left Paddle
    //
    // Moving Right Paddle
    //
    // Redrawing Paddle if too High
    //
    // Redrawing Paddle if too Low
    //
  }//End gamePlay
  //
  // Getters and Setters
}//End Ball
