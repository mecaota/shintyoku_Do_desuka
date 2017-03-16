//各種ボタン設定//

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  n = 0;
}

public void back(int theValue) {//デリートボタン処理
  println("a button event from buttonB: "+theValue);
  data_save[l][0]=0;
  data_save[l][1]=0;
  data_save[l][2]= 0;
  data_save[l][3]= 0;
  data_save[l][4]= 0;
  page=5;
}
public void minus_y(int theValue) {//年減ボタン処理
  println("a button event from buttonB: "+theValue);
  data[l][0]-=1;
}
public void plus_y(int theValue) {//年増ボタン処理
  println("a button event from buttonB: "+theValue);
  data[l][0]+=1;
}


public void minus_m(int theValue) {//月減ボタン処理
  println("a button event from buttonB: "+theValue);
  data[l][1]-=1;
}
public void plus_m(int theValue) {//月増ボタン処理
  println("a button event from buttonB: "+theValue);
  data[l][1]+=1;
}


public void minus_d(int theValue) {//日減ボタン処理
  println("a button event from buttonB: "+theValue);
  data[l][2]-=1;
}
public void plus_d(int theValue) {//日増ボタン処理
  println("a button event from buttonB: "+theValue);
  data[l][2]+=1;
}


public void minus_h(int theValue) {//時間減ボタン処理
  println("a button event from buttonB: "+theValue);
  data[l][3]-=1;
}
public void plus_h(int theValue) {//時間増ボタン処理
  println("a button event from buttonB: "+theValue);
  data[l][3]+=1;
}


public void minus_min(int theValue) {//分減ボタン処理
  println("a button event from buttonB: "+theValue);
  data[l][4]-=1;
}
public void plus_min(int theValue) {//分増ボタン処理
  println("a button event from buttonB: "+theValue);
  data[l][4]+=1;
}

public void complete(int theValue) {//完了ボタン
  println("a button event from buttonB: "+theValue);
  data_save[l][0]=data[l][0];
  data_save[l][1]=data[l][1];
  data_save[l][2]= data[l][2];
  data_save[l][3]= data[l][3];
  data_save[l][4]= data[l][4];
  page=5;
}
