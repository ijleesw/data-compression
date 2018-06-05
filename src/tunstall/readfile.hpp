#ifndef READFILE_HPP_
#define READFILE_HPP_

#include <fstream>
#include <string.h>
using namespace std;


/*************************************
 *
 *  Function prototypes
 *
 *************************************/

int readchar2buf(const char* path, unsigned char*& buf, unsigned int* length);
int readint2buf(const char* path, unsigned char*& buf, unsigned int* length);


/*************************************
 *
 *  Function definitions
 *
 *************************************/

/*
 * readchar2buf - Read char from `path` to `buf`,
 *                length of sequence is stored in `*length`.
 *                Return 1 on success, 0 on fail.
 */
int readchar2buf(const char* path, unsigned char*& buf, unsigned int* length)
{
	ifstream inFile;
	inFile.open(path, ios::in|ios::binary|ios::ate);
	if (!inFile.is_open()) return 0;

	inFile.seekg(0, ios::end);
	unsigned int size = inFile.tellg();
	inFile.seekg(0, ios::beg);

	buf = new unsigned char[size+1];
	inFile.read((char*)buf, size);
	buf[size] = '\0';
	*length = strlen((char*)buf);

	return 1;
}


/*
 * readint2buf - Read char from `path` to `buf`.
 *               length of sequence is stored in `*length`.
 *               Return 1 on success, 0 on fail.
 */
int readint2buf(const char* path, unsigned char*& buf, unsigned int* length)
{
	int tmp;
	unsigned int cnt = 0;
	ifstream inFile;

	inFile.open(path);
	if (!inFile.is_open()) return 0;

	*length = 0;
	while (inFile >> tmp) (*length) = (*length)+1;
	inFile.seekg(0, ios::beg);

	buf = new unsigned char[(*length)+1];
	while (inFile >> tmp) buf[cnt++] = tmp;
	buf[cnt] = '\0';

	return 1;
}

#endif /* READTEXT_HPP_ */