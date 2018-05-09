class Colors {
  int top_left_x, top_left_y, size_boxes, space_boxes, num_cols;
  Color_box [] color_boxes;
  int [] hexes;
  
  Colors(int top_left_x, int top_left_y, int size_boxes, int space_boxes, int num_cols, int [] hexes){
    this.top_left_x = top_left_x;
    this.top_left_y = top_left_y;
    this.size_boxes = size_boxes;
    this.space_boxes = space_boxes;
    this.num_cols = num_cols;
    this.hexes = hexes;
    // initialze color boxes to the size of hexes
    color_boxes = new Color_box[hexes.length];
  }
  
  // call to initialze all the color boxes
  void create(){
    // initialze column count, current x, and current y
    int col_count = 0, cur_x = top_left_x, cur_y = top_left_y;
    
    // loop through the hexes
    for (int i = 0; i < hexes.length; i++){
      // check if our column count has reached our number
      if (col_count == num_cols){
        // then, set col_count to 0
        col_count = 0;
        // and increment the current y
        cur_y = cur_y + size_boxes + space_boxes;
      }
      // calculate the x coordinate
      cur_x = top_left_x + col_count * (size_boxes + space_boxes);
      // initialize the color box using the gathered information
      color_boxes[i] = new Color_box(hexes[i], cur_x, cur_y, size_boxes, size_boxes);
      // increment the collumn count
      col_count += 1;      
    }
  }
  
  void print_to_screen(){
    for (int i = 0; i < color_boxes.length; i++){
      color_boxes[i].print_to_screen();
    }
  }
  
  int get_mouse_inside(){
    for (int i = 0; i < color_boxes.length; i++){
      if (color_boxes[i].mouse_inside()){
        return color_boxes[i].get_color();
      }
    }
    
    return 1000000000;
  }
}
