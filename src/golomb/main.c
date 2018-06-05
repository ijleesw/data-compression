#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include "encode.h"

#define INPUTSZ 4

char *hex2bin[] = {
    "0000", "0001", "0010", "0011",
    "0100", "0101", "0110", "0111",
    "1000", "1001", "1010", "1011",
    "1100", "1101", "1110", "1111"
};

extern char *readFile(char *fileName);

int main (int argc, char** argv)
{
    unsigned int *out;
    unsigned long outsize;
    unsigned char *decoded;
    unsigned char *ge, *gd;
    unsigned long ge_size, gd_size;
    unsigned int golomb_param;
    unsigned long decoded_size;
    //unsigned char input[] = { 1, 5, 4, 5 };
    //unsigned char str[] = {0, 0, 0, 0, 8, 2, 20, 128, 30};
    //unsigned char input[INPUTSZ];
    int i;
    int inputsz = INPUTSZ;

    srand (time(NULL));


    unsigned char* buf;

    if (argc < 4) {
        printf("Usage: %s <input path> <compression path> <decompression path>\n", argv[0]);
        return -1;
    }
    if (!(buf = (unsigned char*)readFile(argv[1]))) {
        perror("File open error.\n");
        return -1;
    }
    inputsz = strlen((char*)buf);

    //for (int i = 0; i < inputsz; i++) {
        //printf("%d ",(unsigned char)buf[i]);
    //}
    //printf("length: %d\n",inputsz);
    unsigned char *input = buf;




    //printf ("testing golomb encoding\n");
    if (golomb_encode (input, inputsz, (void*)&ge, &ge_size, &golomb_param) ) {
        printf ("golomb encoding failed\n");
    } else {

        //printf ("g-e param: %d, g-e chars: ", golomb_param);

        for (i = 0; i < ge_size; ++i) {
            //printf ("%s %s ",  hex2bin[ge[i] >> 4], hex2bin[ge[i] & 0x0f]);
            //printf(" ... => %d\n", ge[i]);
        }
        //printf ("ge_size = %lu\n", ge_size);

        //printf ("writing compressed data to file ...\n");
        FILE *compressed = fopen(argv[2], "w");
        for (int i = 0; i < ge_size; i++) {
            fputc(ge[i], compressed);
            //printf ("finished %dth\n", i+1); fflush(stdout);
        }
        //printf ("writing finished.\n");
        
        fclose(compressed);


        if (golomb_decode (ge, ge_size, golomb_param, (void*)&gd, &gd_size)) {
            printf ("golomb decoding failed\n");
        } else {
            
            if (gd_size != inputsz) {
                //printf ("gd_size != inputsz/ gd_size = %d\n", gd_size);
                goto print_on_error;
            }

            for (i = 0; i < inputsz; ++i) {  // -------------(*)
                if (gd[i] != input[i]) {
                    //printf ("entry %d mismatches\n", i);
                    goto print_on_error;
                }
                /*else {
                    printf("gd[i] = %d, input[i] = %d\n", gd[i], input[i]);
                }*/
            }

            //printf ("writing decompressed data to file ...\n");
            FILE *decompressed = fopen(argv[3], "w"); 
            for (int i = 0; i < gd_size; i++) fputc(gd[i], decompressed);
            //printf ("writing finished.\n");

            fclose(decompressed);
        }
    }

/*
    printf("============Golomb Coding============\n");
    printf("original file: %s\n", argv[1]);
    printf("original size: %d\n\n", inputsz);

    printf("compressed file: %s\n", argv[2]);
    printf("compressed size: %d\n", ge_size);
    printf("compression ratio: %.5f\n\n", (double)inputsz/ge_size);

    printf("decompressed file: %s\n", argv[3]);
    printf("is same as original: true\n");  // already checked at (*)
*/

    return 0;

print_on_error:
    //printf ("Entered print_on_error.\n");
/*
    printf ("input unsigned chars: ");
    for (i = 0; i < inputsz; ++i)
        printf ("%d ", input[i]);
    printf ("\n");

    printf ("gd chars: ");
    for (i = 0; i < gd_size; ++i) 
        printf ("%d ", gd[i]);
    printf ("\n");*/
    return 0;
}


