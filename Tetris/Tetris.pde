Board board = new Board();
Piece tee = new Piece(5, 1, (int)random(0,7));
void setup() {
  size(960, 540);
}
void draw() {
  background(255);
  board.displayBoard();
   for (int j=0;j<4;j++) {
     board.getBoard()[tee.getPositions().get(j)[0]][tee.getPositions().get(j)[1]] = tee.getType();
   }
}


void keyPressed() {
  if (keyCode == DOWN) {
    tee.move(board);
  } else if (keyCode == RIGHT) {
    tee.move(1, 0, board);
  } else if (keyCode == LEFT) {
    tee.move(-1, 0, board);
  } else if (keyCode == UP) {
    tee.rotate(true);
  } else if (key == 'z' || key == 'Z') {
    tee.rotate(false);
  } else if (key == ' ') {
    while(tee.move(board)) {
    }
    tee.stamp(board);
  } else if (keyCode == BACKSPACE) {
    board = new Board();
  }
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
static final int STAMP = 7;
