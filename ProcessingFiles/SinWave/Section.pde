class Section {
  
  float x, y, z;
  
  Section(float inx, float iny, float inz){
    x = inx;
    y = iny;
    z = inz;
  }
  
  void setCord(float inx, float iny, float inz) {
    x = inx;
    y = iny;
    z = inz;
  }
  
  void create (float H, float xz, color c) {
    pushMatrix();
    fill(c);
    translate(x, y, z);
    box(xz, H, xz);
    popMatrix();
  }
  
}
