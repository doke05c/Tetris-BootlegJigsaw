public class Board {
  private int score;
  private int level;
  private int tickSpeed = 1000;
  private int linesCleared;
  private int linesNeeded = 0;
  private int[][] board;

  static final int SPACE = -2;
  static final int WALL = -1;

  public Board(int x, int y) {
    board = new int[x][y];
    //establishes free space, and border walls.
    for (int i=1; i<x-1; i++) {
      for (int j=1; j<y-1; j++) {
        board[i][j] = SPACE;
      }
    }
    for (int i=0; i<x; i++) {
      for (int j=0; j<y; j++) {
        if (board[i][j] != SPACE) {
          board[i][j] = WALL;
        }
      }
    }
  }

  public Board() {
    this(12, 22);//"edges" will be "taken up" by wall squares. do not display edges. meant to display as 10 x 20
  }

  int getScore() {
    return score;
  }
  int getLevel() {
    return level;
  }
  int getTickSpeed() {
    return tickSpeed;
  }
  int getLinesCleared() {
    return linesCleared;
  }
  int[][] getBoard() {
    return board;
  }

  public void scoreIncrement(int scoreAmt) {
    score += scoreAmt;
  }

  public void levelIncrement() {

    level++;
    if (level <= 15) {  
      tickSpeedIncrement();
    }
  }

  public void tickSpeedIncrement() {
    tickSpeed = (int)((float)tickSpeed / 1.35);
  }

  public void linesClearedIncrement() { 
    if (level < 25) {
      linesNeeded = (level-1)*10;
    }
    if (linesCleared > linesNeeded && level < 25) {
      levelIncrement();
    }
    linesCleared++;
    scoreIncrement(level*100);
  }
  
  void rowChecked() {
    ArrayList<Integer> toDelete = new ArrayList<Integer>();
    for (int i=1;i<board[0].length-1;i++) {
      boolean allFilled = true;
      for (int j=1;j<board.length-1;j++) {
        if (board[j][i] < STAMP) {
          allFilled = false;
        }
      }
      if (allFilled) {toDelete.add(i);}
    }
    while (toDelete.size() > 0) {
      for (int i=1;i<board.length-1;i++) {
        board[i][toDelete.get(0)] = SPACE;
      }
      // for (int j=toDelete.get(0);j>=2;j--) {
      //  for (int i=1;i<board.length-1;i++) {
      //    if (board[i][j-1]>=CYAN_I || board[i][j-1]<=RED_Z) {
      //      board[i][j] = SPACE;
      //    } else {
      //      board[i][j] = board[i][j-1];
      //    }
      //  }
      //}
      toDelete.remove(0);
    }
  }

  void tick(int tickSpeed) {
  }

  public void displayBoard() {
    for (int r=0; r<board.length; r++) {
      for (int c=0; c<board[0].length; c++) {
        float sz = 23;
        switch (board[r][c]) {
        case WALL:
          fill(128, 128, 128);
          break;
        case SPACE:
          fill(255);
          break;
        case CYAN_I:
          fill(0, 255, 255);
          break;
        case CYAN_I+STAMP:
          fill(0, 255, 255);
          break;
        case PURPLE_T:
          fill(255, 0, 255);
          break;
        case PURPLE_T+STAMP:
          fill(255, 0, 255);
          break;
        case YELLOW_SQ:
          fill(255, 255, 0);
          break;
        case YELLOW_SQ+STAMP:
          fill(255, 255, 0);
          break;
        case BLUE_L1:
          fill(0, 0, 255);
          break;
        case BLUE_L1+STAMP:
          fill(0, 0, 255);
          break;
        case ORANGE_L:
          fill(255, 69, 0);
          break;
        case ORANGE_L+STAMP:
          fill(255, 69, 0);
          break;
        case GREEN_Z1:
          fill(0, 255, 0);
          break;
        case GREEN_Z1+STAMP:
          fill(0, 255, 0);
          break;
        case RED_Z:
          fill(255, 0, 0);
          break;
        case RED_Z+STAMP:
          fill(255, 0, 0);
          break;
        }
        rect(10.0+r*sz, 10.0+c*sz, sz, sz);
      }
    }
  }
  
}
