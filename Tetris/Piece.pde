public class Piece {
  private ArrayList<int[]> positions; //arrays of size 2
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

  int getX(){
    return x;
  }
  int getY(){
    return y;
  }

  Void rotate(boolean direction) {
    if (direction) {
      rotation+=1;//make sure to loop over for 3
    } else {
      rotation-=1;//make sure to loop over for 0
    }
    this = new Piece(x, y, type, rotation);//call with new rotation
  }

  public Piece(int xPos, int yPos, int type, int rotate) {
    //xPos yPos are coords on the board
    //type = piece
    rotation = rotate;
    x = xPos;
    y = yPos;
    this.type = type;
    if (type==0) {
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
    } else if (type==1) {
      if (rotate==0) {
        positions.add(new int[] {xPos, yPos}); //bottom right
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
    } else if (type==2) {
      positions.add(new int[] {xPos, yPos}); //top right most square
      positions.add(new int[] {xPos-1, yPos});
      positions.add(new int[] {xPos-1, yPos-1});
      positions.add(new int[] {xPos, yPos-1});
    } else if (type==3) {
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
    } else if (type==4) {
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
    } else if (type==5) {
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
    } else if (type==6) {
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
}
