// the ball floats
float x;
float y;
float xSpeed;
float ySpeed;

// creates a steady size for ball to be used for borders
int ballWidth = 40;
int ballHeight = 40;

// paddle size variables
int paddleWidth = 400;
int paddleHeight = 50; 


// score variables
int scoreCounter = 0;


void setup() {
  size(displayWidth, 1000);
  rectMode(CENTER);
  // sets a constant speed
  xSpeed = 3;
  ySpeed = 3;
  // set randomly above the middle of screen
  x = random(21, width-21);
  y = random(21, height/2);
}

void draw() {
  //gets rid of mouse on app
  noCursor();
  background(0);
  textSize(40);
  text("Score: " +scoreCounter, 20, 40);
  // moves the dot on screen
  x = x + xSpeed;
  y = y + ySpeed;
  fill(255);
  noStroke();
  ellipse(x, y, ballWidth, ballHeight);
  
  // adds borders to the dot and allows bounce
  // the ballWidth and ballHeight refines the borders to remove overlap of ball off screen
  if(x > width-ballWidth/2 || x < ballWidth/2) {
    xSpeed = -xSpeed;
  }
  if(y < 21) {
    ySpeed = -ySpeed;
  }
  rect(mouseX, height-25, paddleWidth, paddleHeight);
  
  // triple counditions need to be true for the paddle to reverse the balls direction
  // when the ball is hit, the score increases and the speed increases a little
  if(y > height-paddleHeight-25 && x > mouseX-paddleWidth/2 && x < mouseX + paddleWidth/2) {
    ySpeed = -ySpeed;
    scoreCounter = scoreCounter + 100;
    paddleWidth = paddleWidth - 10;
    ySpeed = ySpeed*1.1;
  }
  if(paddleWidth <= 70) {
    paddleWidth = 70;
  }
  //check to see if ball missed paddle
    if(y > height) {
    scoreCounter = 0;
    x = random(21, width-21);
    y = random(21, height/2);
    ySpeed = 3;
    paddleWidth = 400;
  }
  // tracks the x value like console.log
  println(x);
}
