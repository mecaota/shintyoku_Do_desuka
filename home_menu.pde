/*ホーム画面*/
void disp0() { 
  cp5.hide(); //controleP5を用いた関数を全て一時停止

  for (int i=1; i<5; i++) {
    data[i][0]=data_save[i][0];
    data[i][1]=data_save[i][1];
    data[i][2]=data_save[i][2];
    data[i][3]=data_save[i][3];
    data[i][4]=data_save[i][4];
    if (data[i][0]==0) {
      data_save[i][0]=year();
      data_save[i][1]=month();
      data_save[i][2]=day();
      data_save[i][3]=hour();
      data_save[i][4]=minute();
    }

    fill(255);
    textSize(30);
    text(title[i]+"\n", width/2, 25+135*(i-1));
    line(0, 135*i, width, 135*i);
    setColor(i);
    textSize(45);
    if (dead[i][0]<=0&&dead[i][1]<=0&&dead[i][2]<=0&&dead[i][3]<=0&&dead[i][4]<=0) {
      text("Time Up!", width/2, 135*(i-1)+70);
    } else { 
      text(dead[i][0]+"年 "+dead[i][1]+"ヶ月 "+dead[i][2]+"日", width/2, 135*(i-1)+70);
      text(dead[i][3]+"時間 "+dead[i][4]+"分", width/2, 135*(i-1)+120);
    }

    dead_updown(i);
  }

  if (mouseX > 0 && mouseX < width) {
    fill(0, 255, 0);
    textSize(50);
    if (mouseY < 135*1) {
      rect(0, 0, width, 135);
      fill(0);
      text("Click here"+"\n"+" to Setup", width/2, 135*(1-1)+60);
    } else if (mouseY < 135*2) {
      rect(0, 135*1, width, 135);
      fill(0);
      text("Click here"+"\n"+" to Setup", width/2, 135*(2-1)+60);
    } else if (mouseY < 135*3) {
      rect(0, 135*2, width, 135);
      fill(0);
      text("Click here"+"\n"+" to Setup", width/2, 135*(3-1)+60);
    } else if (mouseY < 135*4) {
      rect(0, 135*3, width, 135);
      fill(0);
      text("Click here"+"\n"+" to Setup", width/2, 135*(4-1)+60);
    } else if (mouseY < height) {
      rect(0, 135*4, width, 100);
      fill(0);
      text("Log View", width/2, height-10);
    }
  }
}

void disp(int n) {
  cp5.show();//controleP5を用いた関数を全て再開
  data[n][0]=calender(data[n][0], data[n][1], data[n][2], data[n][3], data[n][4], 0);
  data[n][1]=calender(data[n][0], data[n][1], data[n][2], data[n][3], data[n][4], 1);
  data[n][2]=calender(data[n][0], data[n][1], data[n][2], data[n][3], data[n][4], 2);
  data[n][3]=calender(data[n][0], data[n][1], data[n][2], data[n][3], data[n][4], 3);
  data[n][4]=calender(data[n][0], data[n][1], data[n][2], data[n][3], data[n][4], 4);


  textAlign(CENTER);
  textSize(50);
  setColor(n);
  rect(0, height-60-175, width, 135);
  text(title[n]+" Setup", width/2, 45);
  text(data[n][0]+"年"+data[n][1]+"月"+nf(data[n][2], 2)+"日  "+"\n\n\n"+nf(data[n][3], 2)+"時"+nf(data[n][4], 2)+"分", width/2, 100);
  fill(0);
  textSize(40);
  text("Remaining time\n"+dead[n][0]+"年 "+dead[n][1]+"ヶ月 "+dead[n][2]+"日 \n"+dead[n][3]+"時間 "+dead[n][4]+"分", width/2, height-200);
  if (mouseY < height&&mouseY>540) {
    fill(0, 255, 0);
    rect(0, 135*4, width, 100);
    fill(0);
    textAlign(CENTER);
    textSize(50);
    text("Home", width/2, height-10);
  }
}
