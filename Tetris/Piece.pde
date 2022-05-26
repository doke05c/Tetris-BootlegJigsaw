public class Piece {
  private ArrayList<int[]> positions; //arrays of size 2
  private int type; //piece type 0-6
  private int x;
  private int y;

  static final int CYAN_I = 0;
  static final int PURPLE_T = 1;
  static final int YELLOW_SQ = 2;
  static final int BLUE_L1 = 3;
  static final int ORANGE_L = 4;
  static final int GREEN_Z1 = 5;
  static final int RED_Z = 6;

  int getType() { //accessor
    return type;
  }

  public Piece(int xPos, int yPos, int type, int rotate) {
    //xPos yPos are coords on the board
    //type = piece
    if (type==CYAN_I) {
      if (rotate ==0) {
        positions.add(new int[] {xPos, yPos+1}); //top most square
        positions.add(new int[] {xPos, yPos});
        positions.add(new int[] {xPos, yPos-1});
        positions.add(new int[] {xPos, yPos-2});
      }
      if (rotate==1) {
        positions.add(new int[] {xPos+1, yPos}); //top most square
        positions.add(new int[] {xPos, yPos});
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos-2, yPos});
      }
    } else if (type==PURPLE_T) {
      if (rotate==0) {
        positions.add(new int[] {xPos, yPos}); //top most square
        positions.add(new int[] {xPos, yPos+1});
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos+1, yPos});
      }
      if (rotate==1) {
        positions.add(new int[] {xPos, yPos}); //top most square
        positions.add(new int[] {xPos, yPos-1});
        positions.add(new int[] {xPos, yPos+1});
        positions.add(new int[] {xPos+1, yPos});
      }
      if (rotate==2) {
        positions.add(new int[] {xPos, yPos}); //top most square
        positions.add(new int[] {xPos, yPos-1});
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos+1, yPos});
      }
      if (rotate==3) {
        positions.add(new int[] {xPos, yPos}); //top most square
        positions.add(new int[] {xPos, yPos-1});
        positions.add(new int[] {xPos, yPos+1});
        positions.add(new int[] {xPos-1, yPos});
      }
    } else if (type==YELLOW_SQ) {
      positions.add(new int[] {xPos, yPos}); //top right most square
      positions.add(new int[] {xPos-1, yPos});
      positions.add(new int[] {xPos-1, yPos-1});
      positions.add(new int[] {xPos, yPos-1});
    } else if (type==BLUE_L1) {
      if (rotate==0) {
        positions.add(new int[] {xPos, yPos}); //top right most square
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos-1, yPos+1});
        positions.add(new int[] {xPos+1, yPos});
      }
      if (rotate==1) {
        positions.add(new int[] {xPos, yPos}); //top right most square
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos+1, yPos+1});
        positions.add(new int[] {xPos+1, yPos});
      }
      if (rotate==2) {
        positions.add(new int[] {xPos, yPos}); //top right most square
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos+1, yPos-1});
        positions.add(new int[] {xPos+1, yPos});
      }
      if (rotate==3) {
        positions.add(new int[] {xPos, yPos}); //top right most square
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos-1, yPos-1});
        positions.add(new int[] {xPos+1, yPos});
      }
    } else if (type==ORANGE_L) {
      if (rotate==0) {
        positions.add(new int[] {xPos, yPos}); //top right most square
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos+1, yPos+1});
        positions.add(new int[] {xPos+1, yPos});
      }
      if (rotate==1) {
        positions.add(new int[] {xPos, yPos}); //top right most square
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos+1, yPos-1});
        positions.add(new int[] {xPos+1, yPos});
      }
      if (rotate==2) {
        positions.add(new int[] {xPos, yPos}); //top right most square
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos-1, yPos-1});
        positions.add(new int[] {xPos+1, yPos});
      }
      if (rotate==3) {
        positions.add(new int[] {xPos, yPos}); //top right most square
        positions.add(new int[] {xPos-1, yPos});
        positions.add(new int[] {xPos-1, yPos+1});
        positions.add(new int[] {xPos+1, yPos});
      }
    } else if (type==GREEN_Z1) {
      if (rotate==0) {
        positions.add(new int[] {xPos+1, yPos+1}); //top right most square
        positions.add(new int[] {xPos, yPos+1});
        positions.add(new int[] {xPos, yPos});
        positions.add(new int[] {xPos-1, yPos});
      }
      if (rotate==1) {
        positions.add(new int[] {xPos, yPos+1}); //top most square
        positions.add(new int[] {xPos, yPos});
        positions.add(new int[] {xPos+1, yPos});
        positions.add(new int[] {xPos+1, yPos-1});
      }
    } else if (type==RED_Z) {
      if (rotate==0) {
        positions.add(new int[] {xPos, yPos+1}); //top right most square
        positions.add(new int[] {xPos-1, yPos+1});
        positions.add(new int[] {xPos, yPos});
        positions.add(new int[] {xPos+1, yPos});
      }
      if (rotate==1) {
        positions.add(new int[] {xPos+1, yPos+1}); //top most square
        positions.add(new int[] {xPos+1, yPos});
        positions.add(new int[] {xPos, yPos});
        positions.add(new int[] {xPos, yPos-1});
      }
    }
  }

  public Piece(int xPos, int yPos, int type) {
    this(xPos, yPos, type, 0);
  }
  
  public boolean move(int x, int y, Board board) {
   //if the intended space any of the bricks of the Piece wants to take up on the Board is busy (wall or other Pieces), deny move() the right to move the Piece.
    for (int i=0;i<positions.size();i++) {
      if (board.getBoard()[positions.get(i)[0]+x][positions.get(i)[1]+y] > 0) {
        return false;
      } else {
        //otherwise, simply move the Piece according to the parameters
        positions.get(i)[0] = positions.get(i)[0]+x;
        positions.get(i)[1] = positions.get(i)[1]+y;
      }
    }
    this.x += x;
    this.y += y;
    return true;
  }
  
  public boolean move(Board board) {
    //default move function called by tick() when Piece acts solely according to gravity.
    return move(0, 1, board);
  }
}
