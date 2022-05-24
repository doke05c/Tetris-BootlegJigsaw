public class Piece {
  private ArrayList<int[]> positions; //arrays of size 2
  private int type; //piece type 0-6

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
    if (type==0) {
      positions.add(new int[] {xPos, yPos}); //top most square
      positions.add(new int[] {xPos, yPos-1});
      positions.add(new int[] {xPos, yPos-2});
      positions.add(new int[] {xPos, yPos-3});
    } else if (type==1) {
      positions.add(new int[] {xPos, yPos}); //top most square
      positions.add(new int[] {xPos, yPos-1});
      positions.add(new int[] {xPos-1, yPos-1});
      positions.add(new int[] {xPos+1, yPos-1});
    } else if (type==2) {
      positions.add(new int[] {xPos, yPos}); //top right most square
      positions.add(new int[] {xPos-1, yPos});
      positions.add(new int[] {xPos-1, yPos-1});
      positions.add(new int[] {xPos, yPos-1});
    } else if (type==3) {
      positions.add(new int[] {xPos, yPos}); //top right most square
      positions.add(new int[] {xPos, yPos-1});
      positions.add(new int[] {xPos, yPos-2});
      positions.add(new int[] {xPos-1, yPos-2});
    } else if (type==4) {
      positions.add(new int[] {xPos, yPos}); //top right most square
      positions.add(new int[] {xPos, yPos-1});
      positions.add(new int[] {xPos, yPos-2});
      positions.add(new int[] {xPos+1, yPos-2});
    } else if (type==5) {
      positions.add(new int[] {xPos, yPos}); //top right most square
      positions.add(new int[] {xPos-1, yPos});
      positions.add(new int[] {xPos-1, yPos-1});
      positions.add(new int[] {xPos-2, yPos-1});
    } else if (type==6) {
      positions.add(new int[] {xPos, yPos}); //top right most square
      positions.add(new int[] {xPos-1, yPos});
      positions.add(new int[] {xPos, yPos-1});
      positions.add(new int[] {xPos+1, yPos-1});
    }
  }

  public Piece(int xPos, int yPos, int type) {
    this(xPos, yPos, type, 0);
  }
}
