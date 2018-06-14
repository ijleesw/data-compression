#!/usr/bin/python
# -*- coding: UTF-8 -*-

from .utils import *

#Encodes using the LZ78 algorithm
#txt: Text to encode
def encode(txt):

    dic = {"": 0}
    tokens = []

    bs = 0
    bitsPerLetter = getNumbersOfBitsPerLetter(txt)

    word = ""
    while len(txt) > 0:

        #LOOK FOR LARGEST PREFIX
        tupl = getLargestPrefixPointer(txt, dic)

        pref = tupl[0]
        pointer = tupl[1]

         #Update txt
        txt = txt[len(pref):]
        #print "Prefix: " + pref
        firstChar = txt[0]
        txt = txt[1:]

        #Add token
        newToken = (pointer, firstChar)
        tokens.append(newToken)
        bs = bs + getNumberOfBitsPerTokenLZ78(pointer, bitsPerLetter)

        #Update dictionary
        dic[pref + firstChar] = len(dic)

    bsTotal = bs/len(tokens)
    return (bsTotal, tokens)


#Decodes LZ78 encoded tokens.
def decode(tokens):

    dic = {"": 0}
    decoded = ""

    #Generate dictionary
    for tok in tokens:

        pointer = tok[0]
        c = tok[1]

        word = findKeyOfValue(dic, pointer)
        if(word == None):
            newWord =  c
        else:
            newWord = word + c

        dic[newWord] = len(dic)
        decoded = decoded + newWord

    return decoded
