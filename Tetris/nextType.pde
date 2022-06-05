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
  
  void addTypes(){
    ArrayList<Integer> list = new ArrayList<Integer>();
    for (int i=0; i<7; i++) list.add(i);
    Collections.shuffle(list);
    for (int i=0; i<7; i++) typeS.add(list.get(i));
  }
  
}
