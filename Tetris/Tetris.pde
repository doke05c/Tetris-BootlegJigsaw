static final int SPACE = -2;
static final int WALL = -1;
static final int CYAN_I = 0;
static final int PURPLE_T = 1;
static final int YELLOW_SQ = 2;
static final int BLUE_L1 = 3;
static final int ORANGE_L = 4;
static final int GREEN_Z1 = 5;
static final int RED_Z = 6;

Board board = new Board();
ArrayList<Piece> piecelist = new ArrayList<Piece>();

void setup() {
  size(960, 540);
}
void draw() {
  piecelist.add(new Piece(5, 1, 1));
  //piecelist.get(0).move(board);
  for (int i=0;i<piecelist.size();i++) {
    for (int j=0;j<4;j++) {
      board.getBoard()[piecelist.get(i).getPositions().get(j)[0]][piecelist.get(i).getPositions().get(j)[1]] = piecelist.get(i).getType();
    }
  }
  for (int i=0;i<board.getBoard().length;i++) {
    for (int j=0;j<board.getBoard()[0].length;j++) { //later, change for loop to not print wall
      float sz = 23; //square size (shortened for code visibility purposes.)
      switch (board.getBoard()[i][j]) {
        case WALL:
          fill(128, 128, 128);
          break;
        case SPACE:
          fill(255);
          break;
        case CYAN_I:
          fill(0, 255, 255);
          break;
        case PURPLE_T:
          fill(255, 0, 255);
          break;
        case YELLOW_SQ:
          fill(255, 255, 0);
          break;
        case BLUE_L1:
          fill(0, 0, 255);
          break;
        case ORANGE_L:
          fill(255, 69, 0);
          break;
        case GREEN_Z1:
          fill(0, 255, 0);
          break;
        case RED_Z:
          fill(255, 0, 0);
          break;
      }
      rect(10.0+i*sz, 10.0+j*sz, sz, sz);
      //text(board.getBoard()[i][j], 10.0+i*sz, 20.0+j*sz);
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
