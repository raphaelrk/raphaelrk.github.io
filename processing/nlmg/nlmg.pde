/* @pjs preload="processing/nlmg/data/cottages.jpg,processing/nlmg/data/kathy_transparent.png,processing/nlmg/data/tommy_transparent.png,processing/nlmg/data/ruth_transparent.png,processing/nlmg/data/daniel_radcliffe_transparent.png,processing/nlmg/data/emma_watson_transparent.png,processing/nlmg/data/rupert_grint_transparent.png"; */

var bg, kathy, tommy, ruth, harry, hermione, ron;

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
