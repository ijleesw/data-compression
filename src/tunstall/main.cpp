#include <iostream>
#include <fstream>
#include <stdio.h>
#include "tunstall.hpp"
#include "readfile.hpp"
using namespace std;
//using namespace crt;

typedef unsigned char uchar;


int main(int argc, char** argv)
{
	unsigned char* data;
	unsigned int size;

	if (argc < 4) {
		cout << "Usage: "<<argv[0]<<" <input path> <compression path> <decompression path>\n";
		return -1;
	}
	if (!readchar2buf(argv[1], data, &size)) {
		perror("File open error.\n");
		return -1;
	}
	ofstream compressed(argv[2]);
	ofstream decompressed(argv[3]);

	// 8: bits of each code symbol
	// 2: n_symbol^2 lookup tables
	Tunstall t = Tunstall(8, 2);

	t.getProbabilities(data, size);
	t.createDecodingTables();
	t.createEncodingTables();
	int compressed_size;
	unsigned char *compressed_data = t.compress(data, size, compressed_size);
	
	/* compressed.write(t.probabilities.size()); */
	//cout << "# of symbol: " << t.probabilities.size() << "\n";
	compressed << (unsigned char)t.probabilities.size();// << '\n';

	/* compressed.writeArray(t.probabilities.size()*2, (uchar *)t.probabilities.data()); */
	int tmp_size = t.probabilities.size();
	//compressed << "(symbol,prob): \n";
	for (int i = 0; i < tmp_size; i++) compressed << (unsigned char)t.probabilities[i].symbol << (unsigned char)t.probabilities[i].probability;
	//compressed << '\n';

	/* compressed.write<int>(size); */
	/* compressed.write<int>(compressed_size); */

	/* compressed.writeArray<unsigned char>(compressed_size, compressed_data); */
	for (int i = 0; i < compressed_size; i++) compressed << (unsigned char)compressed_data[i];

	compressed.close();


	//delete []compressed_data;
	//return compressed_size;
	compressed_size =  1 + t.probabilities.size()*2 /*+ 4 + 4*/ + compressed_size;





	int nsymbols = t.probabilities.size();
	void *probs = t.probabilities.data();
	t.probabilities.resize(nsymbols);
	memcpy(t.probabilities.data(), probs, nsymbols*2);
	t.createDecodingTables();
	unsigned char* output = (uchar*)malloc((size+1)*sizeof(uchar));
	if(size) {
		cout << "";
		//cout << "> start decompress\n";
		t.decompress(compressed_data, compressed_size, output, size);
		//cout << "> finish decompress\n";
	}

/*
	const char* ans[2] = {"false", "true"};
	int res = 1;

	for (int i = 0; i < size; i++) if (output[i]-data[i] != 0) res = 0;
*/
	for (int i = 0; i < size; i++) decompressed << output[i];


	decompressed.close();



	//for (int i = 0; i < size; i++) if (output[i] - data[i] != 0) areSame = false;

/*
    printf("============Tunstall Coding============\n");
    printf("original file: %s\n", argv[1]);
    printf("original size: %d\n\n", size);

    printf("compressed file: %s\n", argv[2]);
    printf("compressed size: %d\n", compressed_size);
    printf("compression ratio: %.5f\n\n", (double)size/compressed_size);

    printf("decompressed file: %s\n", argv[3]);
    printf("is same as original: %s\n", ans[res]);
*/


	//delete []compressed_data;
	return 0;
}