/* @pjs preload="processing/nlmg/data/cottages.jpg,processing/nlmg/data/kathy_transparent.png,processing/nlmg/data/tommy_transparent.png,processing/nlmg/data/ruth_transparent.png,processing/nlmg/data/daniel_radcliffe_transparent.png,processing/nlmg/data/emma_watson_transparent.png,processing/nlmg/data/rupert_grint_transparent.png"; */

var bg, kathy, tommy, ruth, harry, hermione, ron;
var characterPics = [];

var nameFont = createFont("arial black", 20);
var messageFont = createFont("Verdana", 24);

var arrowUp = false, arrowDown = false, arrowLeft = false, arrowRight = false;
var characterSize = 80;
var me;

void setup() {
  size(400, 400);
  frameRate(30);
  imageMode(CENTER);
  background(0, 0, 0);
  
  fill(0);
  textAlign(CENTER);
  textFont(messageFont);
  text("Loading...", width/2, height/2);
  
  bg = requestImage("processing/nlmg/data/cottages.jpg");
  kathy = requestImage("processing/nlmg/data/kathy_transparent.png");
  tommy = requestImage("processing/nlmg/data/tommy_transparent.png");
  ruth = requestImage("processing/nlmg/data/ruth_transparent.png");
  harry = requestImage("processing/nlmg/data/daniel_radcliffe_transparent.png");
  hermione = requestImage("processing/nlmg/data/emma_watson_transparent.png");
  ron = requestImage("processing/nlmg/data/rupert_grint_transparent.png");
  characterPics = [kathy, tommy, ruth, harry, hermione, ron];
  
  me = new Person("kathy");
}

var Person = function(name, x, y) {
  this.x = x ? x : bg.width/2.0;
  this.y = y ? y : bg.height/2.0;
  this.speed = 10;
  this.name = name ? name : document.getElementById("nameInput").value;
  this.message = document.getElementById("messageInput").value;
  this.pic = kathy;
  
  this.updatePic = function() {
    var lname = this.name.toLowerCase();
    if(lname.indexOf("kathy") !== -1) {
      this.pic = kathy;
    } else if(lname.indexOf("tommy") !== -1) {
      this.pic = tommy;
    } else if(lname.indexOf("ruth") !== -1) {
      this.pic = ruth;
    } else if(lname.indexOf("ron") !== -1 || lname.indexOf("weasley") !== -1 || lname.indexOf("rupert1") !== -1 || lname.indexOf("grint") !== -1) {
      this.pic = ron;
    } else if(lname.indexOf("hermione") !== -1 || lname.indexOf("grainger") !== -1 || lname.indexOf("emma") !== -1 || lname.indexOf("watson") !== -1) {
      this.pic = hermione;
    } else if(lname.indexOf("harry") !== -1 || lname.indexOf("potter") !== -1 || lname.indexOf("daniel") !== -1 || lname.indexOf("radcliffe") !== -1) {
      this.pic = harry;
    } else {
      var picIndex = floor(random(0, characterPics.length));
      this.pic = characterPics[picIndex];
    }
  }
  
  this.updatePic();
}

var draw = function() {
    console.log("frame: " + frameCount);
    // draw empty background
    colorMode(HSB);
    background(frameCount%255, 255, 255);
    colorMode(RGB);
    
    // if background hasn't loaded yet, say so
    if(bg === null) {
      fill(0);
      textFont(messageFont);
      text("Loading...", width/2, height/2);
      console.log("still loading bg");
      return;
    }
    
    // draw background
    // functions: imageX(playerX), imageY(plyerY)
    // imageX(0) = width/2, imageX(bg.width) = -bg.width+width/2
    // imageY(0) = height/2, imageY(bg.height) = -bg.height+height/2
    imageMode(CORNER);
    image(bg, width/2 - me.x, height/2 - me.y);
    
    // draw character
    imageMode(CENTER);
    if(me.pic !== null) {
      image(me.pic, width/2, height/2, characterSize, characterSize);
    } else {
      fill(255);
      textFont(messageFont, 36);
      text("☻\nname\nyourself", width/2, height/2);
    }
    
    console.log("  mid: " + frameCount);
    
    // draw name
    fill(255);
    textFont(nameFont);
    text(me.name, width/2, height/2 + characterSize/2 + (textAscent() + textDescent())*1.2);
    
    // draw message
    textFont(messageFont);
    text(me.message, width/2, height/2 - characterSize/2 - (textAscent() - textDescent())*2);
    
    // move
    if(keyPressed) {
      if(arrowLeft)   me.x -= me.speed;
      if(arrowRight)  me.x += me.speed;
      if(arrowUp)     me.y -= me.speed;
      if(arrowDown)   me.y += me.speed;
      
      if(me.x < 0) me.x = 0;
      if(me.x >= bg.width) me.x = bg.width - 1;
      if(me.y < 0) me.y = 0;
      if(me.y >= bg.height) me.y = bg.height - 1;
    }
    
    // detect name change
    var nameInput = document.getElementById("nameInput").value;
    if(nameInput != me.name) {
      me.name = nameInput;
      me.updatePic();
    }
    
    // detect message change
    var messageInput = document.getElementById("messageInput").value;
    if(messageInput != me.message) {
      me.message = messageInput;
    }
    console.log("  end: " + frameCount);
};

void keyPressed() {
  if(keyCode === LEFT)   arrowLeft = true;
  if(keyCode === RIGHT)  arrowRight = true;
  if(keyCode === UP)     arrowUp = true;
  if(keyCode === DOWN)   arrowDown = true;
}

void keyReleased() {
  if(keyCode === LEFT)   arrowLeft = false;
  if(keyCode === RIGHT)  arrowRight = false;
  if(keyCode === UP)     arrowUp = false;
  if(keyCode === DOWN)   arrowDown = false;
}

void draw() {}
