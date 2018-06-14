#!/usr/bin/python
# -*- coding: UTF-8 -*-

from .utils import *

#txt; text
#s: offset, max. value for searchBuffer
#t: length, max. value for lookahead buffer
#m; smallest match length (minimum length)
def encode(txt, s, t, m):

    #--------INITIALIZATION--------
    searchBuffer = ""
    lookahead = txt[:t]
    txt = txt[t:]
    tokens = []

    bs = 0
    numberBitsSimple = getNumbersOfBitsPerLetter(txt) + 1

    charsToTake = 0
    while len(lookahead) > 0:

        offset = 0
        length = 0
        flagBit = 0
        tmpSubstring = lookahead
        #Search for matches in the search buffer of the lookahead
        while(len(tmpSubstring) >= m):

            index = findSubstring(searchBuffer, tmpSubstring)
            if(index != -1):
                offset = len(searchBuffer) - index
                length = len(tmpSubstring)
                flagBit = 1
                break

            else:
                tmpSubstring = tmpSubstring[:-1]

        if(flagBit == 0):
            #Simple token!
            newletter = lookahead[0]
            token = (0, newletter)
            searchBuffer = searchBuffer +  newletter
            charsToTake = 1

            bs = bs + numberBitsSimple

        else:
            #Triplet!
            token = (1, offset, length)
            searchBuffer = searchBuffer + tmpSubstring
            charsToTake = length

            bs = bs + getNumbersBitsPerTokenLZSS(offset, length)

        searchBuffer = searchBuffer[-s:]

        tokens.append(token)

        lookahead = lookahead[charsToTake:]
        lookahead = lookahead + txt[:charsToTake]

        txt = txt[charsToTake:]

    bsTotal = bs/len(tokens)
    return (bsTotal, tokens)


#tok: list tokens
def decode(tok):

    decoded = ""
    for token in tok:

        flagBit = token[0]
        if flagBit == 0:
            decoded = decoded + token[1]

        else:
            offset = token[1]
            length = token[2]

            start = len(decoded) - offset
            end = start + length
            stringToAdd = decoded[start:end]

            stringToAdd = stringToAdd[:length]

            decoded = decoded + stringToAdd

    return decoded
