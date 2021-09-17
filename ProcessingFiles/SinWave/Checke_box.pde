class checker {
  
  boolean val = false;
  color c = color(50);
  
  void create (float x, float y) {
    
    float rectX = 20;
    float rectY = 20;
    
    stroke(255);
    fill(c);
    
    rect(x, y, rectX, rectY);
    
    if (mousePressed && mouseButton == LEFT && mouseX >= x && mouseX <= x + rectX && mouseY <= y + rectY && mouseY >= y - rectY){
      if (val == false){
        val = true;
        c = color(0, 240, 0);
      }
      else {
        val = false;
        c = color(50);
      }
      
    }
    
    //text('c', x + 30, y - 30);
    
  }
  
}
