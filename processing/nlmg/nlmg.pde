/* @pjs preload="processing/nlmg/data/cottages.jpg,processing/nlmg/data/kathy_transparent.png,processing/nlmg/data/tommy_transparent.png,processing/nlmg/data/ruth_transparent.png,processing/nlmg/data/daniel_radcliffe_transparent.png,processing/nlmg/data/emma_watson_transparent.png,processing/nlmg/data/rupert_grint_transparent.png"; */

var bg, kathy, tommy, ruth, harry, hermione, ron;
var randPics = [harry, hermione, ron];

var arrowUp = false, arrowDown = false, arrowLeft = false, arrowRight = false;

var me;

void setup() {
  size(400, 400);
  frameRate(30);
  imageMode(CENTER);
  background(0, 0, 0);
  
  fill(0);
  textAlign(CENTER);
  text("Loading...", width/2, height/2);
  
  bg = loadImage("processing/nlmg/data/cottages.jpg");
  kathy = requestImage("processing/nlmg/data/kathy_transparent.png");
  tommy = requestImage("processing/nlmg/data/tommy_transparent.png");
  ruth = requestImage("processing/nlmg/data/ruth_transparent.png");
  harry = requestImage("processing/nlmg/data/daniel_radcliffe_transparent.png");
  hermione = requestImage("processing/nlmg/data/emma_watson_transparent.png");
  ron = requestImage("processing/nlmg/data/rupert_grint_transparent.png");
  
  me = new Person("tommy");
}

var Person = function(name) {
  this.x = bg.width/2.0;
  this.y = bg.height/2.0;
  this.speed = 10;
  this.name = name;
  this.pic = ron;
  
  var lname = name.toLowerCase();
  if(lname.indexOf("kathy") !== -1) {
    this.pic = kathy;
  } else if(lname.indexOf("tommy") !== -1) {
    this.pic = tommy;
  } else if(lname.indexOf("ruth") !== -1) {
    this.pic = ruth;
  } else {
    var picIndex = floor(random(0, randPics.length));
    this.pic = randPics[picIndex];
  }
}

var draw = function() {
    // functions: imageX(playerX), imageY(plyerY)
    // imageX(0) = width/2, imageX(bg.width) = -bg.width+width/2
    // imageY(0) = height/2, imageY(bg.height) = -bg.height+height/2
    imageMode(CORNER);
    image(bg, width/2 - me.x, height/2 - me.y);
    
    imageMode(CENTER);
    image(me.pic, width/2, height/2);
    
    if(keyPressed) {
      if(arrowLeft)   me.x -= me.speed;
      if(arrowRight)  me.x += me.speed;
      if(arrowUp)     me.y -= me.speed;
      if(arrowDown)   me.y += me.speed;
    }
};

void keyPressed() {
  console.log("pressed: " + keyCode);
  if(keyCode === LEFT)   arrowLeft = true;
  if(keyCode === RIGHT)  arrowRight = true;
  if(keyCode === UP)     arrowUp = true;
  if(keyCode === DOWN)   arrowDown = true;
}

void keyReleased() {
  console.log("released: " + keyCode);
  if(keyCode === LEFT)   arrowLeft = false;
  if(keyCode === RIGHT)  arrowRight = false;
  if(keyCode === UP)     arrowUp = false;
  if(keyCode === DOWN)   arrowDown = false;
}

void draw() {}
