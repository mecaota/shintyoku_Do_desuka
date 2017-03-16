import controlP5.*;
ControlP5 cp5;

void mouseClicked() {
  //ホームUIのボタン設置
  if (page ==0) {
    cp5.hide(); //controleP5を用いた関数を全て一時停止
    if (mouseX > 0 && mouseX < width-60) {
      fill(15, 106, 0);
      if (mouseY < 135*1) {
        rect(0, 0, width, 135);
        page = 1; // 設定ページ１へ
      } else if (mouseY < 135*2) {
        rect(0, 135*1, width, 135);
        page = 2; // 設定ページ２へ
      } else if (mouseY < 135*3) {
        rect(0, 135*2, width, 135);
        page = 3; // 設定ページ３へ
      } else if (mouseY < 135*4) {
        rect(0, 135*3, width, 135);
        page = 4; // 設定ページ４へ
      } else if (mouseY < height) {
        rect(0, 135*4, width, 100);
        page =10; //ログデータ観覧ページ
      }
    }
  } else {
    if (mouseY < height&&mouseY>540) {//ホーム画面に戻る
      rect(0, 135*4, width, 100);
      page =5;
    }
  }
}


void setColor(int i) {
  if  (dead_sum[i]<1) {
    fill(255, 32, 32);
  } else if (dead_sum[i]<7) {
    fill(255, 160, 0);
  } else {
    fill(200, 200, 200);
  }
}

//終了処理//
void dispose() {
  for (int i=0; i<data.length; i++) {
    String a = str(data_save[i][0]);
    String b = str(data_save[i][1]);
    String c = str(data_save[i][2]);
    String d = str(data_save[i][3]);
    String e = str(data_save[i][4]);
    String conma = ",";
    String convert = a+conma+b+conma+c+conma+d+conma+e;
    String convert2 = title[i]+conma+a+conma+b+conma+c+conma+d+conma+e;
    lines[i] =convert;
    log=append(log, convert2);
  }
  println(log);
  sort(log);
  saveStrings("deadline.txt", lines);
  saveStrings("log.txt", log);
  System.exit(0);
}


void draw() {
  //表示演算用の現在時刻を代入//
  data[0][0]=year();
  data[0][1]=month();
  data[0][2]=day();
  data[0][3]=hour();
  data[0][4]=minute();
  data[0][5]=second();


  //保存用の現在時刻を代入//
  data_save[0][0]=year();
  data_save[0][1]=month();
  data_save[0][2]=day();
  data_save[0][3]=hour();
  data_save[0][4]=minute();
  dead_sum[0]=GetDays(data[0][0], data[0][1], data[0][2]);


  textAlign(CENTER);
  time();
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  stroke(255);
  line(0, 540, width, 540);
  fill(255);
  textSize(24);
  
  /* ページ切り替え*/
  switch(page) {
  case 0:
    fill(0, 255, 0);
    time();
    disp0();
    fill(0, 255, 0);
    break;    
  case 1:
    disp(1);
    l=1;
    dead_realtime(1);
    fill(0, 255, 0);
    break;
  case 2:
    disp(2);
    l=2;
    dead_realtime(2);
    fill(0, 255, 0);
    break;
  case 3:
    disp(3);
    l=3;
    dead_realtime(3);
    fill(0, 255, 0);
    break;
  case 4:
    disp(4);
    l=4;
    dead_realtime(4);
    fill(0, 255, 0);
    break;
  case 10:
    disp10();
    fill(0, 255, 0);
    break;
  default:
    page=0;
    fill(0, 255, 0);
    time();
    break;
  }
}