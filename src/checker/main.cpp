#include <iostream>
#include <cstdio>
#include <iomanip>
#include <string.h>
#include <set>
#include "readfile.hpp"
typedef unsigned char uchar;
using namespace std;

int ceil_log2(int);
int symbol_counter(uchar*);

int main(int argc, char** argv)
{
	uchar* original;
	uchar* compressed;
	uchar* decompressed;
	int o_numofsymbols;
	int c_numofsymbols;
	long o_length, o_actual_length;
	long c_length, c_actual_length;
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
	o_actual_length = o_length * ceil_log2(o_numofsymbols) / 8;
	c_numofsymbols = symbol_counter(compressed);
	c_actual_length = c_length * ceil_log2(c_numofsymbols) / 8;

	ratio = (double)c_length/o_length;

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
		printf("%ld(%ld, %d) -> %ld(%ld, %d)   Ratio: %.3f%% (%.3f%%)]\n",
			    o_length, o_actual_length, o_numofsymbols, c_length, c_actual_length, c_numofsymbols,
			    100*ratio, (double)100*c_actual_length/o_actual_length);
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
/*
	cout << endl;
	for (auto &iter: s) cout << (int)iter << " ";
	cout << endl;
*/
	return s.size();
}

int ceil_log2(int n) {
  int last = -1, secondlast = -1, count = 0;
  int log2_n, tmp = n;

  while (tmp) {
    if (tmp & 1) {
      secondlast = last;
      last = count;
    }
    tmp >>= 1;
    ++count;
  }
  if (secondlast == -1)
    log2_n = last;
  else
    log2_n = last+1;

  return log2_n;
}