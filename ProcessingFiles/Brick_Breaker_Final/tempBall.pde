
public class tempBall extends Ball {

  public tempBall(int inMoveX, int inMoveY, int inX, int inY, int inR, color inC) {
    super(inMoveX, inMoveY, inX, inY, inR, inC);
  }
  
  void checkBoundries() {

    if (this.x >= width - r || this.x <= 0 + r) {
      moveX *= -1;
    }
    if (this.y <= 0 + r) {  // || this.y >= height - r)
      moveY *= -1;
    }
  }
  
  
}
