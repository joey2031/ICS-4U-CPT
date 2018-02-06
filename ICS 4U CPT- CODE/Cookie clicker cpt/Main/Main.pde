import java.awt.*; // for extends frame in PFrame class
import java.awt.Frame.*; // for extends frame in PFrame class
import javax.swing.JFrame;
ArrayList<Ball> balls;
float cookiesInBank, cps, cookiesalltime, CPC, r;
int count, cookieClicks, numbOfBuildings, ballWidth;
boolean rectOver = false, ball = false, random = false; 
PImage CursorImage, GrandmaImage, FarmImage, FactoryImage, BankImgae, MineImage, TempleImage, WizImage, ShipmentImage, CookieImage, BackgroundImage, FallingCookieImage; 
// all the images on this line will be for achivenments
public PImage A1Image, A2Image, A3Image, A4Image, A5Image; 
public PImage upgradeBackground, U1Image, U2Image, U3Image, upgradeBoughtImage;
public PImage locked, Mouse, c1, weRise; // for locked achivenments.
public PFont font1;

//CBAT = cookies in bank all time. CPC = cookies per click

// first I made all the building objects
buildings Cursor = new buildings ("Cursor", "Autoclicks once every 10 seconds.", 15.0, 1.05, 0.1, 0, 0, 0); 
buildings Grandma = new buildings("grandma", "A nice grandma to bake more cookies", 100.0, 1.05, 1, 0, 0, 0);
buildings Farm = new buildings("Farm", "Grows cookie plants from cookie seeds.", 1100.0, 1.05, 8, 0, 0, 0); 
buildings Mine = new buildings("Farm", "Mines out cookie dough and chocolate chips.", 12000.0, 1.05, 47, 0, 0, 0);
buildings Factory = new buildings("Factory", "Produces large quantities of cookies.", 130000.0, 1.05, 260, 0, 0, 0);
buildings Bank = new buildings("Bank", "Generates cookies from interest.", 1400000.0, 1.05, 1400, 0, 0, 0);
buildings Temple = new buildings("Temple", "Full of precious ancient chocolate.", 20000000.0, 1.05, 7800, 0, 0, 0);
buildings WizTower = new buildings("Wizard tower", "Summons cookies with magic spells.", 330000000.0, 1.05, 44000, 0, 0, 0);
buildings Shipment = new buildings("Shipment", "Brings in fresh cookies from the cookie planet.", 5100000000.0, 1.05, 260000, 0, 0, 0);


public void settings() {
  size (1500, 790);
}

public void setup() { 
  numbOfBuildings = 0;
  count = 0;
  cookieClicks = 0;
  cookiesInBank = 0; 
  cps = 0; // need to shorten display of decimal numbers.  
  cookiesalltime = 0;
  CPC = 1;
  ballWidth = 40;
  CookieImage = loadImage ("Cookie.png");
  FallingCookieImage = loadImage ("Cookie.png");
  BackgroundImage = loadImage ("Background.jpg");
  CursorImage = loadImage ("Cursor.png");
  GrandmaImage = loadImage ("Grandma.png");
  FarmImage = loadImage ("Farm.png");
  FactoryImage = loadImage ("Factory.png");
  BankImgae = loadImage ("Bank.png");
  MineImage = loadImage ("Mine.png");
  TempleImage = loadImage ("Temple.png");
  WizImage = loadImage ("Wiz.png");
  ShipmentImage = loadImage ("Shipment.png");
  A1Image = loadImage ("A1wakeandbake.png"); 
  A2Image = loadImage("A2-makingsomedough.png");
  A3Image = loadImage ("WhiteCursor.png");
  A4Image = loadImage("Sobakedrightnow.png");
  A5Image = loadImage("GrandmaAchivenment1.png");
  upgradeBackground = loadImage("WoodSquare.png");
  U1Image = loadImage ("CursorUpgrade1.png");
  U2Image = loadImage ("GrandmaUpgrade1.png");
  U3Image = loadImage ("CursorUpgrade2.png");
  upgradeBoughtImage = loadImage ("x.png");
  locked = loadImage ("QuestionMark.jpg");
  Mouse = loadImage ("Mouse.png");
  c1 = loadImage ("C1.png");
  weRise = loadImage ("Werise.jpg");
  font1 = loadFont ("Silom-48.vlw");
  
  
  // Create an empty ArrayList (will store Ball objects)
  balls = new ArrayList<Ball>();
  // Start by adding one element
  balls.add(new Ball(r, 0, ballWidth)); // X pos, y Pos width
}

void draw () { // It seems like this is youe main method, this is to display any graphics
  fill(255);
  strokeWeight(3); // thickness
  line (350, 790, 350, 0); //line 
  drawBasics(); // putting most things in this method and having it above the hover method makes the outlines stay when you hover.
  hover();
  fallingCookies();
  drawCps(); // the square over the cookie
  cookiesPerSecond(); // the calculations
  drawImages();
  drawStats(); 
}



// by basics I mean all the squares for the buildings and text
void drawBasics() {
  background(355);

  strokeWeight(10);
  // building rectangles
  stroke(0);
  rect(1150, 12, 250, 60);

// the building turnes white when you have enough cookies!!
  if (cookiesInBank >= Cursor.getPrice()) { 
    fill (255);
    rect(1150, 90, 250, 60);
    fill (255);
  } else {
    fill (167);
    rect(1150, 90, 250, 60);
    fill (0);
  }

  if (cookiesInBank >= Grandma.getPrice()) {
    fill (255);
    rect (1150, 168, 250, 60);
    fill (255);
  } else {
    fill (167); // light grey
    rect (1150, 168, 250, 60);
    fill (0);
  }

  if (cookiesInBank >= Farm.getPrice()) { //  // y goes uo by 78
    fill (255);
    rect (1150, 246, 250, 60);
    fill (255);
  } else {
    fill (167);
    rect (1150, 246, 250, 60);
    fill (0);
  }

  if (cookiesInBank >= Mine.getPrice()) {
    fill (255);
    rect (1150, 324, 250, 60);
    fill (255);
  } else {
    fill (167);
    rect (1150, 324, 250, 60);
    fill (0);
  }
  if (cookiesInBank >= Factory.getPrice()) {
    fill (255);
    rect (1150, 402, 250, 60);
    fill (255);
  } else {
    fill (167);
    rect (1150, 402, 250, 60);
    fill (0);
  }
  if (cookiesInBank >= Bank.getPrice()) {
    fill (255);
    rect (1150, 480, 250, 60);
    fill (255);
  } else {
    fill (167);
    rect (1150, 480, 250, 60);
    fill (0);
  }
  if (cookiesInBank >= Temple.getPrice()) {
    fill (255);
    rect (1150, 558, 250, 60);
    fill (255);
  } else {
    fill (167);
    rect (1150, 558, 250, 60);
    fill (0);
  }
  if (cookiesInBank >= WizTower.getPrice()) {
    fill (255);
    rect (1150, 636, 250, 60);
    fill (255);
  } else {
    fill (167);
    rect (1150, 636, 250, 60);
    fill (0);
  }
  if (cookiesInBank >= Shipment.getPrice()) {
    fill (255);
    rect (1150, 714, 250, 60);
    fill (255);
  } else {
    fill (167);
    rect (1150, 714, 250, 60);
    fill (0);
  }
  
  
  fill (0);  
  rect (400, 90, 250, 200); // more button

  image (BackgroundImage, 396, 150);
  BackgroundImage.resize(530, 420);

  textFont (font1);
  // fills the rectangle with building names.
  textSize(30);
  fill (0);
  text ("Buildings", 1200, 50);
  fill (255);
  fill (0);
  text ("Cursor", 1250, 120);
  float printPrice = Cursor.getPrice();
  textSize(20);
  text (printPrice, 1250, 140);
  fill (255);
  fill (0);
  textSize(30);
  text ("Grandma", 1250, 200);
  float printPrice2 = Grandma.getPrice();
  textSize(20);
  text (printPrice2, 1250, 220);
  fill (255);
  fill (0);
  textSize(30);
  text ("Farm", 1260, 275); 
  float printPrice3 = Farm.getPrice();
  textSize(20);
  text (printPrice3, 1250, 295);
  fill (255);
  fill (0);
  textSize(30);
  text ("Mine", 1260, 355);
  float printPrice4 = Mine.getPrice();
  textSize(20);
  text (printPrice4, 1250, 376);
  fill (255);
  fill (0);
  textSize(25);
  text ("Factory", 1250, 430);
  float printPrice5 = Factory.getPrice();
  textSize(20);
  text (printPrice5, 1242, 453);
  fill (255); // needs to end on a fill of 255 
  fill (0); 
  textSize(30);
  text ("Bank", 1250, 510);
  float printPrice6 = Bank.getPrice();
  textSize(20);
  text (printPrice6, 1242, 530);
  fill (255);
  fill (0);
  textSize(27);
  text ("Temple", 1223, 590);
  float printPrice7 = Temple.getPrice();
  textSize(20);
  text (printPrice7, 1220, 610);
  fill (255);
  fill (0);
  textSize(25);
  text ("Wizard Tower", 1205, 665);
  float printPrice8 = WizTower.getPrice();
  textSize(20);
  text (printPrice8, 1220, 690);
  fill (255);
  fill (0);
  textSize(25);
  text ("Shipment", 1250, 740);
  float printPrice9 = Shipment.getPrice();
  textSize(20);
  text (printPrice9, 1210, 765);
  fill (255);
  textSize(35);
  fill (255);
  text("More", 480, 130);  
  fill (255);
  fill (0);
  fill (255);
}

// for the square above the cookie: the cps and cookies they have right now.
void drawCps() {
  fill(150);
  stroke (12);
  rect(10, 150, 330, 130); // draw method is always being called. This rect is where the cookies in bank will be displayed.
  textSize(30);
  fill(255); // for text below
  String sa = nf (cps, 0, 2);
  String sb = nf (cookiesInBank, 0, 2); // 2 decimals.
  text((sb + " Cookies"), 20, 190); 
  text((sa + " Cps"), 150, 260);
}


// all the images are drawn in here
void drawImages() {
  image (CookieImage, -5, 280);
  CookieImage.resize(332, 340);
  image (CursorImage, 1200, 100); 
  CursorImage.resize(40, 40);
  image(GrandmaImage, 1155, 173); // x, y
  GrandmaImage.resize(50, 50);
  image (FarmImage, 1155, 248);
  FarmImage.resize(55, 55);
  image (MineImage, 1155, 329);
  MineImage.resize(51, 51);
  image (FactoryImage, 1155, 408);
  FactoryImage.resize(50, 50);
  image (BankImgae, 1155, 485);
  BankImgae.resize(50, 50);
  image (TempleImage, 1155, 563);
  TempleImage.resize(51, 51);
  image (WizImage, 1155, 640);
  WizImage.resize(51, 51);
  image (ShipmentImage, 1155, 720);
  ShipmentImage.resize(51, 51);
  locked.resize(60, 60);
  upgradeBackground.resize (80, 80);
  upgradeBoughtImage.resize(60, 60);
  FallingCookieImage.resize (70, 70);
  
  Mouse.resize (145, 145); // person clicing
  image (Mouse, 650, 5);
  c1.resize (200, 200); // mouse image
  image (c1, 550, 570);  
  weRise.resize(300, 200);
  image (weRise, 270, 570);  
}


// this is for all the stats
void drawStats() {
  String sb = nf (cookiesInBank, 0, 2);
  String sa = nf (cookiesalltime, 0, 2); // clean up the decimals, 2 places looks good.
  fill (255);
  textSize(15);
  text ("Cookies in bank: " + sb, 410, 260);
  text ("Cookies baked all time: " + sa, 410, 300); // no to sure how to do this one. // in cps method
  text ("Cookie clicks: " + cookieClicks, 410, 340);
  text ("Buildinds owned: " + numbOfBuildings, 410, 380); // y goes up by 40
  text ("Cookies per click: " + CPC, 410, 420);

  textSize (50);
  text ("Stats", 600, 200);
}

// this does not go in the draw method because this action only occurs when the mouse is pressed.
// aka put what you want to happen when you click the mouse in this method.
void mouseReleased() { // this method is for anything that has to do with clicking, eg, baking cookies and buying buildings
  println ("x: " + mouseX + " y: " + mouseY);
  if (mouseX >= 14 && mouseX <= 307 && mouseY >= 303 && mouseY <= 589) { //points of the circle to give the muose click a range!!
    cookiesInBank+= CPC;
    cookiesalltime+= CPC;
    cookieClicks++;
    println (cookiesInBank); 
    redraw();

    r = random(3, 325);
    balls.add(new Ball(r, 0, ballWidth)); // cookie will be drawen in a random spot everytime.
  }

 // all these if statnments are saying if you have enough cookies and try to buy a building then add the cps, if you do not have enough
 // cookies then do nothing
  if (mouseX >= 1156 && mouseX <= 1399 && mouseY >= 96 && mouseY <= 147) { // cursor
    if (cookiesInBank >= Cursor.getPrice()) { 
      cps = cps + Cursor.getAddcps(); // if the user has enough add X ammount of cps to their total based on the building they want. 
      cookiesInBank = cookiesInBank - Cursor.getPrice();  // the price of the cursor will be subtracted from the users cookies in bank
      Cursor.setnumbOf (Cursor.getnumbOf() + 1); // increases number of cursors by 1 everytime you buy one
      numbOfBuildings++;
      Cursor.setPrice(Cursor.getPrice() * 1.07); // I think this is a good multplier
      Cursor.setTotalCps(Cursor.getTotalCps() + Cursor.getAddcps());  // cps just from this specific building!!
    } else {
      print ("you do not have enough");
    }
  }

  if (mouseX >= 1155 && mouseX <= 1401 && mouseY >= 170 && mouseY <= 229) { // grandma
    if (cookiesInBank >= Grandma.getPrice()) {
      cps = cps + Grandma.getAddcps(); 
      cookiesInBank = cookiesInBank - Grandma.getPrice();
      Grandma.setnumbOf (Grandma.getnumbOf() + 1); 
      numbOfBuildings++;
      Grandma.setPrice(Grandma.getPrice() * 1.07);
      Grandma.setTotalCps(Grandma.getTotalCps() + Grandma.getAddcps());
    } else {
      print ("you dont have enough for grandma");
    }
  } 

  if (mouseX >= 1154 && mouseX <= 1397 && mouseY >= 249 && mouseY <= 307) { // farm
    if (cookiesInBank >= Farm.getPrice()) {
      cps = cps + Farm.getAddcps(); 
      cookiesInBank = cookiesInBank - Farm.getPrice();
      Farm.setnumbOf (Farm.getnumbOf() + 1); 
      numbOfBuildings++;
      Farm.setPrice(Farm.getPrice() * 1.07);
      Farm.setTotalCps(Farm.getTotalCps() + Farm.getAddcps());
    } else {
      print ("you dont have enough for the farm");
    }
  }

  if (mouseX >= 1155 && mouseX <= 1399 && mouseY >= 328 && mouseY <= 383) { // mine
    if (cookiesInBank >= Mine.getPrice()) {
      cps = cps + Mine.getAddcps();
      cookiesInBank = cookiesInBank - Mine.getPrice();
      Mine.setnumbOf (Mine.getnumbOf() + 1); 
      numbOfBuildings++;
      Mine.setPrice(Mine.getPrice() * 1.07); 
      Mine.setTotalCps(Mine.getTotalCps() + Mine.getAddcps());
      print ("you have enough for the mine");
    } else {
      print ("you dont have enough for the mine");
    }
  }


  if (mouseX >= 1152 && mouseX <= 1402 && mouseY >= 407  && mouseY <= 460 ) { // these are all the paramaters for the buildings so people can click one to buy one
    if (cookiesInBank >= Factory.getPrice()) {
      cps = cps + Factory.getAddcps(); 
      cookiesInBank = cookiesInBank - Factory.getPrice();
      Factory.setnumbOf (Factory.getnumbOf() + 1); 
      numbOfBuildings++;
      Factory.setPrice(Factory.getPrice() * 1.07); 
      Factory.setTotalCps(Factory.getTotalCps() + Factory.getAddcps());
      print ("you have enough for the factory");
    } else {
      print ("you dont have enough for the factory");
    }
  }


  if (mouseX >= 1154 && mouseX <= 1403 && mouseY >= 482  && mouseY <= 547 ) { // bank
    if (cookiesInBank >= Bank.getPrice()) {
      cps = cps + Bank.getAddcps(); 
      cookiesInBank = cookiesInBank - Bank.getPrice();
      Bank.setnumbOf (Bank.getnumbOf() + 1); 
      numbOfBuildings++;
      Bank.setPrice(Bank.getPrice() * 1.07);
      Bank.setTotalCps(Bank.getTotalCps() + Bank.getAddcps());
    } else {
      print ("you dont have enough for the bank");
    }
  }


  if (mouseX >= 1152 && mouseX <= 1402 && mouseY >= 560  && mouseY <= 622 ) { // temple
    if (cookiesInBank >= Temple.getPrice()) {
      cps = cps + Temple.getAddcps(); 
      cookiesInBank = cookiesInBank - Temple.getPrice();
      Temple.setnumbOf (Temple.getnumbOf() + 1); 
      numbOfBuildings++;
      Temple.setPrice(Temple.getPrice() * 1.07);
      Temple.setTotalCps(Temple.getTotalCps() + Temple.getAddcps());
    } else {
      print ("you dont have enough for the temple");
    }
  }


  if (mouseX >= 1149 && mouseX <= 1403 && mouseY >= 637  && mouseY <= 699 ) {
    if (cookiesInBank >= WizTower.getPrice()) {
      cps = cps + WizTower.getAddcps(); 
      cookiesInBank = cookiesInBank - WizTower.getPrice();
      WizTower.setnumbOf (WizTower.getnumbOf() + 1); 
      numbOfBuildings++;
      WizTower.setPrice(WizTower.getPrice() * 1.07);
      WizTower.setTotalCps(WizTower.getTotalCps() + WizTower.getAddcps());
    } else {
      print ("you dont have enough for wizard tower");
    }
  }

  if (mouseX >= 1149 && mouseX <= 1405 && mouseY >= 715  && mouseY <= 780) {
    if (cookiesInBank >= Shipment.getPrice()) {
      cps = cps + Shipment.getAddcps(); 
      cookiesInBank = cookiesInBank - Shipment.getPrice();
      Shipment.setnumbOf (Shipment.getnumbOf() + 1); 
      numbOfBuildings++;
      Shipment.setPrice(Shipment.getPrice() * 1.07);
      Shipment.setTotalCps(Shipment.getTotalCps() + Shipment.getAddcps());
    } else {
      print ("you dont have enough for shipment");
    }
  }


  if (mouseX >= 404 && mouseX <= 651 && mouseY >= 92  && mouseY <= 183) { // more button
    runSketch(new String[]{"Achivenments"}, new More());
  }
}


// this does all the math for the cps
void cookiesPerSecond() { // this method is in draw so thats why it updates
  if (cps > 0) { 
    count++; // aka framerate draw updates 60fps
    if (count == 60) {// If a second passes
      count = 0; // reset to 0
      cookiesInBank+= cps; // update cookies in bank
      cookiesalltime+= cps;
    }
  }
}


// for all the hovering in the game
void hover() { // when the user hovers over a building its information will pop up!!
  //this is just for fills you dont draw shapes in this method


  // if you hover over a certin building then draw more info.. as seen in the methods
  if (overRect(1150, 246, 250, 60)) { // farm 
    drawHover();
  } else if (overRect(1149, 89, 250, 60)) { // cursor // x, from top corner y from top corner width, height
    drawHovertwo();
  } else if (overRect(1147, 168, 250, 60)) { // grandma
    drawHoverthree();
  } else if (overRect(1147, 325, 250, 60)) { // mine
    drawHoverfour();
  } else if (overRect(1148, 401, 250, 60)) { // factory
    drawHoverfive();
  } else if (overRect(1148, 480, 250, 60)) { // bank
    drawHoversix();
  } else if (overRect(1148, 559, 250, 60)) { // temple
    drawHoverseven();
  } else if (overRect(1149, 635, 250, 60)) { // wizard tower
    drawHovereight();
  } else if (overRect(1148, 714, 250, 60)) { //shipment
    drawHovernine();
  } else {
    drawBasics(); // id think you need this becasue this method is always being drawn in the draw method.
  }
}

// one method for each kind of hover**
void drawHover() {// farm
  noStroke();
  fill (135, 34, 55); // red
  rect(830, 245, 300, 150); // x. y. width. height
  textSize(12);
  fill (255);
  String printInfo = Farm.getInfo();
  int printNumbOf = Farm.getnumbOf();
  float printPrice = Farm.getPrice();
  float printaddCps = Farm. getAddcps();
  text (printInfo, 850, 270);
  text (printNumbOf + " farms owned.", 850, 290);
  text ("Price: " + printPrice + " cookies", 850, 310); 
  text ("Each farm adds " + printaddCps + " cps.", 850, 330); // go up by 30.
  text (Farm.getTotalCps() + "cps from farms", 850, 350);
}

void drawHovertwo() { // cursor
  noStroke();
  fill (135, 34, 55); // red
  rect(830, 95, 300, 150); // x. y. width. height
  textSize(12);
  fill (255); // white
  String printInfo = Cursor.getInfo();
  int printNumbOf = Cursor.getnumbOf();
  float printPrice = Cursor.getPrice();
  float printaddCps = Cursor.getAddcps();
  text (printInfo, 850, 120); // It works now!
  text (printNumbOf + " cursors owned.", 850, 140);
  text ("Price: " + printPrice + " cookies", 850, 160);
  text ("Each cursor adds " + printaddCps + " cps.", 850, 180); //y goes up by 20.
  text (Cursor.getTotalCps() + "cps from cursors", 850, 200);
}

void drawHoverthree() { // grandma
  noStroke();
  fill (135, 34, 55); // red
  rect(830, 165, 300, 150); // x. y. width. height
  textSize(12);
  fill (255);
  String printInfo = Grandma.getInfo();
  int printNumbOf = Grandma.getnumbOf();
  float printPrice = Grandma.getPrice();
  float printaddCps = Grandma.getAddcps();
  text (printInfo, 850, 190); // from this y to the next y goes up by 20.
  text (printNumbOf + " grandmas owned.", 850, 210);
  text ("Price: " + printPrice + " cookies", 850, 230);
  text ("Each Grandma adds " + printaddCps + " cps.", 850, 250);
  text (Grandma.getTotalCps() + "cps from grandmas", 850, 270);
}
void drawHoverfour() { // mine
  noStroke();
  fill (135, 34, 55); // red
  rect(830, 320, 300, 150); // x. y. width. height
  textSize(11);
  fill (255);
  String printInfo = Mine.getInfo();
  int printNumbOf = Mine.getnumbOf();
  float printPrice = Mine.getPrice();
  float printaddCps = Mine.getAddcps();
  text (printInfo, 850, 340); // from this y to the next y goes up by 20.
  text (printNumbOf + " Mines owned.", 850, 360);
  text ("Price: " + printPrice + " cookies", 850, 380);
  text ("Each Mine adds " + printaddCps + " cps.", 850, 400);
  text (Mine.getTotalCps() + "cps from mines", 850, 420);
}

void drawHoverfive() { // Factory
  noStroke();
  fill (135, 34, 55); // red
  rect(830, 400, 300, 150); // x. y. width. height
  textSize(12);
  fill (255);
  String printInfo = Factory.getInfo();
  int printNumbOf = Factory.getnumbOf();
  float printPrice = Factory.getPrice();
  float printaddCps = Factory.getAddcps();
  text (printInfo, 850, 420); // from this y to the next y goes up by 20.
  text (printNumbOf + " factorys owned.", 850, 440);
  text ("Price: " + printPrice + " cookies", 850, 460);
  text ("Each Factory adds " + printaddCps + " cps.", 850, 480);
  text (Factory.getTotalCps() + "cps from factorys", 850, 500);
}
void drawHoversix() { // bank
  noStroke();
  fill (135, 34, 55); // red
  rect(830, 480, 300, 150); // x. y. width. height
  textSize(12);
  fill (255);
  String printInfo = Bank.getInfo();
  int printNumbOf = Bank.getnumbOf();
  float printPrice = Bank.getPrice();
  float printaddCps = Bank.getAddcps();
  text (printInfo, 850, 500); // from this y to the next y goes up by 20.
  text (printNumbOf + " banks owned.", 850, 520);
  text ("Price: " + printPrice + " cookies", 850, 540);
  text ("Each bank adds " + printaddCps + " cps.", 850, 560);
  text (Bank.getTotalCps() + "cps from banks", 850, 580);
}


void drawHoverseven() { // temple
  noStroke();
  fill (135, 34, 55); // red
  rect(830, 520, 300, 150); // x. y. width. height
  textSize(12);
  fill (255);
  String printInfo = Temple.getInfo();
  int printNumbOf = Temple.getnumbOf();
  float printPrice = Temple.getPrice();
  float printaddCps = Temple.getAddcps();
  text (printInfo, 850, 540); // from this y to the next y goes up by 20.
  text (printNumbOf + " temples owned.", 850, 560);
  text ("Price: " + printPrice + " cookies", 850, 580);
  text ("Each temple adds " + printaddCps + " cps.", 850, 600);
  text (Temple.getTotalCps() + "cps from temples", 850, 620);
}
void drawHovereight() { // wizard tower
  noStroke();
  fill (135, 34, 55); // red
  rect(830, 540, 300, 150); // x. y. width. height
  textSize(12);
  fill (255);
  String printInfo = WizTower.getInfo();
  int printNumbOf = WizTower.getnumbOf();
  float printPrice = WizTower.getPrice();
  float printaddCps = WizTower.getAddcps();
  text (printInfo, 850, 560); // from this y to the next y goes up by 20.
  text (printNumbOf + " wizard towers owned.", 850, 580);
  text ("Price: " + printPrice + " cookies", 850, 600);
  text ("Each wizard tower adds " + printaddCps + " cps.", 850, 620);
  text (WizTower.getTotalCps() + "cps from wizard towers", 850, 640);
}


void drawHovernine() { // shipment
  noStroke();
  fill (135, 34, 55); // red
  rect(830, 620, 300, 150); // x. y. width. height
  textSize(10);
  fill (255);
  String printInfo = Shipment.getInfo();
  int printNumbOf = Shipment.getnumbOf();
  float printPrice = Shipment.getPrice();
  float printaddCps = Shipment.getAddcps();
  text (printInfo, 850, 640); // from this y to the next y goes up by 20.
  text (printNumbOf + " shipments owned.", 850, 660);
  text ("Price: " + printPrice + " cookies", 850, 680);
  text ("Each shipnment adds " + printaddCps + " cps.", 850, 700);
  text (Shipment.getTotalCps() + "cps from shipments", 850, 720);
}

// for the falling cookies
void fallingCookies() {
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) { // if its done falling remove it from the list
      // Items can be deleted with remove()
      balls.remove(i);
    }
  }
}


boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) { // aka the rectangle
    return true;
  } else {
    return false;
  }
}