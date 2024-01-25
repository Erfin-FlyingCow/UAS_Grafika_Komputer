int sudut = 0;
int ukuranular = 5;
int waktu =0;
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
