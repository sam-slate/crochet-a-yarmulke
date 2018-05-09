class Stitch {
  float r, xpos, ypos;
  int clr;
  boolean selected, double_s;
  
  Stitch (float new_r, float new_xpos, float new_ypos, int new_clr){
    r = new_r;
    xpos = new_xpos;
    ypos = new_ypos;
    clr = new_clr;
    selected = false;
    double_s = false;
  }
  
  void set_values (float new_r, float new_xpos, float new_ypos, int new_clr){
    r = new_r;
    xpos = new_xpos;
    ypos = new_ypos;
    clr = new_clr;
  }
  
  void print_to_screen(){
    if (selected){
      if (double_s){
        fill(#e01f02);
      } else {
        fill(#f4e542);
      }
      ellipseMode(CENTER);
      ellipse(xpos, ypos, r*3, r*3);
    }
    fill(clr);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, r*2, r*2);
  }
  
  boolean check_if_mouse_inside(){
    float d = sqrt(sq(mouseX - xpos) + sq(mouseY - ypos));
    if (d <= r){
      return true;
    } else {
      return false;
    }
  }
  
  void change_color(int new_clr){
    clr = new_clr;
  }
  
  void change_selected(boolean new_value){
    selected = new_value;
  }
  
  void set_double_s(boolean new_val){
    double_s = new_val;
  }
}
