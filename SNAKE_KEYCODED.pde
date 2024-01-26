int sudut = 0;
int ukuranular = 5;
int waktu = 0;

int[] kepalax= new int [500];
int[] kepalya= new int [500];

int jerukx = (round(random(40))+1)*8;
int jeruky = (round(random(55,55))+1)*8;

boolean lagi =true ;
boolean gameberhenti = false;

void setup(){
  size(500,500);
  textAlign(CENTER);
}

void draw(){
  if (stopgame) {
    //tidak terjadi apa apa
  } else {
    time+=1;

    fill(255,0,0);
    stroke(0);
    rect(applex,appley,8,8);
    fill(0);
    stroke(0);
  
    rect(0,30,width,5);
    rect(0,height-8,width,8);
    rect(0,0,8,height);
    rect(width-8,0,8,height);
    
    //modulasi waktu dengan 5, agar game tidak terlalu cepat
    if ((time % 5)==0) {
      travel();
      display();
      checkdead();
    }
  }
}

//control game dengan keyboard atas, bawah, kanan, kiri
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && angle!=270 && (heady[1]-8)!=heady[2]) {
      angle=90;
    }
    if (keyCode == DOWN && angle!=90 && (heady[1]+8)!=heady[2]) {
      angle=270;
    }
    if (keyCode == LEFT && angle!=0 && (headx[1]-8)!=headx[2]) {
      angle=180;
    }
    if (keyCode == RIGHT && angle!=180 && (headx[1]+8)!=headx[2]) {
      angle=0;
    }
    if (keyCode == SHIFT) { //shift untuk restart
      restart();  
    }
  }
}

  if (currentScore > highScore) {
    highScore = currentScore;
  }

  text("High Score: " + highScore, 300, 30);

  if (kepalax[1] == jerukx && heady[1] == kepalay) {
    //grow and spawn the apple somewhere away from the snake
    //(currently some of the code below might not be working, but the game still works.)
    snakesize += 1;
    redo = true;
    while (lagi) {
      jerukx = (round(random(47)) + 1) * 8;
      jeruky = (round(random(55, 55)) + 1) * 8;
      for (int i = 1; i < ukuranular; i++) {

        if (jerukx == kepala[i] && jeruky == kepalay[i]) {

          text("Score:  " + str(ukuranular - 5) + " ", 250, 50);

          lagi = true;
        } else {
          redo = lagi;
          i = 1000;
        }
      }
    }
  }
