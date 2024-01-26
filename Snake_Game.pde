
int sudut=0;
int ukuranular=5;
int waktu=0;
int highScore = 0;
int[] kepalax= new int[2500];
int[] kepalay= new int[2500];
int jerukx=(round(random(47))+11)*8;
int jeruky=(round(random(47))+11)*8;
boolean lagi=true;
boolean gameberhenti=false;



void setup()
{
  restart();
  size(500,500);
  textAlign(CENTER);
}
void draw()
{
  if (gameberhenti)
  {
    //do nothing because of game over (stop playing)
  }
  else
  {
    //draw stationary stuff
  waktu+=1;

  fill(255,180,180);
  stroke(0);
  rect(jerukx,jeruky,8,8);
  fill(0);
  stroke(0);
  rect(jerukx+3,jeruky-1,2,4);
  
  rect(0,30,width,5);

  rect(0,0,8,height);

  //my modulating waktu by 5, we create artificial frames each 5 frames
  //(otherwise the game would go WAY too fast!)
  if ((waktu % 5)==0)
  {
    travel();
    display();
    checkdead();
  }
  }
}
//controls:
void keyPressed()
{
  if (key >= 'A' && key <= 'z') {
    // Convert the key to lowercase for uniformity
    char lowerKey = Character.toLowerCase(key);
    
    // Change the sudut based on the key pressed
    switch (lowerKey) {
      case 'w':
        if (sudut != 270 && (kepalay[1] - 8) != kepalay[2]) {
          sudut = 90;
        }
        break;
      case 's':
        if (sudut != 90 && (kepalay[1] + 8) != kepalay[2]) {
          sudut = 270;
        }
        break;
      case 'a':
        if (sudut != 0 && (kepalax[1] - 8) != kepalax[2]) {
          sudut = 180;
        }
        break;
      case 'd':
        if (sudut != 180 && (kepalax[1] + 8) != kepalax[2]) {
          sudut = 0;
        }
        break;
      default:
        // Ignore other keys
        break;
    }
  }
    if (keyCode == SHIFT)
    {
      //restart the game by pressing shift
      restart();
    }
  }

void travel()
{
  for(int i=ukuranular;i>0;i--)
  {
    if (i!=1)
    {
      //shift all the coordinates back one array
      kepalax[i]=kepalax[i-1];
      kepalay[i]=kepalay[i-1];
    }
    else
    {
      //move the new spot for the kepala of the snake, which is
      //always at kepalax[1] and kepalay[1].
      switch(sudut)
      {
        case 0:
        kepalax[1]+=8;
        break;
        case 90:
        kepalay[1]-=8;
        break;
        case 180:
        kepalax[1]-=8;
        break;
        case 270:
        kepalay[1]+=8;
        break;
      }
    }
  }
  
}
void display() {
  noStroke();
  fill(255);
  rect(20, 10, 460, 20);
  fill(0);
  textSize(14);
  int currentScore = ukuranular - 5;
  text("Skor: " + currentScore, 200, 25);
  

  // Update high score if the current score is greater
  if (currentScore > highScore) {
    highScore = currentScore;
  }

  text("High Score: " + highScore, 300, 25);

  if (kepalax[1] == jerukx && kepalay[1] == jeruky) {
    //grow and spawn the jeruk somewhere away from the snake
    //(currently some of the code below might not be working, but the game still works.)
    ukuranular += 1;
    lagi = true;
    while (lagi) {
      jerukx = (round(random(47)) + 10) * 8;
      jeruky = (round(random(47)) + 10) * 8;
      for (int i = 1; i < ukuranular; i++) {

        if (jerukx == kepalax[i] && jeruky == kepalay[i]) {

          text("Score:  " + str(ukuranular - 5) + " ", 250, 50);

          lagi = true;
        } else {
          lagi = false;
          i = 1000;
        }
      }
    }
  }
  
  //Kepala Ular
 
  fill(0,200,100);
  ellipseMode(CORNER);
  ellipse(kepalax[1],kepalay[1],12,12);
  fill(255);
  stroke(255);
  rect(kepalax[ukuranular],kepalay[ukuranular],12,12);
}
void checkdead()
{
  for(int i=2;i<=ukuranular;i++)
  {
    //is the kepala of the snake occupying the same spot as any of the snake chunks?
    if (kepalax[1]==kepalax[i] && kepalay[1]==kepalay[i])
    {
      
      rect(125,125,160,100);
      fill(0);
      text("GAME OVER",250,250);
      
      text("To restart, press Shift.",250,200);
      gameberhenti=true;
    }
 
    if (kepalax[1]>=(width-8) || kepalay[1]>=(height-8) || kepalax[1]<=0 || kepalay[1]<=37)
    { 
      fill(255);
      rect(250,125,160,100);
      fill(0);
      text("GAME OVER",250,250);
      text("To restart, press Shift.",250,200);
      gameberhenti=true;
    }
  }
}
void restart()
{

  background(255);
  kepalax[1]=200;
  kepalay[1]=200;
  for(int i=2;i<1000;i++)
  {
    kepalax[i]=0;
    kepalay[i]=0;
  }
  gameberhenti=false;
  jerukx=(round(random(55))+5)*8;
  jeruky=(round(random(55))+5)*8;
  ukuranular=5;
  waktu=0;
  sudut=0;
  lagi=true;
}
