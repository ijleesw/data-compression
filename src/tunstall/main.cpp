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


	/******************************
	 *
	 *  Compression
	 *
	 ******************************/

	t.getProbabilities(data, size);
	t.createDecodingTables();
	t.createEncodingTables();
	int compressed_size;
	unsigned char *compressed_data = t.compress(data, size, compressed_size);
	
	compressed << (unsigned char)t.probabilities.size();
	int tmp_size = t.probabilities.size();
	for (int i = 0; i < tmp_size; i++) compressed << (unsigned char)t.probabilities[i].symbol << (unsigned char)t.probabilities[i].probability;
	
	compressed << size;
	compressed << compressed_size;

	for (int i = 0; i < compressed_size; i++) compressed << (unsigned char)compressed_data[i];

	compressed.close();

	compressed_size =  1 + t.probabilities.size()*2 + 4 + 4 + compressed_size;



	/******************************
	 *
	 *  Decompression
	 *
	 ******************************/

	int nsymbols = t.probabilities.size();
	void *probs = t.probabilities.data();
	t.probabilities.resize(nsymbols);
	memcpy(t.probabilities.data(), probs, nsymbols*2);
	t.createDecodingTables();
	unsigned char* output = (uchar*)malloc((size+1)*sizeof(uchar));
	if(size) {
		cout << "";
		t.decompress(compressed_data, compressed_size, output, size);
	}

	for (int i = 0; i < size; i++) decompressed << output[i];

	decompressed.close();

	return 0;
}