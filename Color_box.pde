class Color_box{
  int clr, xpos, ypos, h, w;
  
  Color_box(int clr, int xpos, int ypos, int h, int w){
    this.clr = clr;
    this.xpos = xpos;
    this.ypos = ypos;
    this.h = h;
    this.w = w;
  }
  
  void print_to_screen(){
    rectMode(CORNER);
    fill(clr);
    rect(xpos, ypos, w, h);
  }
  
  int get_color(){
    return clr;
  }
  
  boolean mouse_inside(){
    if (mouseX >= xpos && mouseX <= xpos + w && mouseY >= ypos && mouseY <= ypos + h){
      return true;
    } else {
      return false;
    }
  }
}
