
public class Ball {

  float moveX, moveY, x, y, r, OGX, OGY;
  color c;

  public Ball(int inMoveX, int inMoveY, int inX, int inY, int inR, color inC) {

    moveX = inMoveX;
    moveY = -inMoveY;
    x = inX;
    y = inY;
    OGX = inX;
    OGY = inY;
    r = inR;
    c = inC;
  }

  void show() {

    pushMatrix();
    translate(x, y);
    stroke(c);
    fill(0);
    sphere(r);
    popMatrix();
  }

  void move() {
    if (lives > 0) {
      x += moveX;
      y += moveY;
    }
  }

  void checkBoundries() {

    if (this.x >= width - r || this.x <= 0 + r) {
      moveX *= -1;
    }
    if (this.y <= 0 + r) {  // || this.y >= height - r)
      moveY *= -1;
    }

    if (this.y > height + 200) {
      this.x = this.OGX;
      this.y = this.OGY;
      this.moveX = abs(moveX);
      this.moveY = abs(moveY) * -1;
      lives--;
    }
  }
}
