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
   board.rowChecked();
  //check for busy spots at the top of any column. if busy, reset the game.
  boolean anyAtTop = false;
  for(int i=0;i<board.getBoard().length;i++) {if (board.getBoard()[i][1] > 6) {anyAtTop = true;}}
  if (anyAtTop) {
    board = new Board();
  }
  textSize(20);
  text("Score: " + board.getScore(), 300, 475);
  text("Level: " + board.getLevel(), 300, 495);
  text("Lines Cleared: " + board.getLinesCleared(), 300, 515);
  text("Lines Needed: " + board.linesNeeded, 500, 515);

}


void keyPressed() {
  if (keyCode == DOWN) { //move down one space
    tee.move(board);
  } else if (keyCode == RIGHT) { //move right
    tee.move(1, 0, board);
  } else if (keyCode == LEFT) { //move left
    tee.move(-1, 0, board);
  } else if (keyCode == UP) { //rotate CW
    tee.rotate(true);
  } else if (key == 'z' || key == 'Z') { //rotate  CCW
    tee.rotate(false);
  } else if (key == ' ') { //soft drop
    int softDropCount = -1;
    while(tee.move(board)) {softDropCount++;}
    boolean anyNearSpawn = false; //check for busy spots near spawn, if exist, game will reset
    tee.stamp(board);
    board.scoreIncrement(softDropCount);
    for(int i=4;i<7;i++) {if (board.getBoard()[i][2] > 6) {anyNearSpawn = true;}}
    if (anyNearSpawn) {
      board = new Board();
      tee = new Piece(5, 1, (int)random(0,7));
    } else {
      tee = new Piece(5, 1, (int)random(0,7));  
    }
  } else if (keyCode == BACKSPACE) { //reset
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
