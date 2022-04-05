final int ballCount = 10;
Ball[] balls = new Ball[ballCount];
int ballCounter = balls.length - balls.length;
Paddle paddle;
Boolean[] leftScoreOff = new Boolean [balls.length];
Boolean[] rightScoreOff = new Boolean [balls.length];
//
void setup() {
  size (600, 500);
  balls[ballCounter] = new Ball(width, height); 
  paddle = new Paddle(width, height);
  ballCounter +=1;
  for (int i=0; i<balls.length; i++) {
    leftScoreOff[i] = false;
    rightScoreOff[i] = false;
  }
}//End setup()

void draw() {
  background(255);
  for ( int i = 0; i<ballCounter; i++ ) {
    balls[i].draw();
    balls[i].directionYSetter(paddle.paddleXLeftGetter(), paddle.paddleYLeftGetter(), paddle.paddleXRightGetter(), paddle.paddleYRightGetter(), paddle.paddleWidthGetter(), paddle.paddleHeightGetter());
    if ( balls[i].ballLeftGoalGetter() == true && leftScoreOff[i] == false ) {
      paddle.leftScoreSetter();
      leftScoreOff[i] = true;
    }
    if ( balls[i].ballRightGoalGetter() == true && rightScoreOff[i] == false ) {
      paddle.rightScoreSetter();
      rightScoreOff[i] = true;
    }
  }
  paddle.draw();
}//End draw()

void keyPressed() {
  if (key == CODED && key == 'W' || key == 'w') paddle.upLeftGetter();
  if (key == CODED && key == 'S' || key == 's') paddle.downLeftGetter();
  if (key == CODED && key == 'D' || key == 'd') paddle.stopLeftGetter();
  if (key == CODED && keyCode == UP) paddle.upRightGetter();
  if (key == CODED && keyCode == DOWN) paddle.downRightGetter();
  if (key == CODED && keyCode == LEFT) paddle.stopRightGetter();
}//End keyPressed

void mousePressed() {
  if ( ballCounter >= balls.length ) {
    exit();
  } else { 
    ballCounter += 1;
  }
  for ( int i = ballCounter-1; i<ballCounter; i++ ) {
    balls[i] = new Ball(width, height); 
    balls[i].draw();
  }
}//End mousePressed
