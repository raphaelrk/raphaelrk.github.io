#include <math.h>
#include <float.h>
#include <stdio.h>
#include <stdlib.h>
#include "ppmio.h"

typedef struct _point {
  int x, y;
} point;

point make_point (int x, int y) {
  point p;
  p.x = x;
  p.y = y;
  return p;
}

point border[100][2];
int num_borders[2];
int imgW, imgH;
int FACE = 700;

double distance (point p1, point p2) {
  return sqrt((p1.x-p2.x)*(p1.x-p2.x) + (p1.y-p2.y)*(p1.y-p2.y));
}

pixel * draw_point (pixel * img, point p, int r, int g, int b, int var) {
  int x, y, index;
  if (p.x < var)        { p.x = var;        }
  if (p.x > imgW - var) { p.x = imgW - var; }
  if (p.y < var)        { p.y = var;        }
  if (p.y > imgH - var) { p.y = imgH - var; }
  for (x = p.x - var; x < p.x + var; x++) {
    for (y = p.y - var; y < p.y + var; y++) {
      index = x + (imgW * y);
      img[index].r = r;
      img[index].g = g;
      img[index].b = b;
    }
  }
  return img;
}

point find_center (pixel * img) {
  point left = make_point (imgW, 0);
  point right = make_point (0, 0);
  int x, y, index;
  int hit_face;
  // locate the left bound
  for (y = imgH*4/8; y < imgH*5/8; y++) {
    hit_face = 0;
    for (x = 0; x < left.x && !hit_face; x++) {
      index = x + (imgW * y);
      if (img[index].r + img[index].g + img[index].b < FACE) {
        left = make_point (x, y);
        hit_face = 1;
      }
    }
  }
  // locate the left bound
  for (y = imgH*4/8; y < imgH*5/8; y++) {
    hit_face = 0;
    for (x = imgW; x > right.x && !hit_face; x--) {
      index = x + (imgW * y);
      if (img[index].r + img[index].g + img[index].b < FACE) {
        right = make_point (x, y);
        hit_face = 1;
      }
    }
  }
  img = draw_point (img, left, 0, 255, 0, 2);
  img = draw_point (img, right, 0, 255, 0, 2);
  return make_point ((left.x + right.x)/2, (left.y + right.y)/2);
}

void find_border (pixel * img, int ind, int increment) {
  int angle;
  int steps, hit_background, in_bounds;
  int index;
  int intensity, dist;
  point center, current;
  double radian, slope;
  double x, y;
  center = find_center(img);
  //center = make_point(imgW/2, imgH/2);
  img = draw_point(img, center, 255, 0, 0, 3);
  num_borders[ind] = 0;
  for (angle = -75; angle < 255; angle += increment) {
    border[num_borders[ind]][ind] = make_point (-1, -1);
    steps = 0;
    if (angle == 90) {
      x = 0;
      y = 1;
    } else if (angle < 90) {
      radian = (double)(3.141529 * angle / 180);
      x = 1;
      y = tan(radian);
    } else {
      radian = (double)(3.141529 * angle / 180);
      x = -1;
      y = -tan(radian);
    }
    current = center;
    hit_background = 0;
    in_bounds = 1;
    while (!hit_background && in_bounds) {
      steps++;
      current = make_point (center.x + x*steps, center.y + y*steps);
      if (current.x <= 0 || current.x >= imgW || current.y <= 0 || current.y >= imgH) {
        in_bounds = 0;
      } else {
        index = current.x + (imgW * current.y);
        intensity = img[index].r + img[index].g + img[index].b;
        dist = distance(center, current);
        if (intensity > FACE &&  dist > imgW/4 && dist < imgW*0.6) {
          border[num_borders[ind]][ind] = current;
          img = draw_point(img, current, 0, 0, 255, 3);
          hit_background = 1;
        }
      }
    }
    num_borders[ind]++;
  }
}

int main (int argc, char **argv) {
  int i;
  int interval = 15;
  pixel * image1;
  pixel * image2;
  for (i = 0; i < 100; i++) {
    border[i][0] = make_point (-1, -1);
    border[i][1] = make_point (-1, -1);
  }
  image1 = ppmread(argv[1], &imgW, &imgH);
  image2 = ppmread(argv[2], &imgW, &imgH);
  do {
    find_border(image1, 0, 15);
    find_border(image2, 1, 15);
    interval += 15;
  } while (num_borders[0] != num_borders[1] && interval <= 45);
  ppmwrite("border.ppm", imgW, imgH, image1);
  return 1;
}
