class Yarmulke{
  Round [] rounds;
  int default_color, num_rounds = 0;
  float xpos, ypos, stitch_r, d_between_rounds;
  int [] num_stitches;

  Yarmulke(int new_default_color, float new_xpos, float new_ypos, float new_stitch_r, float new_d_between_rounds, int [] new_num_stitches){
    default_color = new_default_color;
    xpos = new_xpos;
    ypos = new_ypos;
    stitch_r = new_stitch_r;
    d_between_rounds = new_d_between_rounds;
    num_stitches = new_num_stitches;
  }
  
  void create(){
    // set the current radius to the distance between rounds
    float current_radius = d_between_rounds;
    
    // initialize the rounds array to the length of num_stitches
    rounds = new Round [num_stitches.length];
    
    // loop through the num stitches in the array
    for (int i = 0; i < num_stitches.length; i++){
      // create a new round with the given variables in the number of stitches at i
      rounds[i] = new Round(current_radius, stitch_r, xpos, ypos, default_color, num_stitches[i]);
      // create the stitches for the round
      rounds[i].create_stitches();
      // increment the number of rounds
      num_rounds += 1;
      // increment the current radius
      current_radius += d_between_rounds;
    }
    
    //set the selected stitch to the first round
    rounds[0].start_increment();
    
    //sets up the double
    set_doubles();
  }
  
  void print_to_screen(){
    for (int i = 0; i < num_rounds; i++){
      rounds[i].print_to_screen();
    }
  }
  
  void change_color_if_mouse_inside(int clr){
    for (int i = 0; i < num_rounds; i++){
      rounds[i].change_color_if_mouse_inside(clr);
    }
  }  
  
  void increment_selected(){
    for (int i = 0; i < num_rounds; i++){
      // calculate return value of increment selected on each round
      int return_val = rounds[i].increment_selected();
      // if 0, everything worked well, return
      if (return_val == 0){
        return;
      } // if 1, selected is at the end of the round
      else if (return_val == 1){
        // check if it's the last round
        if (i == num_rounds -1){
          // then start the decrement of the last round
          rounds[num_rounds-1].start_decrement();
        } else {
          //otherwise, increment the next round and return
          rounds[i+1].start_increment();
          return;
        }
      }
    }
  }
  
   void decrement_selected(){
    for (int i = num_rounds - 1; i >= 0; i--){
      // calculate return value of increment selected on each round
      int return_val = rounds[i].decrement_selected();
      // if 0, everything worked well, return
      if (return_val == 0){
        return;
      } // if 1, selected is at the start of the round
      else if (return_val == 1){
        // check if it's the first  round
        if (i == 0){
          // then start the increment of the first round
          rounds[i].start_increment();  
        } else {
          //otherwise, decrement the previous round and return
          rounds[i-1].start_decrement();
          return;
        }
      }
    }
  }
  
  
  boolean change_round_if_mouse_inside(int clr){
    for (int i = 0; i < num_rounds; i++){
      if(rounds[i].check_if_mouse_inside_any()){
        rounds[i].set_round_color(clr);
        return true;
      }
    }
    
    return false;
  }
  
  void change_all_rounds(int clr){
    for (int i = 0; i < num_rounds; i++){
      rounds[i].set_round_color(clr);
    }
  }
  
  void set_doubles(){
    // doesn't need to check the first round
    for (int i = 1; i < num_rounds; i++){
      rounds[i].set_num_between_double(num_stitches[i - 1]);
    }
  }
}
