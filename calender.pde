//カレンダー処理//

void time() {//時計
  textSize(50);
  text(nf(month(), 2)+"/"+day()+" "+nf(hour(), 2)+":"+ nf(minute(), 2)+":"+ nf(second(), 2), width/2, height-13);
}

//カレンダー通りの数字を出力する設定
int calender(int get_y, int get_m, int get_d, int get_h, int get_min, int category) {
  int r_v[]=new int [6];
  r_v[0]=get_y;
  r_v[1]=get_m;
  r_v[2]=get_d;
  r_v[3]=get_h;
  r_v[4]=get_min;

  int wd ;    /* 曜日     */
  int dm ;    /* 月の日数 */
  int L0 ;    /* 繰り返し用のカウンタ */

  /* 年月を入力 */
  // printf("年=") ; 
  // scanf("%d", &y) ;
  // printf("月=") ; 
  // scanf("%d", &m) ;
  // printf("[%d年 %d月]\n", y, m) ;

  /* ｙ年ｍ月が何日あるか */
  switch(r_v[1]) {
  case 2:
    if ( r_v[0]%4 == 0 && (r_v[0]%100 != 0 || r_v[0]%400 ==0)) {
      dm = 29 ; /* 閏年 */
    } else {
      dm = 28 ;
    }
    break ;
  case 4:
  case 6:
  case 9:
  case 11:
    dm = 30 ;
    break ;
  default:
    dm = 31 ;
    break ;
  }

  wd = (r_v[0] + r_v[0]/4 - r_v[0]/100  + r_v[0]/400 + (13*r_v[1]+8)/5 +1) % 7 ;
  r_v[5]=wd;

  /* 曜日欄 */
  // printf(" 日 月 火 水 木 金 土\n") ;
  //  printf(" --------------------\n") ;

  /* 空白の表示 */
  for (L0=0; L0<wd; L0++) {
    //   printf("   ") ;
  }

  /* 日付の表示 */
  for (L0=1; L0<=dm; L0++) {
    //    printf(" %2d", L0) ;
    wd ++ ;
    if (wd % 7 == 0) {
      //    printf("\n") ;
    }
  }
  //  printf("\n") ;
  //以上。万年カレンダーサンプルコード//



  // 日付繰り上げ関数//
  //日にちの繰り上げ判別 
  if (r_v[2]>dm) {
    r_v[2]=1;
  } else if (r_v[2]<1) {
    r_v[2]=dm;
  }

  //月の繰り上げ判別
  if (r_v[1]>12) {
    r_v[1]=1;
  }

  //時間の繰り上げ判別
  if (r_v[3]>23) {
    r_v[3]=0;
  }

  //分の繰り上げ判別
  if (r_v[4]>59) {
    r_v[4]=0;
  }

  //月の繰り下げ判別
  if (r_v[1]<1) {
    r_v[1]=12;
  }

  //年の繰り下げ判別
  if (r_v[0]<1) {
    r_v[0]=1;
  }

  //時間の繰り下げ判別
  if (r_v[3]<0) {
    r_v[3]=23;
  }

  //分の繰り下げ判別
  if (r_v[4]<0) {
    r_v[4]=59;
  }

  return r_v[category];
}
