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

int readchar2buf(const char* _path_, char*& buf, long* length);
int readbyte2buf(const char* _path_, unsigned char*& buf, long* length);
int readint2buf(const char* _path_, int*& buf, long* length);


/*************************************
 *
 *  Function definitions
 *
 *************************************/

/*
 * readchar2buf - Read char from `_path_` to `buf`,
 *                length of sequence is stored in `*length`.
 *                Return 1 on success, 0 on fail.
 */
int readchar2buf(const char* _path_, char*& buf, long* length)
{
	ifstream inFile;
	inFile.open(_path_);
	if (!inFile.is_open()) return 0;

	inFile.seekg(0, ios::end);
	long size = inFile.tellg();
	inFile.clear();
	inFile.seekg(0, ios::beg);

	buf = new char[size+1];
	inFile.read(buf, size);
	buf[size] = '\0';
	*length = strlen(buf);

	inFile.close();
	return 1;
}


/*
 * readbyte2buf - Read byte from `_path_` to `buf`,
 *                length of sequence is stored in `*length`.
 *                Return 1 on success, 0 on fail.
 */
int readbyte2buf(const char* _path_, unsigned char*& buf, long* length)
{
	ifstream inFile;
	inFile.open(_path_);
	if (!inFile.is_open()) return 0;

	inFile.seekg(0, ios::end);
	long size = inFile.tellg();
	inFile.clear();
	inFile.seekg(0, ios::beg);

	buf = new unsigned char[size+1];
	inFile.read((char*)buf, size);
	buf[size] = '\0';
	*length = size;

	inFile.close();
	return 1;
}


/*
 * readint2buf - Read int from `_path_` to `buf`.
 *               length of sequence is stored in `*length`.
 *               Return 1 on success, 0 on fail.
 */
int readint2buf(const char* _path_, int*& buf, long* length)
{
	long tmp;
	long cnt = 0;
	ifstream inFile;

	inFile.open(_path_);
	if (!inFile.is_open()) return 0;

	*length = 0;
	while (inFile >> tmp) (*length)++;
	cout << *length << endl;
	inFile.clear();
	inFile.seekg(0, ios::beg);

	buf = new int[*length];
	while (inFile >> tmp) buf[cnt++] = tmp;

	inFile.close();
	return 1;
}


#endif /* READFILE_HPP_ */