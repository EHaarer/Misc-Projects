
public class Powerup extends Breakable {

  boolean hasBroken = false;

  public Powerup(float inX, float inY, float inWidth, float inHeight, int inNumHits) {

    super(inX, inY, inWidth, inHeight, inNumHits);
  }

  void Enactbreaking() {

    if  (this.display == false && !hasBroken) {

      int randomChoice = (int)random(1, 4);

      if (randomChoice == 1)
        movable.wid *= 1.5;
      if (randomChoice == 2)
        lives += 3;
      if (randomChoice == 3)
        tempStarted = true;
      hasBroken = true;
    }
  }

  void update() {

    if (this.numHits == 0 && canSpeed) {
      this.display = false;
      bouncer.moveX *= 1.05;
      bouncer.moveY *= 1.05;
      score += 100;
      canSpeed = false;
    }

    this.setColor(color(50, 50, 255));
  }
} 
