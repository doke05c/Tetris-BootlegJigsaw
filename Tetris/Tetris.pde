void setup() {
  size(960, 540);
}
void draw() {
  Board board = new Board();
  for (int i=0;i<board.getBoard().length;i++) {
    for (int j=0;j<board.getBoard()[0].length;j++) {
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
