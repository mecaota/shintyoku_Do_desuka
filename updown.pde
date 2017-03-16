//日数計算系アルゴリズム//

/// <summary>
/// グレゴリウス暦1年1月1日からの経過日数を求める。
/// （グレゴリウス暦施行前の日付も、
///   形式的にグレゴリウス暦と同じルールで計算。）
/// </summary>
/// <param name="y">年</param>
/// <param name="m">月</param>
/// <param name="d">日</param>
/// <returns>1年1月1日からの経過日数</returns>
int GetDays(int get_y, int get_m, int get_d) {//グレゴリウス暦1年1月1日からの経過日数を求める関数
  // 1・2月 → 前年の13・14月
  if (get_m <= 2)
  {
    --get_y;
    get_m += 12;
  }
  int dy = 365 * (get_y - 1); // 経過年数×365日
  int c = get_y / 100;
  int dl = (get_y >> 2) - c + (c >> 2); // うるう年分
  int dm = (get_m * 979 - 1033) >> 5; // 1月1日から m 月1日までの日数
  return dy + dl + dm + get_d - 1;
}


int GetMinutes(int get_h, int get_min) {//合計分を求める関数
  int sum=0;
  sum=get_h*60+get_min;
  return sum;
}

void dead_updown(int i) {//静的な日時差計算
  //分数から何時間何分かを計算
  if (data[i][2]==data[0][2]&&data[i][1]==data[0][1]&&data[i][0]==data[0][0]) {
    dead_sum[i]=(GetMinutes(data[i][3], data[i][4]))-(GetMinutes(data[0][3], data[0][4]));
  } else {
    dead_sum[i]=(24*60-GetMinutes(data[0][3], data[0][4]))+(GetMinutes(data[i][3], data[i][4]));
  }
  dead[i][3]=dead_sum[i]/60;
  dead[i][4]=dead_sum[i]%60;

  //日数計算代入
  dead_sum[i]= GetDays(data[i][0], data[i][1], data[i][2])-GetDays(data[0][0], data[0][1], data[0][2]);

  //日数から何年何ヶ月かを計算
  dead[i][0]=dead_sum[i]/365;//日数÷３６５＝年数
  dead[i][1]=(dead_sum[i]%365)/30;//日数÷３６５の余り＝日数、この日数÷３０＝何ヶ月
  dead[i][2]=((dead_sum[i]%365)%30);//日数÷３６５の余り＝日数、この日数÷３０の余り＝日数

  println(data_save[i]);
}


void dead_realtime(int i) {//動的な日時差計算
  //分数から何時間何分かを計算
  if (data[i][2]==data[0][2]&&data[i][1]==data[0][1]&&data[i][0]==data[0][0]) {
    dead_sum[i]=(GetMinutes(data[i][3], data[i][4]))-(GetMinutes(data[0][3], data[0][4]));
  } else {
    dead_sum[i]=(24*60-GetMinutes(data[0][3], data[0][4]))+(GetMinutes(data[i][3], data[i][4]));
  }
  dead[i][3]=dead_sum[i]/60;
  dead[i][4]=dead_sum[i]%60;

  //日数計算代入
  dead_sum[i]= GetDays(data[i][0], data[i][1], data[i][2])-GetDays(data[0][0], data[0][1], data[0][2]);

  //日数から何年何ヶ月かを計算
  dead[i][0]=dead_sum[i]/365;//日数÷３６５＝年数
  dead[i][1]=(dead_sum[i]%365)/30;//日数÷３６５の余り＝日数、この日数÷３０＝何ヶ月
  dead[i][2]=((dead_sum[i]%365)%30);//日数÷３６５の余り＝日数、この日数÷３０の余り＝日数

  println(data[i]);
}
