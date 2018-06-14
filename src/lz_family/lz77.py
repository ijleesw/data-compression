#!/usr/bin/python
# -*- coding: UTF-8 -*-

from .utils import *
import math

#txt; text
#s: offset, max. value for searchBuffer
#t: length, max. value for lookahead buffer
def encode(txt, s, t):

    bs = getNumberOfBitsPerToken(txt, s, t)

    #--------INITIALIZATION--------
    searchBuffer = ""
    lookahead = txt[:t]
    txt = txt[t:]
    tokens = []

    charsToTake = 0
    while len(lookahead) > 0:

        offset = 0
        length = 0
        tmpSubstring = lookahead[:-1]
        while(len(tmpSubstring) > 1):

            index = findSubstring(searchBuffer, tmpSubstring)
            if(index != -1):
                offset = len(searchBuffer) - index
                length = len(tmpSubstring)
                break

            else:
                tmpSubstring = tmpSubstring[:-1]

        firstChar = lookahead[length]

        # APPENDING TOKEN
        if(length > 1):
            searchBuffer = searchBuffer +  tmpSubstring + firstChar
        else:
            searchBuffer = searchBuffer +  firstChar

        searchBuffer = searchBuffer[-s:]

        tokens.append((offset, length, firstChar))
        charsToTake = length + 1
        lookahead = lookahead[charsToTake:]
        lookahead = lookahead + txt[:charsToTake]
        txt = txt[length + 1:]

    return (bs, tokens)


#tok: list tokens
def decode(tok):

    decoded = ""
    for token in tok:
        #print ""
        #print "Decoded until now: " + decoded
        offset = token[0]
        length = token[1]
        if(offset == 0):
            decoded = decoded + token[2]

        else:

            start = len(decoded) - offset
            end = start + length
            stringToAdd = decoded[start:end]

            stringToAdd = stringToAdd[:length]
            decoded = decoded + stringToAdd + token[2]
    return decoded
