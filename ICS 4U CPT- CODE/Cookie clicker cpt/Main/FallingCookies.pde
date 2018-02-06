class Ball {
  
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.1;
  }
  
  // so the cookie will move.
    void move() {
    // Add gravity to speed
    speed = speed + gravity; // like that y equation I had in testing.
    // Add speed to y location
    y = y + speed;
  }
  
  boolean finished() {
      return false; // meaning it is off the screen
  }
  
  // to actually show the cookie
  void display() {
    // Display the circle
    image (FallingCookieImage, x, y);
  }
}  // so where is this redrawing the background?? Need to ask mr.G to go over this with me!!