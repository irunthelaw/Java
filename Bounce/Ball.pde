class Ball {
  
  // Instance variables for position, movement, and appearance.
  float x, y, radius, vx, vy, ax, ay;
  color fillColor;
  
  // Full constructor
  Ball(float x, float y, float radius, float vx, float vy, float ax, float ay, color fillColor) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.vx = vx;
    this.vy = vy;
    this.ax = ax;
    this.ay = ay;
    this.fillColor = fillColor;
  }
  
  // Constructor with position, radius, and color (default velocities/accelerations to zero)
  Ball(float x, float y, float radius, color fillColor) {
    this(x, y, radius, 0, 0, 0, 0, fillColor);
  }
  
  // Default constructor
  Ball() {
    this(0, 0, 0, 0, 0, 0, 0, color(0));
  }
  
  // Draws the ball on the screen.
  void drawBall() {
    noStroke();
    fill(fillColor);
    // The circle function uses the center and a diameter.
    circle(x, y, radius * 2);
  }
  
  // Moves the ball, detects collisions, and creates a new ball when a collision occurs.
  // Returns true if a collision happened.
  boolean moveBall() {
    boolean collision = false;
    
    // Save the pre-collision velocity.
    float originalVx = vx;
    float originalVy = vy;
    
    // Update the ball's position.
    x += vx;
    y += vy;
    
    // Check for collision with the left wall.
    if (x - radius < 0) {
      x = radius;       // reposition inside
      vx *= -1;         // reverse horizontal velocity
      collision = true;
    }
    // Check for collision with the right wall.
    else if (x + radius > width) {
      x = width - radius;
      vx *= -1;
      collision = true;
    }
    
    // Check for collision with the top wall.
    if (y - radius < 0) {
      y = radius;
      vy *= -1;
      collision = true;
    }
    // Check for collision with the ground line (at 7/8 of the window height).
    else if (y + radius > height * 7 / 8) {
      y = height * 7 / 8 - radius;
      vy *= -1;
      collision = true;
    }
    
    // When a collision occurs, create a new ball.
    if (collision) {
      // Choose a random radius between 5 and 40.
      float newRadius = random(5, 40);
      // Choose a random color.
      color newColor = color(random(256), random(256), random(256));
      // Create the new ball at the current position with the pre-collision velocity.
      Ball newBall = new Ball(x, y, newRadius, originalVx, originalVy, 0, 0, newColor);
      // Add the new ball to the global ballList.
      ballList.add(newBall);
    }
    
    return collision;
  }
  
  // Optional setter methods:
  void setVelocity(float vx, float vy) {
    this.vx = vx;
    this.vy = vy;
  }
  
  void setRadius(float radius) {
    this.radius = radius;
  }
  
  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void setColor(color fillColor) {
    this.fillColor = fillColor;
  }
}
