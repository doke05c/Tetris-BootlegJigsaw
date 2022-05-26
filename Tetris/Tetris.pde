void setup() {
  size(960, 540);
}
void draw() {
  Board board = new Board();
  for (int i=0;i<board.getBoard().length;i++) {
    for (int j=0;j<board.getBoard()[0].length;j++) { //later, change for loop to not print wall
      float sz = 23; //square size (shortened for code visibility purposes.)
      fill(255);
      rect(10.0+i*sz, 10.0+j*sz, sz, sz);
      fill(0);
      text(board.getBoard()[i][j], 10.0+i*sz, 20.0+j*sz);
    }
  }
}

void keyPressed() {
}

static final int SPACE = -2;
static final int WALL = -1;
static final int CYAN_I = 0;
static final int PURPLE_T = 1;
static final int YELLOW_SQ = 2;
static final int BLUE_L1 = 3;
static final int ORANGE_L = 4;
static final int GREEN_Z1 = 5;
static final int RED_Z = 6;
