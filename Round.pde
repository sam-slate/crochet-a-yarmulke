class Round {
  float round_r, stitch_r, xpos, ypos;
  int num_stitches, index_selected = -1;
  int default_clr;
  Stitch [] stitches;
  int num_between_double = 0;
  
  //constructor
  Round (float new_round_r, float new_stitch_r, float new_xpos, float new_ypos, int new_default_clr, int new_num_stitches){
    round_r = new_round_r;
    stitch_r = new_stitch_r;
    xpos = new_xpos;
    ypos = new_ypos;
    default_clr = new_default_clr;
    num_stitches = new_num_stitches;
    
    //initialize array of stitches
    stitches = new Stitch[num_stitches];
  }
  
  void create_stitches(){
    //set the angle that will increment
    float angle = 360;
    
    //determine how much it will increment
    float increment = 360.00/num_stitches;
    
    //loop through the stitches
    for (int i = 0; i < num_stitches; i++){
      //determine the xpos and ypos of the stitch using trig
      float s_xpos = xpos + cos(radians(angle))*round_r;
      float s_ypos = ypos + sin(radians(angle))*round_r;
      //set the values of the current stitch
      stitches[i] = new Stitch(stitch_r, s_xpos, s_ypos, default_clr);
      //increment the angle
      angle -= increment;
    }
  }
  
  void print_to_screen(){
    for (int i = 0; i < num_stitches; i++){
      stitches[i].print_to_screen();
    }
  }
  
  void change_color_if_mouse_inside(int clr){
    for (int i = 0; i < num_stitches; i++){
      if (stitches[i].check_if_mouse_inside()){
        stitches[i].change_color(clr);
      }
    }
  }
  
  boolean check_if_mouse_inside_any(){
    for (int i = 0; i < num_stitches; i++){
      if (stitches[i].check_if_mouse_inside()){
        return true;
      }
    }
    return false;
  }
  
  // returns -1 if no selected index, 0 if selected index can be moved, 1
  // if selected index reaches end of round
  int increment_selected(){
    // if no index is selected yet
    if (index_selected == -1){
      return -1;
    } // if the last index is selected 
    else if (index_selected == stitches.length - 1){
      // change the last index to not selected
      stitches[index_selected].change_selected(false);
      // set the index selected to default value
      index_selected = -1;
      // return 1
      return 1;
    } // otherwise
    else { 
      // set the current index to false
      stitches[index_selected].change_selected(false);
      // increment index
      index_selected += 1;
      // set the current index to true
      stitches[index_selected].change_selected(true);
      // return true
      return 0;
    }
  }
  
  // returns -1 if no selected index, 0 if selected index can be moved, 1
  // if selected index reaches start of round
  int decrement_selected(){
    // if no index is selected yet
    if (index_selected == -1){
      return -1;
    } // if the first index is selected 
    else if (index_selected == 0){
      // change the first index to not selected
      stitches[0].change_selected(false);
      // set the index selected to default value
      index_selected = -1;
      // return 1
      return 1;
    } // otherwise
    else { 
      // set the current index to false
      stitches[index_selected].change_selected(false);
      // decrement index
      index_selected -= 1;
      // set the current index to true
      stitches[index_selected].change_selected(true);
      // return true
      return 0;
    }
  }
  
  
  void start_increment(){
    stitches[0].change_selected(true);
    index_selected = 0;
  }
  
  void start_decrement(){
    stitches[num_stitches - 1].change_selected(true);
    index_selected = num_stitches - 1;
  }
  
  void set_round_color(int clr){
    for (int i = 0; i < num_stitches; i++){
      stitches[i].change_color(clr);
    } 
  }
  
  //sets the number between double value, takes in the number
  //of stitches in the previous round
  void set_num_between_double (int num_previous_round){
    int dif = num_stitches - num_previous_round;
    if (dif != 0){
      num_between_double = num_previous_round/dif;
    } else {
      num_between_double = 0;
    }
    
    // checks if there are any doubles
    if (num_between_double != 0){
      //sets the stitches that are doubles
      for (int i = 0; i < num_stitches; i++){
        if (i % num_between_double == 0){
           stitches[i].set_double_s(true); 
        }
      }
    }
  }
}
