#include <iostream>
#include <cstdio>
#include <iomanip>
#include <string.h>
#include <set>
#include "readfile.hpp"
typedef unsigned char uchar;
using namespace std;

int symbol_counter(uchar*);

int main(int argc, char** argv)
{
	uchar* original;
	uchar* compressed;
	uchar* decompressed;
	int o_numofsymbols;
	int c_numofsymbols;
	long o_length;
	long c_length;
	long d_length;
	double ratio;
	bool is_same = true;
	bool skip = false;
	string result;


	if (argc != 5) {
		cout << "Usage: "<<argv[0];
		cout << " <data name> <original file path> <compressed file path> <decompressed file path (or -skip)>\n";
		return -1;
	}
	if (strcmp(argv[4], "-skip") == 0) skip = true;

	cout << argv[1] << ": ";

	if (!readbyte2buf(argv[2], original, &o_length)) {
		perror("File open error");
		return -1;
	}
	if (!readbyte2buf(argv[3], compressed, &c_length)) {
		perror("File open error");
		return -1;
	}

	o_numofsymbols = symbol_counter(original);
	c_numofsymbols = symbol_counter(compressed);

	ratio = (double)o_length/c_length;

	if (!skip){
		if (!readbyte2buf(argv[4], decompressed, &d_length)) {
			perror("File open error");
			return -1;
		}

		if (o_length != d_length) is_same = false;

		if (is_same) {
		for (long i = 0; i < o_length; i++) {
			if (original[i] != decompressed[i]) {
				is_same = false;
				break;
			}
		}
		}
	}

	if (is_same) {
		printf("%d(%d) -> %d(%d) (%.5f:1)\n", (int)o_length, o_numofsymbols, (int)c_length, c_numofsymbols, ratio);
	}
	else cout << "decompressed file not identical to the original file.\n";


	delete original;
	delete compressed;
	if (!skip) delete decompressed;

	return 0;
}

int symbol_counter(uchar* buf)
{
	set<uchar> s;
	int cnt = 0;
	while (buf[cnt] != '\0') s.insert(buf[cnt++]);
	return s.size();
}