public class Piece {
  private ArrayList<int[]> positions = new ArrayList<int[]>(); //arrays of size 2
  private int type; //piece type 0-6
  private int rotation;
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
  int getRotation() { //accessor
    return rotation;
  }

  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  ArrayList<int[]> getPositions() {
    return positions;
  }

  void stamp(Board cBoard) {
    for (int sq = 0; sq<positions.size(); sq++) {
      cBoard.getBoard()[positions.get(sq)[0]][positions.get(sq)[1]]=type;
    }
    for (int r=3; r>=0; r++) {
      positions.remove(r);
    }
  }

  void rotate(boolean direction) {
    if (direction) {
      if (rotation!=3)rotation+=1;//make sure to loop over for 3
      else rotation=0;
    } else {
      if (rotation!=0)rotation-=1;//make sure to loop over for 0
      else rotation =3;
    }
    //this = new Piece(x, y, type, rotation);//call with new rotation
    for (int i=0;i<4;i++) {
      board.getBoard()[positions.get(i)[0]][positions.get(i)[1]] = SPACE;
    }
    Piece temp = new Piece(x, y, type, rotation);
    positions= temp.positions;
  }

  public Piece(int xPos, int yPos, int type, int rotate) {
    //xPos yPos are coords on the board
    //type = piece
    rotation = rotate;
    x = xPos;
    y = yPos;
    this.type = type;
    if (positions.size()==0) {
      positions.add(new int[] {xPos, yPos}); 
      positions.add(new int[] {xPos, yPos}); 
      positions.add(new int[] {xPos, yPos}); 
      positions.add(new int[] {xPos, yPos});
    }
    if (type==CYAN_I) {
      if (rotate ==0 || rotate==2) {
        positions.set(0, new int[] {xPos, yPos+1}); //top most square
        positions.set(1, new int[] {xPos, yPos});
        positions.set(2, new int[] {xPos, yPos-1});
        positions.set(3, new int[] {xPos, yPos-2});
      }
      if (rotate==1 || rotate==3) {
        positions.set(0, new int[] {xPos+1, yPos}); //top most square
        positions.set(1, new int[] {xPos, yPos});
        positions.set(2, new int[] {xPos-1, yPos});
        positions.set(3, new int[] {xPos-2, yPos});
      }
    } else if (type==PURPLE_T) {
      if (rotate==0) {
        positions.set(0, new int[] {xPos, yPos}); //bottom right
        positions.set(1, new int[] {xPos, yPos+1});
        positions.set(2, new int[] {xPos-1, yPos});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==1) {
        positions.set(0, new int[] {xPos, yPos}); //top most square
        positions.set(1, new int[] {xPos, yPos-1});
        positions.set(2, new int[] {xPos, yPos+1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==2) {
        positions.set(0, new int[] {xPos, yPos}); //top most square
        positions.set(1, new int[] {xPos, yPos-1});
        positions.set(2, new int[] {xPos-1, yPos});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==3) {
        positions.set(0, new int[] {xPos, yPos}); //top most square
        positions.set(1, new int[] {xPos, yPos-1});
        positions.set(2, new int[] {xPos, yPos+1});
        positions.set(3, new int[] {xPos-1, yPos});
      }
    } else if (type==YELLOW_SQ) {
      positions.set(0, new int[] {xPos, yPos}); //top right most square
      positions.set(1, new int[] {xPos-1, yPos});
      positions.set(2, new int[] {xPos-1, yPos-1});
      positions.set(3, new int[] {xPos, yPos-1});
    } else if (type==BLUE_L1) {
      if (rotate==0) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos-1, yPos+1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==1) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos+1, yPos+1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==2) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos+1, yPos-1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==3) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos-1, yPos-1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
    } else if (type==ORANGE_L) {
      if (rotate==0) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos+1, yPos+1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==1) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos+1, yPos-1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==2) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos-1, yPos-1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==3) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos-1, yPos+1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
    } else if (type==GREEN_Z1) {
      if (rotate==0 || rotate==2) {
        positions.set(0, new int[] {xPos+1, yPos+1}); //top right most square
        positions.set(1, new int[] {xPos, yPos+1});
        positions.set(2, new int[] {xPos, yPos});
        positions.set(3, new int[] {xPos-1, yPos});
      }
      if (rotate==1 || rotate==3) {
        positions.set(0, new int[] {xPos, yPos+1}); //top most square
        positions.set(1, new int[] {xPos, yPos});
        positions.set(2, new int[] {xPos+1, yPos});
        positions.set(3, new int[] {xPos+1, yPos-1});
      }
    } else if (type==RED_Z) {
      if (rotate==0 || rotate==2) {
        positions.set(0, new int[] {xPos, yPos+1}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos+1});
        positions.set(2, new int[] {xPos, yPos});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==1 || rotate==3) {
        positions.set(0, new int[] {xPos+1, yPos+1}); //top most square
        positions.set(1, new int[] {xPos+1, yPos});
        positions.set(2, new int[] {xPos, yPos});
        positions.set(3, new int[] {xPos, yPos-1});
      }
    }
  }

  public Piece(int xPos, int yPos, int type) {
    this(xPos, yPos, type, 0);
  }

  public boolean move(int x, int y, Board board) {
    //if the intended space any of the bricks of the Piece wants to take up on the Board is busy (wall or other Pieces), deny move() the right to move the Piece.
    for (int i=0; i<positions.size(); i++) {
      boolean xOver = positions.get(i)[0]+x > board.getBoard().length-1;
      boolean xUnder = positions.get(i)[0]+x < 1;
      boolean yOver = positions.get(i)[1]+y > board.getBoard()[0].length-1;
      boolean yUnder = positions.get(i)[1]+y < 1;
      if (xOver || xUnder || yOver || yUnder || board.getBoard()[positions.get(i)[0]+x][positions.get(i)[1]+y] == WALL) {
        return false;
      }
    }
    for (int i=0; i<positions.size(); i++) {
       //otherwise, erase the Piece's old positions from the Board and move the Piece according to the parameters
       board.getBoard()[positions.get(i)[0]][positions.get(i)[1]] = SPACE;
       positions.get(i)[0] = positions.get(i)[0]+x;
       positions.get(i)[1] = positions.get(i)[1]+y;
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
