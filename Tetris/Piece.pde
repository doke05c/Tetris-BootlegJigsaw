public class Piece {
  private ArrayList<int[]> positions = new ArrayList<int[]>(); //arrays of size 2
  private int type; //piece type 0-6
  private int rotation;
  private int x;
  private int y;
  private int tSpinCount = 0;
  private boolean tSpin = false;
  
  int getTSpinCount(){ return tSpinCount; }
  boolean getTSpin(){ return tSpin; }
  public void shortTSpinCount(){ tSpinCount-=1; if(tSpinCount==0) tSpin =false;}
  
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
  
  void tSpin(Board cBoard){
    if(type == PURPLE_T){
      int centerX = positions.get(0)[0];
      int centerY = positions.get(0)[1]; 
     if(//look at "corners"
       cBoard.getBoard()[centerX-1][centerY+1]>=STAMP &&
       cBoard.getBoard()[centerX+1][centerY+1]>=STAMP && (
       cBoard.getBoard()[centerX+1][centerY-1]>=STAMP ||
       cBoard.getBoard()[centerX-1][centerY-1]>=STAMP
       )
       ){
         tSpin = true;
         tSpinCount = 90;
       }
    }
  }

  void stamp(Board cBoard) {
    tSpin(cBoard);
    for (int sq = 0; sq<positions.size(); sq++) {
      cBoard.getBoard()[positions.get(sq)[0]][positions.get(sq)[1]]=type+STAMP;//(-1 + type/10+.1);
    }
    for (int r=3; r>=0; r--) {
      positions.remove(r);
    }
  }

  boolean checkPos(ArrayList<int[]> positions){
    for(int i=0; i<positions.size(); i++){
      if(board.getBoard()[positions.get(i)[0]][positions.get(i)[1]] >=7) return false;
    }
    return true;
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
    if (type != YELLOW_SQ) {
      if (x==1) {
        Piece temp = new Piece(x+1, y, type, rotation);
        if(checkPos(temp.positions)){
        positions= temp.positions;
        x++;}else{rotation-=1;}
      } else if (x==board.getBoard().length-2) {
        Piece temp = new Piece(x-1, y, type, rotation);
        if(checkPos(temp.positions)){
        positions= temp.positions;
        x--;}else{rotation-=1;}
      } else if (y==1) {
        Piece temp = new Piece(x, y+1, type, rotation);
        if(checkPos(temp.positions)){
        positions= temp.positions;
        y++;}else{rotation-=1;}
      } else if (y==board.getBoard()[0].length-2) {
        Piece temp = new Piece(x, y-1, type, rotation);
        if(checkPos(temp.positions)){
        positions= temp.positions;
        y--;
        }else{rotation-=1;}
      } else {
        Piece temp = new Piece(x, y, type, rotation);
        if(checkPos(temp.positions)){
        positions= temp.positions;
        }else{rotation-=1;}
      }
    }
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
      if (rotate ==1 || rotate==3) {
        if (y<3) {
          positions.set(0, new int[] {xPos, yPos+2}); //top most square
          positions.set(1, new int[] {xPos, yPos+1});
          positions.set(2, new int[] {xPos, yPos+0});
          positions.set(3, new int[] {xPos, yPos-1});
        } else {
          positions.set(0, new int[] {xPos, yPos+1}); //top most square
          positions.set(1, new int[] {xPos, yPos});
          positions.set(2, new int[] {xPos, yPos-1});
          positions.set(3, new int[] {xPos, yPos-2}); 
        }
      }
      if (rotate==0 || rotate==2) {
        if (x<3) {
          positions.set(0, new int[] {xPos+2, yPos}); //top most square
          positions.set(1, new int[] {xPos+1, yPos});
          positions.set(2, new int[] {xPos, yPos});
          positions.set(3, new int[] {xPos-1, yPos});
        } else {
          positions.set(0, new int[] {xPos+1, yPos}); //top most square
          positions.set(1, new int[] {xPos, yPos});
          positions.set(2, new int[] {xPos-1, yPos});
          positions.set(3, new int[] {xPos-2, yPos});
        }
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
        positions.set(3, new int[] {xPos-1, yPos});
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
        positions.set(3, new int[] {xPos+1, yPos});
      }
    } else if (type==YELLOW_SQ) {
      positions.set(0, new int[] {xPos, yPos}); //top right most square
      positions.set(1, new int[] {xPos-1, yPos});
      positions.set(2, new int[] {xPos-1, yPos+1});
      positions.set(3, new int[] {xPos, yPos+1});
    } else if (type==BLUE_L1) {
      if (rotate==0 && y>3) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos-1, yPos-1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==0 && y<=3) {
        positions.set(0, new int[] {xPos, yPos+1}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos+1});
        positions.set(2, new int[] {xPos-1, yPos});
        positions.set(3, new int[] {xPos+1, yPos+1});
      }
      if (rotate==1) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos, yPos-1});
        positions.set(2, new int[] {xPos+1, yPos-1});
        positions.set(3, new int[] {xPos, yPos+1});
      }
      if (rotate==2) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos+1, yPos+1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==3) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos, yPos+1});
        positions.set(2, new int[] {xPos, yPos-1});
        positions.set(3, new int[] {xPos-1, yPos+1});
      }
    } else if (type==ORANGE_L) {
      if (rotate==0 && y>3) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos+1, yPos-1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==0 && y<=3) {
        positions.set(0, new int[] {xPos, yPos+1}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos+1});
        positions.set(2, new int[] {xPos+1, yPos});
        positions.set(3, new int[] {xPos+1, yPos+1});        
      }
      if (rotate==1) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos, yPos-1});
        positions.set(2, new int[] {xPos+1, yPos+1});
        positions.set(3, new int[] {xPos, yPos+1});
      }
      if (rotate==2) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos-1, yPos});
        positions.set(2, new int[] {xPos-1, yPos+1});
        positions.set(3, new int[] {xPos+1, yPos});
      }
      if (rotate==3) {
        positions.set(0, new int[] {xPos, yPos}); //top right most square
        positions.set(1, new int[] {xPos, yPos-1});
        positions.set(2, new int[] {xPos-1, yPos-1});
        positions.set(3, new int[] {xPos, yPos+1});
      }
    } else if (type==RED_Z) {
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
    } else if (type==GREEN_Z1) {
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
      boolean isWall = board.getBoard()[positions.get(i)[0]+x][positions.get(i)[1]+y] == WALL;
      boolean isStamped = board.getBoard()[positions.get(i)[0]+x][positions.get(i)[1]+y] > 6;
      if (xOver || xUnder || yOver || yUnder || isWall || isStamped) {
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
