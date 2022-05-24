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
}
