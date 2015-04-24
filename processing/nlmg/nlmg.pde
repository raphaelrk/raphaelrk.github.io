/* @pjs preload="cottages.jpg,kathy_transparent.png,tommy_transparent.png,ruth_transparent.png,daniel_radcliffe_transparent.png,emma_watson_transparent.png,rupert_grint_transparent.png"; */

PImage bg, kathy, tommy, ruth, harry, hermione, ron;

void setup() {
    size(400, 400);
    frameRate(30);
    imageMode(CENTER);
    background(0, 0, 0);

    fill(0);
    textAlign(CENTER);
    text("Loading...", width/2, height/2);

    PImage bg = loadImage("cottages.jpg");
    PImage kathy = requestImage("kathy_transparent.png");
    PImage tommy = requestImage("tommy_transparent.png");
    PImage ruth = requestImage("ruth_transparent.png");
    PImage harry = requestImage("daniel_radcliffe_transparent.png");
    PImage hermione = requestImage("emma_watson_transparent.png");
    PImage ron = requestImage("rupert_grint_transparent.png");
}

var draw= function() {
    for(var x=10; x<400;x+=20){
        for (var y=10; y<400;y+=20){
            fill(random(0,255),random(0,195), random(0,50));
         ellipse(x,y,20,20);
        }
    }

    image(bg, 50, 50, 100,100);
};

void draw() {
  
}
