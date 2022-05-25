public class Board{
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
    for (int i=1;i<x-1;i++) {
      for (int j=1;j<y-1;j++) {
        board[i][j] = SPACE;
      }
    }
    for (int i=0;i<x;i++) {
      for (int j=0;j<y;j++) {
        if (board[i][j] != -2) {
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
  
  void tick(int tickSpeed) {
    
  }
}
