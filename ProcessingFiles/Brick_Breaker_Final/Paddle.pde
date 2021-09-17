
public class Paddle extends Block {

  boolean moveLeft = false;
  boolean moveRight = false;
  public int paddleSpeed;

  public Paddle(float inX, float inY, float inWidth, float inHeight, int inSpeed) {
    super(inX, inY, inWidth, inHeight, 1000);
    paddleSpeed = inSpeed;
  }

  void update() {
    //this.x = bouncer.x;
    if (moveLeft && this.x < width - wid/2)
      this.x += paddleSpeed;
    if (moveRight && this.x > 0 + wid/2)
      this.x -= paddleSpeed;
  }
}
