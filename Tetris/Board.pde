 public class Board {
  private int score = 0;
  private int level = 1;
  private int linesCleared = 0;
  private int linesNeeded = 0;
  private int[][] board;
  private boolean lines2;
  private int howLong2;
  private boolean lines3;
  private int howLong3;
  private boolean lines4;
  private int howLong4;

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

  boolean getLines2(){return lines2;}
  boolean getLines3(){return lines3;}
  boolean getLines4(){return lines4;}

  public void shortHowLong2(){ howLong2 -= 1; if(howLong2 ==0) lines2 = false;}
  public void shortHowLong3(){ howLong3 -= 1; if(howLong3 ==0) lines3 = false;}
  public void shortHowLong4(){ howLong4 -= 1; if(howLong4 ==0) lines4 = false;}

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
  
  public void tSpinIncrement(){
   scoreIncrement(level*400);
  }
  
  void rowChecked() {
    if (level == 1) {
      linesNeeded = level*10;
    }
    ArrayList<Integer> toDelete = new ArrayList<Integer>();
    for (int i=1;i<board[0].length-1;i++) {
      boolean allFilled = true;
      for (int j=1;j<board.length-1;j++) {
        if (board[j][i] < STAMP || board[j][i] >= GHOST) {
          allFilled = false;
        }
      }
      if (allFilled) {toDelete.add(i);}
    }
    if (toDelete.size()==2) {
      scoreIncrement(level*100);
      lines2 = true;
      howLong2 = 90;
    }
    if (toDelete.size()==3) {
      scoreIncrement(level*200);
      lines3 = true;
      howLong3 = 90;
    }
    if (toDelete.size()==4) {
      scoreIncrement(level*400);
      lines4 = true;
      howLong4 = 90;
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
        case CYAN_I+GHOST:
          fill(127, 255, 255);
          break;
        case PURPLE_T:
          fill(255, 0, 255);
          break;
        case PURPLE_T+STAMP:
          fill(255, 0, 255);
          break;
        case PURPLE_T+GHOST:
          fill(255, 127, 255);
          break;
        case YELLOW_SQ:
          fill(255, 255, 0);
          break;
        case YELLOW_SQ+STAMP:
          fill(255, 255, 0);
          break;
        case YELLOW_SQ+GHOST:
          fill(255, 255, 127);
          break;
        case BLUE_L1:
          fill(0, 0, 255);
          break;
        case BLUE_L1+STAMP:
          fill(0, 0, 255);
          break;
        case BLUE_L1+GHOST:
          fill(127, 127, 255);
          break;
        case ORANGE_L:
          fill(255, 127, 0);
          break;
        case ORANGE_L+STAMP:
          fill(255, 127, 0);
          break;
        case ORANGE_L+GHOST:
          fill(255, 191, 127);
          break;
        case GREEN_Z1:
          fill(0, 255, 0);
          break;
        case GREEN_Z1+STAMP:
          fill(0, 255, 0);
          break;
        case GREEN_Z1+GHOST:
          fill(127, 255, 127);
          break;
        case RED_Z:
          fill(255, 0, 0);
          break;
        case RED_Z+STAMP:
          fill(255, 0, 0);
          break;
        case RED_Z+GHOST:
          fill(255, 127, 127);
          break;
        }
        rect(10.0+r*sz, 10.0+c*sz, sz, sz);
      }
    }
    textSize(25);
    text("Score: " + score, 300, 475);
    text("Level: " + level, 300, 495);
    text("Lines Cleared: " + linesCleared, 300, 515);
  }
  
}
