public class Board{
  private int score;
  private int level;
  private int tickSpeed;
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
}
