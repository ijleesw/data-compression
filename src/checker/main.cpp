#include <iostream>
#include <iomanip>
#include "readfile.hpp"
typedef unsigned char uchar;
using namespace std;

int main(int argc, char** argv)
{
	uchar* original;
	uchar* compressed;
	uchar* decompressed;
	long o_length;
	long c_length;
	long d_length;
	double ratio;
	bool is_same = true;
	string result;


	if (argc != 5) {
		cout << "Usage: "<<argv[0];
		cout << " <data name> <original file path> <compressed file path> <decompressed file path>\n";
		return -1;
	}

	cout << argv[1] << ": ";

	if (!readbyte2buf(argv[2], original, &o_length)) {
		perror("File open error");
		return -1;
	}
	if (!readbyte2buf(argv[3], compressed, &c_length)) {
		perror("File open error");
		return -1;
	}
	if (!readbyte2buf(argv[4], decompressed, &d_length)) {
		perror("File open error");
		return -1;
	}


	ratio = (double)o_length/c_length;

	if (o_length != d_length) is_same = false;

	if (is_same) {
	for (long i = 0; i < o_length; i++) {
		if (original[i] != decompressed[i]) {
			is_same = false;
			break;
		}
	}
	}

	if (is_same) cout <<o_length<<" -> "<<c_length<<" ("<<fixed<<setprecision(5)<<ratio<<":1)\n";
	else cout << "decompressed file not identical to the original file.\n";


	delete original;
	delete compressed;
	delete decompressed;

	return 0;
}