private boolean infoTab = true, achievementTab = false, upgradesTab = false; // for the tabs 
private boolean unlokced1 = false, unlocked2 = false, unlocked3 = false, unlocked4 = false; // for the achivenments 
private boolean upgrade1 = false, upgrade2= false, upgrade3 = false, unlocked5 = false; // if you unlock a upgrade these will be true
private boolean bought = false, bought2 = false, bought3 = false; // for buying things...


// achivenment objects
Achievement lockedInfo = new Achievement ("?????", "?????");
Achievement WakeAndBake = new Achievement ("Wake and bake:", "you baked 1 cookie!!" );
Achievement MakingSomeDough = new Achievement ("Making some dough", "you baked 100 cookies" );
Achievement soBakedRightNow = new Achievement ("So baked right now", "you baked 1000 cookies" );
Achievement ClickedAchivenment = new Achievement ("Clicked", "Have 1 cursor.");
Achievement GrandmasCookies = new Achievement ("Grandma's cookies", "Have 1 grandma.");

// Upgrade objects
Upgrades Clicked = new Upgrades ("Reinforced index finger", "The mouse and cursors are twice", 100); // rest of sentence in hover methodd for this object
Upgrades ForwardsFromGrandma = new Upgrades ("ForwardsFromGrandma", "Grandmas are twice as efficient.", 1000);
Upgrades CarpalTunnelPreventionCream = new Upgrades ("Carpal tunnel prevention cream", "The mouse and cursors are twice", 500 ); 

class More extends PApplet {

  // if I make a onject in this class it will mess up the images??

  public void settings() { 
    size(900, 900);
  }
  public void draw() {
    drawbasics();  
    drawTabs();

    if (bought == true && upgradesTab == true) { // drawing the X's
      drawBought();
    }
    if (bought2 == true && upgradesTab == true) { // if they BOUGHT the upgrade!
      drawBought2();
    }
    if (bought3 == true && upgradesTab == true) {
      drawBought3();
    }
    hover();
  }

// same idea as the drawBasics in the main method
  void drawbasics() {
    background(255, 0, 0);    
    rect (100, 90, 150, 80); // tab button 1.
    rect (350, 90, 150, 80); // tab button 2, achivenments. // each button will open a new window.
    rect (600, 90, 150, 80); // tab button 3
    rect (100, 150, 650, 540); // big rectangle in the middle 

    fill (0);
    textSize(17);
    text("Info/ Instructions", 105, 130);
    textSize(20);
    text ("Achievements", 360, 130);
    textSize(20);
    text ("Upgrades", 630, 130);
  }


  void mouseReleased() { // this method is for anything that has to do with clicking, eg, baking cookies and buying buildings
    println ("x: " + mouseX + " y: " + mouseY);

   // by usinf if else and booleans im able to make the tabs
    if (mouseX >= 102 && mouseX <= 249 && mouseY >= 93  && mouseY <= 152) { //info tab
      infoTab = true; 
      achievementTab = false;
      upgradesTab = false;
    } else if (mouseX >= 352 && mouseX <= 500 && mouseY >= 95  && mouseY <= 152) {
      achievementTab = true;
      infoTab = false; 
      upgradesTab = false;
    } else if (mouseX >= 601 && mouseX <= 750 && mouseY >= 95  && mouseY <= 152) {
      upgradesTab = true;
      achievementTab = false;
      infoTab = false;
    }

    // clicking, buying the upgrades. 
    if (mouseX >= 135 && mouseX <= 186 && mouseY >= 266  && mouseY <= 318 && upgradesTab == true &&  upgrade1 == true) { // unlocked "clicked" upgrade
      if (cookiesInBank >= Clicked.getPrice() && Cursor.getnumbOf() >= 1) {    
        cookiesInBank = cookiesInBank - Clicked.getPrice();
        CPC = CPC * 2; // this works because CPC is in the main and is public/global
        cps = cps - Cursor.getTotalCps(); // cps is equal to old cps - the old cursor cps
        Cursor.setAddcps(Cursor.getAddcps() * 2); // now we multpily the cursors cps by 2, for the indiviual building
        Cursor.setTotalCps(Cursor.getTotalCps() * 2); // and the total cps of the building, for ALL of the cursor buildings.
        cps = cps + Cursor.getTotalCps(); // now add back the new cursor cps, to the main cps of the game.
        bought = true;
        // when this gets clicked a square needs to be drawn over it.
      }
    }

    if (mouseX >= 205 && mouseX <= 255 && mouseY >= 267  && mouseY <= 318 && upgradesTab == true &&  upgrade2 == true) { // ForwardsFromGrandma
      if (cookiesInBank >= ForwardsFromGrandma.getPrice() && Grandma.getnumbOf() >= 1) {
        cps = cps - Grandma.getTotalCps();
        Grandma.setAddcps(Grandma.getAddcps() * 2); 
        Grandma.setTotalCps(Grandma.getTotalCps() * 2);
        cps = cps + Grandma.getTotalCps();
        bought2 = true;
      }
    }

    if (mouseX >= 135 && mouseX <= 186 && mouseY >= 337  && mouseY <= 386 && upgradesTab == true &&  upgrade3 == true) { // CarpalTunnelPreventionCream 
      if (cookiesInBank >= CarpalTunnelPreventionCream.getPrice() && Cursor.getnumbOf() >= 1) {
        CPC = CPC * 2; // this works because CPC is in the main and is public/global
        cps = cps - Cursor.getTotalCps(); // cps is equal to old cps - the old cursor cps
        Cursor.setAddcps(Cursor.getAddcps() * 2); // now we multpily the cursors cps by 2, for the indiviual building
        Cursor.setTotalCps(Cursor.getTotalCps() * 2); // and the total cps of the building, for ALL of the cursor buildings.
        cps = cps + Cursor.getTotalCps(); // now add back the new cursor cps, to the main cps of the game.
        bought3 = true;
      }
    }
  }

  /////////////////////////////////////////////////////// tabs method
  
  
// the tabs screen
  void drawTabs() {
    if (infoTab == true) {
      fill (0);
      rect (100, 150, 650, 540); 
      fill (255);
      textSize(60);
      text("Info", 350, 200);
      textSize(20); 
      text ("Cookie clicker is a game developed by Joey Assal for his grade 12", 100, 230);
      text("Computer Science CPT, in Java Processing.", 100, 260);
      textSize(60);
      text("Instructions", 260, 335);
      textSize(20);
      text("You start with 0 cookies in your bank and 0 cookies per second.", 100, 370);
      text("Start clicking the big cookie to add to the bank, when you have", 100, 400);
      text("enough cookies for a building and you buy one, your cookies per", 100, 430);
      text("second (cps) will increase based on the amount the building gives", 100, 460);
      text("you.", 100, 490);
      text(" ", 100, 520);
      text("keep doing this to unlock upgrades and achivenments!", 100, 550);
      text("Have fun, and thanks for playing!", 100, 580);
    } 

 // so you cant be in another tab and a achivenment gets drawn.
 // the achivenments screen
    if (achievementTab == true) {
      fill (55);
      rect (100, 150, 650, 540); 
      fill (255);
      textSize(60);
      text("Achievements", 250, 200);


      // if cetrtin conditions are meat then unlock a achivenment, else, show the achivenment image.
      if (cookiesalltime >= 1) { // when I fix the cookies all time need to change this to if cookies all time is greater or = to 1.
        // you need to load the image in the main class but do the placenments in this class!!
        unlokced1 = true;
        image (A1Image, 120, 250);
      } else {
        image (locked, 120, 250);
      } 
      if (cookiesalltime >= 100) {    
        unlocked2 = true;
        image (A2Image, 190, 250); // x goes up by 70
      } else {
        image (locked, 190, 250);
      }
      if (Cursor.getnumbOf() >= 1) {
        unlocked3 = true;
        image (A3Image, 330, 250); // 330, 250
      } else {
        image (locked, 330, 250); //330, 250
      }
      if (cookiesalltime >=1000) {
        unlocked4 = true;
        image (A4Image, 260, 250); // 260, 250
      } else {
        image (locked, 260, 250); // 260, 250
      }

      if (Grandma.getnumbOf() >= 1) {
        unlocked5 = true;
        image (A5Image, 400, 250);
      } else {
        image (locked, 400, 250); // 260, 250
      }
    }


// the upgraes screen
    if (upgradesTab == true) {
      fill (90);
      rect (100, 150, 650, 540); 
      fill (255);
      textSize(60);
      text("Upgrades", 300, 200); 

// if certin conditions are meant then show the upgrade since they unlocked it!
      if (Cursor.getnumbOf() >= 1) {
        upgrade1 = true;
        upgrade3 = true; // because of 2 cursor upgrades.
        image (upgradeBackground, 120, 250);
        image (U1Image, 145, 273);
        image (upgradeBackground, 120, 320);
        image (U3Image, 145, 345);
      }
      if (Grandma.getnumbOf() >= 1) {
        upgrade2 = true;
        image (upgradeBackground, 190, 250); // x is going up by 70s between metods
        image (U2Image, 215, 273);
      }
    }
  }

  /////////////////////////////////////////////////////// tabs method

// all the hoering for every achivenment and upgrade
  void hover() {
    if (overRect(124, 252, 59, 60) && achievementTab == true) { // x from top corner, y from top corner, width, height
      // width height = x2-x1, y2-y1
      drawHover();
    }
    if (overRect(193, 253, 57, 59) && achievementTab == true) {
      drawHover2();
    } 

    if (overRect(333, 254, 58, 55) && achievementTab == true) { // 4th box
      drawHover3();
    }

    if (overRect(263, 253, 58, 58) && achievementTab == true) { // 3rd box
      drawHover4();
    }
    if (overRect(403, 252, 58, 58) && achievementTab == true) { // 3rd box
      drawHover5();
    } 

    // starting here is all for upgrades
    if (overRect(137, 268, 50, 53) && upgradesTab == true && upgrade1 == true) { 
      drawhoverUpgrade1();
    }

    if (overRect(206, 268, 52, 52) && upgradesTab == true && upgrade2 == true) { 
      drawhoverUpgrade2();
    }
    if (overRect(138, 336, 51, 52) && upgradesTab == true && upgrade3 == true) { 
      drawhoverUpgrade3();
    }
  }


// saying if the achivenment is locked show "????" else tell the user how they got the achivenment
  void drawHover() {
    noStroke();
    fill (135, 34, 55); // red
    rect(100, 145, 200, 100); // x. y. width. height
    textSize(12);

    String printLockedName = lockedInfo.getName();
    String printLockedInfo = lockedInfo.getInfo();
    fill (255);
    text (printLockedName, 110, 160);
    text (printLockedInfo, 110, 180);
    fill (255);

    if (unlokced1 == true) {
      fill (135, 34, 55); // red
      rect(100, 145, 200, 100); // x. y. width. height
      fill (255);
      String PrintName = WakeAndBake.getName();
      String printInfo = WakeAndBake.getInfo();
      text (PrintName, 110, 160);
      text (printInfo, 110, 180);
      fill (255);
    }
  }
  void drawHover2() {
    noStroke();
    fill (135, 34, 55); // red
    rect(150, 145, 200, 100); // x. y. width. height
    textSize(12);
    String printLockedName = lockedInfo.getName();
    String printLockedInfo = lockedInfo.getInfo();
    fill (255);
    text (printLockedName, 160, 160);
    text (printLockedInfo, 160, 180);
    fill (255);

    if (unlocked2 == true) {
      fill (135, 34, 55); // red
      rect(150, 145, 200, 100); // x. y. width. height
      fill (255);
      String PrintName = MakingSomeDough.getName();
      String printInfo = MakingSomeDough.getInfo();
      text (PrintName, 160, 160);
      text (printInfo, 160, 180);
      fill (255);
    }
  }


  void drawHover3() { // for 4th box
    noStroke();
    fill (135, 34, 55); // red
    rect(210, 145, 200, 100); // x. y. width. height
    textSize(12);
    String printLockedName = lockedInfo.getName();
    String printLockedInfo = lockedInfo.getInfo();
    fill (255);
    text (printLockedName, 220, 160);
    text (printLockedInfo, 220, 180);
    fill (255);

    if (unlocked3 == true) { // cursor
      String PrintName = ClickedAchivenment.getName();
      String printInfo = ClickedAchivenment.getInfo();
      fill (135, 34, 55); // red
      rect(210, 145, 200, 100); // x. y. width. height
      fill (255);
      text (PrintName, 220, 160);
      text (printInfo, 220, 180);
      fill (255);
    }
  }

  void drawHover4() { // for 3rd box
    noStroke();
    fill (135, 34, 55); // red
    rect(200, 145, 200, 100); // x. y. width. height
    textSize(12);
    String printLockedName = lockedInfo.getName();
    String printLockedInfo = lockedInfo.getInfo();
    fill (255);
    text (printLockedName, 210, 160);
    text (printLockedInfo, 210, 180);
    fill (255);

    if (unlocked4 == true) { // 1000 cookies 
      String PrintName = soBakedRightNow.getName();
      String PrintInfo = soBakedRightNow.getInfo();
      fill (135, 34, 55); // red
      rect(200, 145, 200, 100); // x. y. width. height
      fill (255);
      text (PrintName, 210, 160);
      text (PrintInfo, 210, 180); 
      fill (255);
    }
  }
  void drawHover5() {
    noStroke();
    fill (135, 34, 55); // red
    rect(250, 145, 200, 100); // x. y. width. height
    textSize(12);
    String printLockedName = lockedInfo.getName();
    String printLockedInfo = lockedInfo.getInfo();
    fill (255);
    text (printLockedName, 260, 160);
    text (printLockedInfo, 260, 180);
    fill (255);

    if (unlocked5 == true) { // 1000 cookies 
      String PrintName = GrandmasCookies.getName();
      String PrintInfo = GrandmasCookies.getInfo();
      fill (135, 34, 55); // red
      rect(200, 145, 200, 100); // x. y. width. height
      fill (255);
      text (PrintName, 210, 160);
      text (PrintInfo, 210, 180); 
      fill (255);
    }
  }




  //drawHover is for the achivenments.
  void drawhoverUpgrade1() {
    noStroke();
    fill (135, 34, 55); // red
    rect(100, 145, 200, 100); // x. y. width. height
    textSize(12);
    fill (255);
    text (Clicked.getName(), 100, 160);
    text (Clicked.getInfo(), 100, 180);
    text ("as efficient.", 100, 200);
    text ("Price: " + Clicked.getPrice() + " cookies.", 100, 220);
    fill (255);
  }


  void drawhoverUpgrade2() {
    noStroke();
    fill (135, 34, 55); // red
    rect(100, 145, 200, 100); // x. y. width. height
    textSize(12);
    fill (255);
    text (ForwardsFromGrandma.getName(), 100, 160);
    text (ForwardsFromGrandma.getInfo(), 100, 180);
    text ("Price: " + ForwardsFromGrandma.getPrice() + " cookies.", 100, 200);
    fill (255);
  }
  void drawhoverUpgrade3() {
    noStroke();
    fill (135, 34, 55); // red
    rect(100, 220, 200, 100); // x. y. width. height
    textSize(12);
    fill (255);
    text (CarpalTunnelPreventionCream.getName(), 100, 250);
    text (CarpalTunnelPreventionCream.getInfo(), 100, 270);
    text ("as efficient.", 100, 290);
    text ("Price: " + CarpalTunnelPreventionCream.getPrice() + " cookies.", 100, 310);
    fill (255);
  }

// if you buy a upgrade draw a "X" over it to show the user they have it.
  void drawBought() {
    image (upgradeBoughtImage, 130, 260); // the X image
    upgrade1 = false; // so you can't buy it again, 
  }
  void drawBought2() {
    image (upgradeBoughtImage, 200, 260);
    upgrade2 = false; // so you can't buy it again, 
  }
  void drawBought3() {
    image (upgradeBoughtImage, 130, 330); // the X image
    upgrade3 = false;
  }


  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) { // aka the rectangle
      return true;
    } else {
      return false;
    }
  }


  public void exit() {
  } // overrides the exit() method to only exit THIS!! window.
}