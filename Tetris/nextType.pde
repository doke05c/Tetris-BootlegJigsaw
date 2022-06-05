import java.util.Collections;
public class nextType{
  
  private ArrayList<Integer> typeS;
  
  public nextType(){
    typeS = new ArrayList<Integer>();
    addTypes();
  }
  
  int getNextType(){
    if(typeS.size()<7) addTypes();
    return typeS.remove(0);
  }
  
  int[] getPreviewTypes(){
    int[] thePrev = new int[4];
    for(int i=0; i<4; i++) thePrev[i]=((int)typeS.get(i));
    return thePrev;
  }
  
  void addTypes(){
    ArrayList<Integer> list = new ArrayList<Integer>();
    for (int i=0; i<7; i++) list.add(i);
    Collections.shuffle(list);
    for (int i=0; i<7; i++) typeS.add(list.get(i));
  }
  
  void drawPiece( int type, int query){
    float side = 20;
    int x = 300;
    int y = 40;
    if (query == 0){ y = 40;}
    if (query == 1){ y = 90;}
    if (query == 2){ y = 140;}
    if (query == 3){ y = 190;}
    
    if (type==CYAN_I) {
      fill(0, 255, 255);
      square(x, y, side); square(x+side, y, side); 
      square(x+(2*side), y, side); square(x+(3*side), y, side); 
    }
    
    else if (type==PURPLE_T) {}
    else if (type==YELLOW_SQ) {}
    else if (type==BLUE_L1) {}
    else if (type==ORANGE_L) {}
    else if (type==RED_Z) {}
    else if (type==GREEN_Z1) {}
    
  }
  
}
