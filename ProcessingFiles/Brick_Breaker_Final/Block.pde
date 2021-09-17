

class Block {

  float x, y, wid, hei, dep;
  color c;
  int numHits, OGnumHits;

  boolean display = true;

  public Block(float inX, float inY, float inWidth, float inHeight, int inNumHits) {

    x = inX;
    y = inY;
    wid = inWidth;
    dep = inWidth;
    hei = inHeight;
    c = color(255);
    numHits = inNumHits;
    OGnumHits = numHits;
    
  }

  void setColor(color inColor) {

    c = inColor;
  }

  void show() {

    if (display) {
      pushMatrix();
      translate(x, y, 0);
      fill(c);
      stroke(0);
      box(wid, hei, dep);
      popMatrix();
    }
  }

  void BounceBall(Ball b) {
    if (this.display && (b.y > this.y - hei/2 && b.y < this.y + hei/2) && (b.x >= this.x - wid/2- b.r && b.x <= this.x + wid/2 + b.r)) {
      b.moveX *= -1;
      this.numHits--;
    }
    if (this.display && (b.x > this.x - wid/2 && b.x < this.x + wid/2) && (b.y >= this.y - hei/2- b.r && b.y <= this.y + hei/2 + b.r)) {
      b.moveY *= -1;
      this.numHits--;
    }
  }
}
