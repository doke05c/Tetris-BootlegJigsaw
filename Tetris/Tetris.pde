Board board = new Board();
Piece tee = new Piece(5, 1, PURPLE_T);
void setup() {
  size(960, 540);
}
void draw() {
  background(255);
  board.displayBoard();
   for (int j=0;j<4;j++) {
     board.getBoard()[tee.getPositions().get(j)[0]][tee.getPositions().get(j)[1]] = tee.getType();
   }
    //tee.move(board);
}


void keyPressed() {
  //if (key == ' ') {
    tee.move(board);
  //} else if (key == ' ')
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
