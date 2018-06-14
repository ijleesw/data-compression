#!/usr/bin/python
# -*- coding: UTF-8 -*-

from .lz77 import encode as lz77_encode
from .lz77 import decode as lz77_decode
from .lz78 import encode as lz78_encode
from .lz78 import decode as lz78_decode
from .lzss import encode as lzss_encode
from .lzss import decode as lzss_decode

##--------------------------------------------------------------
##-------------------------- ENCODING --------------------------
##--------------------------------------------------------------

def encodeLZ77(txt, s, t):
    return lz77_encode(txt, s, t)

def decodeLZ77(tok):
    return lz77_decode(tok)


def encodeLZSS(txt, s, t, m):
    return lzss_encode(txt, s, t, m)

def decodeLZSS(tok):
    return lzss_decode(tok)


def encodeLZ78(txt):
    return lz78_encode(txt)

def decodeLZ78(tok):
    return lz78_decode(tok)


# def encodeLZW(txt):
#     return lzw.encode(txt)
#
# def decodeLZW(dic, tokens):
#     return lzw.decode(dic, tokens)
