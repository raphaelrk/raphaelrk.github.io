void setup() {
  size(400, 400);
  frameRate(30);
  background(255, 0, 0);
}

var draw = function() {
  stroke(0);
  point(random(0, 400), random(0, 400));
}
