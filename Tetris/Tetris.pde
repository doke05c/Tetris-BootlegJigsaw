Board board = new Board();
Piece tee = new Piece(5, 1, (int)random(0,7));
ArrayList<Piece> piecelist = new ArrayList<Piece>();
boolean hasStored = false;

void setup() {
  size(960, 540);
  piecelist.add(tee);
}
void draw() {
  background(255);
  board.displayBoard();
   for (int j=0;j<4;j++) {
     board.getBoard()[piecelist.get(0).getPositions().get(j)[0]][piecelist.get(0).getPositions().get(j)[1]] = piecelist.get(0).getType();
   }
   board.rowChecked();
  //check for busy spots at the top of any column. if busy, reset the game.
  boolean anyAtTop = false;
  for(int i=0;i<board.getBoard().length;i++) {if (board.getBoard()[i][1] > 6) {anyAtTop = true;}}
  if (anyAtTop) {
    board = new Board();
    piecelist = new ArrayList<Piece>();
    piecelist.add(new Piece(5, 1, (int)random(0,7)));
  }
  if (piecelist.size() >= 2) {
    textSize(20);
    switch(piecelist.get(1).getType()) {
      case(CYAN_I):
        text("Storage: I-Piece", 300, 400);
        break;
      case(PURPLE_T):
        text("Storage: T-Piece", 300, 400);
        break;
      case(YELLOW_SQ):
        text("Storage: Square-Piece", 300, 400);
        break;
      case(BLUE_L1):
        text("Storage: Blue L-Piece", 300, 400);
        break;
      case(ORANGE_L):
        text("Storage: Orange L-Piece", 300, 400);
        break;
      case(GREEN_Z1):
        text("Storage: Green Z-Piece", 300, 400);
        break;
      case(RED_Z):
        text("Storage: Red Z-Piece", 300, 400);
        break;
    }
  }
}


void keyPressed() {
  if (keyCode == DOWN) { //move down one space
    board.scoreIncrement(1);
    piecelist.get(0).move(board);
  } else if (keyCode == RIGHT) { //move right
    piecelist.get(0).move(1, 0, board);
  } else if (keyCode == LEFT) { //move left
    piecelist.get(0).move(-1, 0, board);
  } else if (keyCode == UP) { //rotate CW
     piecelist.get(0).rotate(true);
  } else if (key == 'z' || key == 'Z') { //rotate  CCW
     piecelist.get(0).rotate(false);
  } else if (key == ' ') { //soft drop
    int softDropCount = -1;
    while(piecelist.get(0).move(board)) {softDropCount++;}
    boolean anyNearSpawn = false; //check for busy spots near spawn, if exist, game will reset
    piecelist.get(0).stamp(board);
    hasStored = false;
    board.scoreIncrement(softDropCount);
    for(int i=4;i<7;i++) {if (board.getBoard()[i][2] > 6) {anyNearSpawn = true;}}
    if (anyNearSpawn) {
      //textSize(250);
      //text("LOSER", 25, height-50);
      board = new Board();
      piecelist = new ArrayList<Piece>();
      piecelist.add(new Piece(5, 1, (int)random(0,7)));
      piecelist.set(0, new Piece(5, 1, (int)random(0,7)));
    } else {
      piecelist.set(0, new Piece(5, 1, (int)random(0,7)));
    }
  } else if (keyCode == BACKSPACE) { //reset
    board = new Board();
    piecelist = new ArrayList<Piece>();
    piecelist.add(new Piece(5, 1, (int)random(0,7)));
  } else if (key == 'c' || key == 'C') { //switch with storage
    if (hasStored == false) {
      if (piecelist.size() < 2) {
        piecelist.add(1, new Piece(5, 1, (int)random(0,7)));
      }
      for (int i=0;i<4;i++) {
        board.getBoard()[piecelist.get(0).getPositions().get(i)[0]][piecelist.get(0).getPositions().get(i)[1]] = SPACE;
      }
      Piece temp = piecelist.get(1);
      piecelist.set(1, piecelist.get(0));
      piecelist.set(0, temp);
      hasStored = true;
    }
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
