#!/usr/bin/python
# -*- coding: UTF-8 -*-

import math
import codecs

#Extracts the text from a file.
def readFromFile(filein, encoding):

    file = codecs.open(filein, 'r', encoding=encoding)
    contents = file.read()
    file.close()
    return contents


def writeToFile(fileout, contents, encoding):

    file = codecs.open(fileout, 'w', encoding=encoding)
    file.write(contents)
    file.close()
    return


def getNumbersOfBitsPerLetter(txt):

    numbLetters = len(list(set(txt)))
    return math.ceil(math.log(numbLetters, 2))


def findSubstring(s, char):

    index = 0

    if char in s:
        c = char[0]
        for ch in s:
            if ch == c:
                if s[index:index+len(char)] == char:
                    return index

            index = index + 1

    return -1

def getNumberOfBitsPerToken(txt, s, t):

    bOffset = math.ceil(math.log(s + 1, 2))
    bLength = math.ceil(math.log(t, 2))
    bChar = getNumbersOfBitsPerLetter(txt)

    return bOffset + bLength + bChar

def getNumberOfBitsPerTokenLZ78(tokenKey, ba):

    bEntry = getNumberOfBitsPerEntry(tokenKey)
    return bEntry + ba

#Searches for largest prefix for txt from the dictionary
def getLargestPrefixPointer(txt, dic):

    largestPref = ""
    pointer = 0
    for key, val in dic.items():
        if((txt.startswith(key)) and (len(key) > len(largestPref)) and (len(txt) - len(key) > 0)):
            largestPref = key
            pointer = val

    return (largestPref, pointer)


def getNumbersBitsPerTokenLZSS(offset, length):

    bOffset = math.ceil(math.log(offset, 2))
    bLength = math.ceil(math.log(length, 2))
    return bOffset + bLength + 1



def getNumberOfBitsPerEntry(value):

    if(value == 0):
        return 0
    return math.ceil(math.log(value, 2))


#Returns pointer (index) of the specified key
def getPointer(value, dic):

    if(value in dic):
        return dic.get(value)

    print("Error: Key not found. Are you sure it is contained in the dictionary?")


#Given a dictionary, finds the key of a value
def findKeyOfValue(dic, value):

    for key, val in dic.items():
        if(val == value):
            return key

    print ("Error. Value not found in dictionary.")
    return None
