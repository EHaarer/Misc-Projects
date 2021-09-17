

class Breakable extends Block {

  boolean canSpeed = true;

  public Breakable(float inX, float inY, float inWidth, float inHeight, int inNumHits) {
    super(inX, inY, inWidth, inHeight, inNumHits);
  }

  void update() {

    if (this.numHits <= 0 && canSpeed) {
      this.display = false;
      bouncer.moveX *= 1.02;
      bouncer.moveY *= 1.02;
      score += 100;
      canSpeed = false;
    }

    this.setColor(color(map(this.numHits, 1, 4, 50, 255), map(this.numHits, 1, 4, 255, 50), map(this.numHits, 1, 4, 0, 0)));
  }

  void Enactbreaking() {
  }
}
