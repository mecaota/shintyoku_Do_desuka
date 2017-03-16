void disp10() {//履歴表示
  textSize(30);
  fill(255);
  textAlign(LEFT);
  text("○deadLine Review", 5, 30);
  textSize(25);
  for (int i=1; i<log.length; i++) {
    text("・"+log[i], 5, (i+1)*26);
  }
  if (mouseY < height&&mouseY>540) {
    fill(0, 255, 0);
    rect(0, 135*4, width, 100);
    fill(0);
    textAlign(CENTER);
    textSize(50);
    text("Home", width/2, height-10);
  }
}
