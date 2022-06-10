import java.io.*;
import java.util.*;
import java.sql.Timestamp;

Board board = new Board();
nextType type = new nextType();
Piece tee = new Piece(5, 1, type.getNextType());
//PrintWriter add;
ArrayList<Integer> leaderboard = new ArrayList<Integer>();
ArrayList<Piece> piecelist = new ArrayList<Piece>();
boolean anyAtTop = false; //check for busy spots near spawn, if exist, game will reset
boolean hasStored = false; //check if the player already stored a piece in the place cycle
boolean isPaused = false; //whether or not game is paused.
int failCount = 0; //how many times the game should wait to fail to move a piece before it gets placed
int frameCountEr = 0;
int speed=60;
boolean loser = false;
boolean scoreStored = false;
int[] preview = new int[4];

void setup() {
  size(960, 540);
  piecelist.add(tee);
  preview = type.getPreviewTypes();
}
void draw() {
  background(255);
  frameRate(60);
  
  fill(0); text("Leaderboard",770, 25); fill(255); for(int i=0;i<5;i++) rect(785, 50+25*i, 100, 25); fill(0); for(int i=0;i<leaderboard.size();i++) text(leaderboard.get(i), 786, 70+25*i);
  
  fill(0); text("NEXT:", 300, 30);
  //rect(300, 40, 100, 250); text(""+preview[0]+","+preview[1]+","+preview[2]+","+preview[3], 310, 45);
  for(int i=0; i<4; i++) type.drawPiece(preview[i], i);
  preview = type.getPreviewTypes();
  
  if(!loser)board.displayBoard();
    else{board.displayBoard(); fill(0); textSize(20); text("LOSER",505, 155); text("Press Backspace to restart", 505, 200);///The stupid white box: stroke(255); fill(255); rect(300, 365, 77, 75); stroke(0); 
    text("Score: " + board.getScore(), 505, 245);text("Level: " + board.getLevel(), 505, 290); text("Lines Cleared: " + board.getLinesCleared(), 505, 335); text("Time Played: "+frameCountEr/60+" seconds", 505, 500);
    text("Would you like to save your score?", 505, 375); text("Hit ENTER to save your score!", 505, 400);
      if (scoreStored) {
        text("Saved!", 575, 450);
      }
    }
  if(!loser){
   for (int j=0;j<4;j++) { //puts Pieces on Board
     board.getBoard()[piecelist.get(0).getPositions().get(j)[0]][piecelist.get(0).getPositions().get(j)[1]] = piecelist.get(0).getType();
   }}
   board.rowChecked();
   if(board.getLines2()){
     text("2 Lines Cleared!",505, 105);
     board.shortHowLong2();
   }
   if(board.getLines3()){
     text("3 Lines Cleared!",505, 155);
     board.shortHowLong3();
   }
   if(board.getLines4()){
     text("4 Lines Cleared!",505, 205);
     board.shortHowLong4();
   }
   if(tee.getTSpin()){
     text("TSPIN!", 505, 255);
     tee.shortTSpinCount();
   }
  //check for busy spots at the top of any column. if busy, reset the game.
  boolean anyAtTop = false;
  for(int i=0;i<board.getBoard().length;i++) {if (board.getBoard()[i][1] > 6) {anyAtTop = true;}}
  if (anyAtTop) {
    loser = true;
  }
  tick();
  if (piecelist.size() >= 2) { //display the stored Piece
    storeDisp();
  }
  if (isPaused) {fill(255); rect(35, 100, 226, 100); fill(0); textSize(20); text("paused...",105, 155);}  
}

void tick(){
  if (!isPaused) {
    if(frameCountEr<frameCount){
       if (!(piecelist.get(0).move(board))) {
         failCount++;
       }
       if (failCount == ((int)Math.pow(board.getLevel(), 0.5))+1) {
         fullStamp();
       }
       if(board.getLevel()<=15) speed=(int)(60/Math.pow(1.22,(double)(board.getLevel()-1)));
       else speed=3;
       if(!loser) frameCountEr+=speed;
     }
   } else {
     frameCount--;
   }
}

void storeDisp() {
    textSize(20);
    fill(127, 127, 127); text("Storage:", 300, 380);
    switch(piecelist.get(1).getType()) {
      case(CYAN_I):
        fill(0, 255, 255); rect(300, 400, 20, 20); rect(320, 400, 20, 20); rect(340, 400, 20, 20); rect(360, 400, 20, 20);
        break;
      case(PURPLE_T):
        fill(255, 0, 255); rect(300, 400, 20, 20); rect(320, 400, 20, 20); rect(340, 400, 20, 20); rect(320, 420, 20, 20);
        break;
      case(YELLOW_SQ):
        fill(255, 255, 0); rect(300, 400, 20, 20); rect(320, 400, 20, 20); rect(300, 420, 20, 20); rect(320, 420, 20, 20);
        break;
      case(BLUE_L1):
        fill(0, 0, 255); rect(300, 400, 20, 20); rect(340, 420, 20, 20); rect(300, 420, 20, 20); rect(320, 420, 20, 20);
        break;
      case(ORANGE_L):
        fill(255, 69, 0); rect(340, 400, 20, 20); rect(340, 420, 20, 20); rect(300, 420, 20, 20); rect(320, 420, 20, 20);
        break;
      case(GREEN_Z1):
        fill(0, 255, 0); rect(300, 420, 20, 20); rect(320, 400, 20, 20); rect(320, 420, 20, 20); rect(340, 400, 20, 20);
        break;
      case(RED_Z):
        fill(255, 0, 0); rect(300, 400, 20, 20); rect(320, 400, 20, 20); rect(320, 420, 20, 20); rect(340, 420, 20, 20);        
        break;
    }
}

void fullStamp() {
   piecelist.get(0).stamp(board);
   hasStored = false;
   failCount = 0;
   for(int i=1;i<board.getBoard().length-1;i++) {if (board.getBoard()[i][1] > 6) {anyAtTop = true;}}
    if (anyAtTop) {
      //textSize(250);   
      //text("LOSER", 25, height-50);
      /*board = new Board();
      piecelist = new ArrayList<Piece>();
      piecelist.add(new Piece(5, 1, (int)random(0,7)));
      piecelist.set(0, new Piece(5, 1, (int)random(0,7)));
      anyAtTop = false;*/
      loser = true;
    } else {
      piecelist.set(0, new Piece(5, 1, type.getNextType()));
    }
}

void saveScore() {
  if (!scoreStored && loser) {
    leaderboard.add(board.getScore());
    Collections.sort(leaderboard, Collections.reverseOrder());
    if (leaderboard.size() > 5) {
      leaderboard.remove(5);
    }
    scoreStored = true;
  }  
  //String exists = "";
  //if (!scoreStored) {
  //  try {
  //    File scoreFile = new File("scorefile.txt");
  //    if (scoreFile.exists()) {
  //      Scanner s = new Scanner(scoreFile);
  //      //exists += s.nextLine() + '\n';
  //      while (s.hasNextLine()) {
  //        exists += s.nextLine() + '\n';
  //      }
  //      System.out.println("exists");
  //      System.out.println("a " + exists);
  //      s.close();
  //    } else {
  //      System.out.println("file DNE");
  //    }
  //    add = createWriter("scorefile.txt");
  //      if (loser) {
  //          String write = Integer.toString(board.getScore());
  //          add.println(exists + write + '\n');
  //      }
  //    add.flush(); // Writes the remaining data to the file
  //    add.close(); // Finishes the file
  //    scoreStored = true;
  //  } catch (IOException e) {
  //  System.out.println("lol");
  //  }
  //}
}

void keyPressed() {
  if (!isPaused && !loser) {
    if (keyCode == DOWN) { //move down one space
      if(piecelist.get(0).move(board)) {
        board.scoreIncrement(1);
      }
    } else if (keyCode == RIGHT) { //move right
       piecelist.get(0).move(1, 0, board);
    } else if (keyCode == LEFT) { //move left
       piecelist.get(0).move(-1, 0, board);
    } else if (keyCode == UP) { //rotate CW
       piecelist.get(0).rotate(true);
    } else if (key == 'z' || key == 'Z') { //rotate  CCW
       piecelist.get(0).rotate(false);
    } else if (key == ' ') { //soft drop
      if(!loser){
      int softDropCount = 0;
      while(piecelist.get(0).move(board)) {softDropCount++;}
      board.scoreIncrement(2*softDropCount);
      fullStamp();
      }
    }
  } if (keyCode == BACKSPACE) { //reset
    loser = false;
    scoreStored = false;
    board = new Board();
    piecelist = new ArrayList<Piece>();
    piecelist.add(new Piece(5, 1, type.getNextType()));
    piecelist.set(0, new Piece(5, 1, type.getNextType()));
    isPaused = false;
    anyAtTop = false;
  } else if (key == 'c' || key == 'C') { //switch with storage
    if(!loser){
    if (hasStored == false) {
      if (piecelist.size() < 2) {
        piecelist.add(1, new Piece(5, 1, type.getNextType()));
      }
      for (int i=0;i<4;i++) {
        board.getBoard()[piecelist.get(0).getPositions().get(i)[0]][piecelist.get(0).getPositions().get(i)[1]] = SPACE;
      }
      Piece temp = new Piece(5, 1, piecelist.get(1).getType());
      piecelist.set(1, piecelist.get(0));
      piecelist.set(0, temp);
      hasStored = true;
      }
    }
  } else if (key == 'p' || key == 'P') {
    if(!loser){
      if (isPaused) {
        delay(1500);
       }
      isPaused = !isPaused;
    }
  } else if (keyCode == ENTER && loser) {
    saveScore();
  }
}

static final int SPACE = -2;
static final int WALL = -1;
static final int CYAN_I = 0;
static final int PURPLE_T = 1;
static final int YELLOW_SQ = 2;
static final int BLUE_L1 = 3;
static final int ORANGE_L = 4;
static final int GREEN_Z1 = 5;
static final int RED_Z = 6;
static final int STAMP = 7;
