public class Board{
  private int score;
  private int level;
  private int tickSpeed = 1000;
  private int linesCleared;
  private int[][] board;
  
   public Board(int x, int y) {
    board = new int[x][y];
  }
  
  public Board() {
    this(10, 20);
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
    linesCleared++;
    if (level < 10) {
        
    }  
  }
}
