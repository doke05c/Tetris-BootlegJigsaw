public class Board {
  private int score = 0;
  private int level = 1;
  private int linesCleared = 0;
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
  }

  public void linesClearedIncrement() { 
    linesCleared++;
    if (linesCleared >= linesNeeded && level < 25) {
      levelIncrement();
      linesNeeded += 10;
    }
    scoreIncrement(level*100);
  }
  
  void rowChecked() {
    if (level == 1) {
      linesNeeded = level*10;
    }
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
    if (toDelete.size()==2) {
      scoreIncrement(level*100);
    }
    if (toDelete.size()==3) {
      scoreIncrement(level*200);
    }
    if (toDelete.size()==4) {
      scoreIncrement(level*400);
    }
    while (toDelete.size() > 0) {
       for (int j=toDelete.get(0);j>=2;j--) {
        for (int i=1;i<board.length-1;i++) {
          if (board[i][j-1]>=CYAN_I && board[i][j-1]<=RED_Z) {
            board[i][j] = SPACE;
          } else {
            board[i][j] = board[i][j-1];
          }
        }
      }
      toDelete.remove(0);
      linesClearedIncrement();
    }
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
    textSize(20);
    text("Score: " + score, 300, 475);
    text("Level: " + level, 300, 495);
    text("Lines Cleared: " + linesCleared, 300, 515);
  }
  
}
