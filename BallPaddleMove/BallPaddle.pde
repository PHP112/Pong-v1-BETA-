/* To Do
 Ball Collisions
 Pseudocode other class
 Configuring the Game - setting initial variables (i.e. paddle speed)
 Screen Saver Pong or 1-Player Pong: paddle.y=ball.y
 */

/* Notes
 - Spawning Ball Instances: separating Setup() from draw() from mousePressed()
 - See ballCounter Variable in driver global variables
 - Note: should be static, encapsulated variable in Ball Class (note difference from final variable)
 */

//Global Variables and Ovjects
final int ballCount = 10; //Hack of Static Variable (not the same as static)
Ball[] balls = new Ball[ballCount]; //Not just an array, but an array list
int ballCounter = balls.length - balls.length; // How to get "Zero but use another value"
Paddle paddle;
//
void setup() {
  size (600, 500); //fullScreen(), displayWidth, displayHeight;
  //
  balls[ballCounter] = new Ball(width, height); 
  paddle = new Paddle(width, height); //For the Constructor
  //
  ballCounter +=1;
}//End setup()

void draw() {
  background(255);
  for ( int i = 0; i<ballCounter; i++ ) { //Controls each ball
    balls[i].draw(); //Variables and Contructor
    balls[i].directionYSetter(paddle.paddleXLeftGetter(), paddle.paddleYLeftGetter(), paddle.paddleXRightGetter(), paddle.paddleYRightGetter(), paddle.paddleWidthGetter(), paddle.paddleHeightGetter());
    //Ball knows when to bounce
  }
  paddle.draw();
}//End draw()

void keyPressed() {
  if (key == CODED && key == 'W' || key == 'w') paddle.upLeftGetter(); //Security Feature
  if (key == CODED && key == 'S' || key == 's') paddle.downLeftGetter(); //Security Feature
  if (key == CODED && key == 'D' || key == 'd') paddle.stopLeftGetter(); //Security Feature
  if (key == CODED && keyCode == UP) paddle.upRightGetter(); //Security Feature
  if (key == CODED && keyCode == DOWN) paddle.downRightGetter(); //Security Feature
  if (key == CODED && keyCode == LEFT) paddle.stopRightGetter(); //Security Feature
}//End keyPressed

void mousePressed() {
  //println(ballCounter);
  if ( ballCounter >= balls.length ) { //Game Quit based on ball counting
    exit(); //Eventually will become a button
  } else { 
    ballCounter += 1; //Note: sequentially, this incrementing creates a problem for the next for loop
    // Thus, the FOR Loop deals with the difference between human and computer numbering.
  }
  for ( int i = ballCounter-1; i<ballCounter; i++ ) { //Constructor for other balls should not be run
    balls[i] = new Ball(width, height); 
  }
}//End mousePressed
