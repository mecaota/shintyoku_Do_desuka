//一連の変数宣言
int y=0;//年
int m=0;//月
int d=0;//日
int h=0;//時
int min=0;//分

int data[][] = new int [5][6];//表示用。現在の日付[0][]と設定した日付[1]~[7][]。後ろの配列番号は最初から順に年、月、日、時、分。
int data_save[][] = new int[5][6];//保存用。現在の日付[0][]と設定した日付[1]~[7][]。後ろの配列番号は最初から順に年、月、日、時、分。
int dead[][] = new int [5][5];//残りの日付。
int dead_sum[]=new int[5];//色を指定したり、時間日付計算のために使う配列
String title[]=new String[5];//タイトル設定用

float n, n1;//controleP5使うためのよく分からない変数
String lines[];
String log[];
int l;//ページ番号を並列用に記録するための変数

//ホームページ設定
int page = 0;//画面遷移用ページ番号


void setup() {
  size(480, 640);
  noStroke();
  PFont misakifont = loadFont("PixelMplus12-Regular-50.vlw");//フォント入力
  textFont(misakifont);
  cp5 = new ControlP5(this);//ボタン生成用オブジェクト生成
  
  //項目設定//
  title[0]="now";
  title[1]="meeting";
  title[2]="homeworkA";
  title[3]="homeworkB";
  title[4]="party";

  PImage[] plus = {
    loadImage("arrow_a.png"), loadImage("arrow_b.png"), loadImage("arrow_c.png") //数字入力矢印キー上向きの画像入力
    };
  PImage[] minus = {
    loadImage("arrow_ra.png"), loadImage("arrow_rb.png"), loadImage("arrow_rc.png") //数字入力矢印キー下向きの画像入力
    };
  PImage[] back = {
    loadImage("back_a.png"), loadImage("back_b.png"), loadImage("back_c.png") //デリートボタン画像入力
    };
  PImage[] complete = {
    loadImage("complete_a.png"), loadImage("complete_b.png"), loadImage("complete_c.png") //OKボタン画像入力
    };
    //各ボタン宣言//
    cp5.addButton("back") //戻るボタン
      .setValue(128)
        .setPosition(10, height-300)
          .setImages(back)
            .updateSize()
              ;
  cp5.addButton("complete") //完了ボタン
    .setValue(128)
      .setPosition(width-60, height-300)
        .setImages(complete)
          .updateSize()
            ;
  cp5.addButton("plus_y")//年増ボタン
    .setValue(128)
      .setPosition(70, 100)
        .setImages(plus)
          .updateSize()
            ;
  cp5.addButton("minus_y")//年減ボタン
    .setValue(128)
      .setPosition(70, 140)
        .setImages(minus)
          .updateSize()
            ;

  cp5.addButton("plus_m")//月増ボタン
    .setValue(128)
      .setPosition(180, 100)
        .setImages(plus)
          .updateSize()
            ;
  cp5.addButton("minus_m")//月減ボタン
    .setValue(128)
      .setPosition(180, 140)
        .setImages(minus)
          .updateSize()
            ;

  cp5.addButton("plus_d")//日増ボタン
    .setValue(128)
      .setPosition(260, 100)
        .setImages(plus)
          .updateSize()
            ;
  cp5.addButton("minus_d")//日減ボタン
    .setValue(128)
      .setPosition(260, 140)
        .setImages(minus)
          .updateSize()
            ;

  cp5.addButton("plus_h")//時間増ボタン
    .setValue(128)
      .setPosition(130, width/2+40)
        .setImages(plus)
          .updateSize()
            ;
  cp5.addButton("minus_h")//時間減ボタン
    .setValue(128)
      .setPosition(130, width/2+80)
        .setImages(minus)
          .updateSize()
            ;

  cp5.addButton("plus_min")//分増ボタン
    .setValue(128)
      .setPosition(230, width/2+40)
        .setImages(plus)
          .updateSize()
            ;
  cp5.addButton("minus_min")//分減ボタン
    .setValue(128)
      .setPosition(230, width/2+80)
        .setImages(minus)
          .updateSize()
            ;
  //ここまでボタン宣言//

  lines = loadStrings("deadline.txt"); //締め切りセーブロード
  for (int i = 1; i < lines.length; i++) {
    String wry[] = lines[i].split(","); //成分分割
    int v[] = int(wry); //data配列を文字列配列から整数配列に変換 
    data_save[i][0]=v[0];
    data_save[i][1]=v[1];
    data_save[i][2]=v[2];
    data_save[i][3]= v[3];
    data_save[i][4]= v[4];
  }
  log = loadStrings("log.txt"); //締め切りログデータロード
}
