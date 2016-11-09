/* starfield.c
 *
 * prints a simple ascii starfield
 *
 * Usage:
 *
 * gcc starfield.c -o starfield
 * ./starfield 10 # generate 10 rows, 80 columns, 10% density
 * ./starfield 50 20 # generate 20 rows, 80 columns, 50% density
 * ./starfield 60 20 100 # generate 20 rows, 80 columns, 60% density
 *
 * by ~vilmibm for the tilde.town zine, issue 1
 *
 * this code is in the public domain.
 *
 */
#include<stdio.h>
#include<time.h>
#include<stdlib.h>

const int COLS = 80;
const int ROWS = 10;
const int DENSITY = 10;

int main(int argc, char *argv[]) {
    int r, x, y;
    int rows = ROWS;
    int density = DENSITY;
    int cols = COLS;

    srand(time(NULL));

    if (2 == argc) {
        density = atoi(argv[1]);
    } else if (3 == argc) {
        density = atoi(argv[1]);
        rows = atoi(argv[2]);
    } else if (4 == argc) {
        density = atoi(argv[1]);
        rows = atoi(argv[2]);
        cols = atoi(argv[3]);
    }

    if (density > 100 || density < 1) {
        printf("Density must be between 0 and 100; got '%d'\n", density);
        exit(1);
    }

    for (y = 0; y < rows; y++) {
        for (x = 0; x < cols; x++) {
            r = rand() % 100;
            if (r < density) {
                printf("*");
            } else {
                printf(" ");
            }
        }
        printf("\n");
    }
}
